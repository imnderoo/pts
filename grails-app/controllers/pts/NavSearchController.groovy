package pts

import grails.converters.JSON

class NavSearchController {

	def searchPlate96() {
		def plateType = PlateType.findByName("Plate96")
		def likes = Plate.findAllByIntPlateIdIlikeAndPlateType("${params.term}%", plateType)
		//log.error(likes.size())
		def r = likes.collect({[id:it.id,value:it.intPlateId]})
		render r as JSON
	}
}
