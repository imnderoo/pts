package pts

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

class SampleService {

	def servletContext
	def grailsApplication

	def getSampleList(String sampleId, String intPlateId, GrailsParameterMap params) {

		def sampleIdFilter = sampleId ?: ""
		sampleIdFilter = "%" + sampleIdFilter + "%"

		def sampleList = ""
		def sampleListTotal = 0

		if (intPlateId) {
			def intPlateIdFilter = intPlateId ?: ""
			intPlateIdFilter = "%" + intPlateIdFilter + "%"

			def plateList = Plate.findAllByIntPlateIdIlike(intPlateIdFilter)

			if(plateList) {
				sampleList = Sample.findAllBySampleIdIlikeAndPlateInList(sampleIdFilter, plateList, params)
				sampleListTotal =  Sample.countBySampleIdIlikeAndPlateInList(sampleIdFilter, plateList, params)
			}
		}
		else {
			sampleList = Sample.findAllBySampleIdIlike(sampleIdFilter, params)
			sampleListTotal = Sample.countBySampleIdIlike(sampleIdFilter, params)
		}
		
		return [sampleList, sampleListTotal]
	}
}
