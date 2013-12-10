package pts

import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.springframework.transaction.annotation.Transactional





class PlateService {

	def servletContext
	def grailsApplication

	def getPlateList(PlateType plateType, String intPlateId, String extPlateId, String projectId, GrailsParameterMap params) {
		
		def intPlateIdFilter = "%" + intPlateId + "%"
		def extPlateIdFilter = "%" + extPlateId + "%"

		def projectFilter

		if(Integer.valueOf(projectId) > 0) {
			projectFilter = Project.getAll([projectId])
		}
		else {
			projectFilter = Project.getAll()
		}

		def plateList = Plate.findAllByPlateTypeAndIntPlateIdIlikeAndExtPlateIdIlikeAndProjectInList(plateType, intPlateIdFilter, extPlateIdFilter, projectFilter, params)
		def plateListTotal =  Plate.countByPlateTypeAndIntPlateIdIlikeAndExtPlateIdIlikeAndProjectInList(plateType, intPlateIdFilter, extPlateIdFilter, projectFilter)

		// Extra code to check for childs that match criteria if no plate384 list is found. 
		// Priority is given to matching the external Id
		if (plateType.getName() == 'Plate384' && plateListTotal == 0) {
			def plateType96 = PlateType.findByName('Plate96')
			def plate96List = Plate.findAllByPlateTypeAndIntPlateIdIlikeAndExtPlateIdIlikeAndProjectInList(plateType96, intPlateIdFilter, extPlateIdFilter, projectFilter, params)

			// If children plate matches, display the plate-384s
			if(plate96List)
			{
				plateList = Plate.findAllByQ1PlateInListOrQ2PlateInListOrQ3PlateInListOrQ4PlateInList(plate96List, plate96List, plate96List, plate96List)
				plateListTotal = Plate.countByQ1PlateInListOrQ2PlateInListOrQ3PlateInListOrQ4PlateInList(plate96List, plate96List, plate96List, plate96List)
			}
		}		
		
		return [plateList, plateListTotal]
	}


	@Transactional(readOnly = true)
	def getMotherPlates(Plate plateInstance) {

		def motherq1plateList = Plate.findAllByQ1Plate(plateInstance)
		def motherq2plateList = Plate.findAllByQ2Plate(plateInstance)
		def motherq3plateList = Plate.findAllByQ3Plate(plateInstance)
		def motherq4plateList = Plate.findAllByQ4Plate(plateInstance)

		def motherPlateList = motherq1plateList + motherq2plateList + motherq3plateList + motherq4plateList
		def sortedMotherPlateList = motherPlateList.sort{
			it.intPlateId
		}

		return sortedMotherPlateList
	}

	@Transactional(readOnly = true)
	def getHighestPlateNumber(String intPlatePrefix){
		def plateSearchResult = Plate.findAllByIntPlateIdIlike("%" + intPlatePrefix + "%", [max: 1, sort: "intPlateId", order: "desc"])
		def plateHighestId = 0

		if	(!plateSearchResult.isEmpty()) {
			plateSearchResult = plateSearchResult.first().getIntPlateId()
			plateHighestId = Integer.parseInt(plateSearchResult.minus(intPlatePrefix))
		}

		return plateHighestId
	}

	def printLabel(Plate plateInstance) {

		def rootPath = ServletContextHolder.servletContext.getRealPath("/")
		def labelFilePath = rootPath + "labels/" + plateInstance.getIntPlateId() + ".cmd"

		def file = new File (labelFilePath)
		file << ("LABELNAME=\"C:\\LVWIN70\\SAMPLES\\PLATETEST2.LBL\"\n")
		file << ("PRINTER=\"ZDesigner ZM400 200 dpi (ZPL) on Ne00:\"\n")
		file << ("DATATYPE=DELIMITED\n")
		file << ("DELIMITER=,\n")
		file << ("FIELD=INTID1\n")
		file << ("FIELD=EXTID1\n")
		file << ("LABELDATA=THISFILE\n")
		file << (plateInstance.getIntPlateId() + "," + plateInstance.getExtPlateId() + "\n")

		return
	}

	def exportSample384CSV(Plate plateInstance, String format) {
		def rootPath = ServletContextHolder.servletContext.getRealPath("/")
		def filePath = rootPath + "files/csvTemplate.csv"

		def file = new File (filePath)

		file.newWriter()

		def q1Plate = plateInstance.getQ1Plate()
		def q2Plate = plateInstance.getQ2Plate()
		def q3Plate = plateInstance.getQ3Plate()
		def q4Plate = plateInstance.getQ4Plate()

		def sampleList = []

		for (i in 1..96) {
			def originalRow = (int) Math.floor((i-1) / 12)

			def q1WellPos = 2 * i - 1 + (24*(originalRow))
			def q2WellPos = 2 * i + (24*(originalRow))
			def q3WellPos = 24 + q1WellPos
			def q4WellPos = 24 + q2WellPos

			def q1Sample = Sample.findByWellNumberAndPlate(i, q1Plate)
			def q2Sample = Sample.findByWellNumberAndPlate(i, q2Plate)
			def q3Sample = Sample.findByWellNumberAndPlate(i, q3Plate)
			def q4Sample = Sample.findByWellNumberAndPlate(i, q4Plate)

			// Minus one because arrays start counting at 0
			sampleList[q1WellPos-1] = q1Plate.getIntPlateId() + ":" + q1Sample.getSampleId()
			sampleList[q2WellPos-1] = q2Plate.getIntPlateId() + ":" + q2Sample.getSampleId()
			sampleList[q3WellPos-1] = q3Plate.getIntPlateId() + ":" + q3Sample.getSampleId()
			sampleList[q4WellPos-1] = q4Plate.getIntPlateId() + ":" + q4Sample.getSampleId()

		}

		def index = 1
		char wellPosAlpha = 'A'
		def wellPosNum
		def well

		// Print header when necessary
		if (format == "list") {
			file << ("Well,WellNumber,SampleID\n")
		}

		for (sample in sampleList) {

			if (format == "list") {
				wellPosNum = index % 24

				if (wellPosNum == 0) {
					wellPosNum = 24
				}

				well = Character.toString(wellPosAlpha) + wellPosNum

				if (wellPosNum == 24) {
					wellPosAlpha = (char) (1 + wellPosAlpha)
				}

				file << (well + "," + index + "," + sample + "\n")
			}
			else if (format == "grid") {

				if(index % 24 == 0) {
					file << sample + "\n"
				}
				else {
					file << sample + ","
				}
			}

			index ++
		}

		return file
	}

	def exportSampleSequenome(Plate plateInstance) {
		def rootPath = ServletContextHolder.servletContext.getRealPath("/")
		def filePath = rootPath + "files/txtTemplate.txt"

		def file = new File (filePath)

		file.newWriter()

		def sampleList = plateInstance.getSamples()

		for (sample in sampleList) {
			file << (sample.getSampleId() + "\n")
		}

		return file
	}

	def exportSampleCSV(Plate plateInstance, String format) {
		def rootPath = ServletContextHolder.servletContext.getRealPath("/")
		def filePath = rootPath + "files/csvTemplate.csv"

		def file = new File (filePath)

		file.newWriter()

		def sampleList = plateInstance.getSamples()

		// Print header when necessary
		if (format == "list") {
			file << ("Well,WellNumber,SampleID\n")
		}

		// Print sample list
		for (sample in sampleList) {

			if (format == "list"){
				file << (sample.getWell() + "," + sample.getWellNumber() + "," + sample.getSampleId() + "\n")
			}

			else if (format == "grid") {

				if(sample.getWellNumber() % 12 == 0) {
					file << sample.getSampleId() + "\n"
				}
				else {
					file << sample.getSampleId() + ","
				}
			}
		}

		return file
	}

	def exportSampleExcel(Plate instance, String format) {
		def rootPath = ServletContextHolder.servletContext.getRealPath("/")
		def filePath = rootPath + "files/csvTemplate.csv"

		def file = new File (filePath)

		// Best to move this to Controller
		//		response.setHeader("Content-disposition", "attachment;filename=${file.getName()}")
		//		response.setContentType("application/excel")
		//
		//
		//		response.outputStream << file.newInputStream()
		//		response.outputStream.flush()
	}

	def exportPlateCSV(List plate384List, List plate96List, String intPlateID, String extPlateID, String project) {
		def rootPath = ServletContextHolder.servletContext.getRealPath("/")
		def filePath = rootPath + "files/csvTemplate.csv"

		def file = new File (filePath)

		file.newWriter()

		file << "Search Criteria\n"
		file << "Int_Plate_ID,Ext_Plate_ID,Project\n"
		file << intPlateID + "," + extPlateID + "," + project + "\n"
		file << "\n"
		
		file << "384-well Plates\n"

		if(plate384List.isEmpty()) {
			file << "No match found\n"
		}
		else {
			file << "Int_Plate_ID,Ext_Plate_ID,Rxn_Size,Enzyme_Used,PCR_Cond,Chip_ID,Created_Date,Project,Q1_Plate,Q2_Plate,Q3_Plate,Q4_Plate\n"
			for (plate in plate384List) {
				//def plate = Plate.findByIntPlateId(plateName)
				file << (plate.getIntPlateId() + "," +
				plate.getExtPlateId() + "," +
				plate.getReactionSize() + "," +
				plate.getEnzymeUsed() + "," +
				plate.getPcrCondition() + "," +
				plate.getChipId() + "," +
				plate.getCreatedDate().format("yyyy-MM-dd") + "," +
				plate.getProject() + "," +
				plate.getQ1Plate().getIntPlateId() + "," +
				plate.getQ2Plate().getIntPlateId() + "," +
				plate.getQ3Plate().getIntPlateId() + "," +
				plate.getQ4Plate().getIntPlateId() + "," + "\n")
			}
		}

		file << "\n"
		file << "96-well Plates\n"

		if(plate96List.isEmpty()) {
			file << "No match found\n"
		}
		else {
			file << "Int_Plate_ID,Ext_Plate_ID,Rxn_Size,Enzyme_Used,PCR_Cond,Chip_ID,Created_Date,Project\n"
			for (plate in plate96List) {
				//def plate = Plate.findByIntPlateId(plateName)
				file << (plate.getIntPlateId() + "," +
				plate.getExtPlateId() + "," +
				plate.getReactionSize() + "," +
				plate.getEnzymeUsed() + "," +
				plate.getPcrCondition() + "," +
				plate.getChipId() + "," +
				plate.getCreatedDate().format("yyyy-MM-dd") + "," +
				plate.getProject() + "," + "\n")
			}
		}
		return file
	}
}
