package pts

import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.springframework.transaction.annotation.Transactional


class PlateService {

	def servletContext
	def grailsApplication

	@Transactional(readOnly = true)
	def getMotherPlates(Plate plateInstance) {

		def motherq1plateList = Plate.findAllByQ1Plate(plateInstance)
		def motherq2plateList = Plate.findAllByQ2Plate(plateInstance)
		def motherq3plateList = Plate.findAllByQ3Plate(plateInstance)
		def motherq4plateList = Plate.findAllByQ4Plate(plateInstance)

		def motherPlateList = motherq1plateList + motherq2plateList + motherq3plateList + motherq4plateList
		def sortedMotherPlateList = motherPlateList.sort{ it.intPlateId }

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

		if (format == "list") {
			file << ("Well,SampleID\n")

			for (sample in sampleList) {
				file << (sample.getWell() + "," + sample.getSampleId() + "\n")
			}
		}

		else if (format == "grid") {

			for (sample in sampleList) {
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

	def exportPlateCSV(List plate384List, List plate96List) {
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
