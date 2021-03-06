package pts

import org.apache.poi.ss.usermodel.Cell
import org.apache.poi.ss.usermodel.Row
import org.apache.poi.ss.usermodel.WorkbookFactory
import org.springframework.dao.DataIntegrityViolationException

class PlateController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def plateService

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {

		flash.message = ""

		params.max = Math.min(max ?: 5, 100)
		params.intPlateId = params.intPlateId ?: ""
		params.extPlateId = params.extPlateId ?: ""
		params.projectId = params.projectId ?: "-1"

		def plateType96 = PlateType.findByName('Plate96')
		def plateType384 = PlateType.findByName('Plate384')

		def plate96Result = plateService.getPlateList(plateType96, params.intPlateId, params.extPlateId, params.projectId, params)
		def plate384Result = plateService.getPlateList(plateType384, params.intPlateId, params.extPlateId, params.projectId, params)

		def plate96List = plate96Result[0]
		def plate96ListTotal = plate96Result[1]

		def plate384List = plate384Result[0]
		def plate384ListTotal = plate384Result[1]

		flash.intPlateId = params.intPlateId
		flash.extPlateId = params.extPlateId
		flash.projectId = params.projectId
		flash.message = plate384ListTotal + " [384]-well and " + plate96ListTotal + " [96]-well plates found"
		
		[plate96List: plate96List, plate96ListTotal: plate96ListTotal, plate384List: plate384List, plate384ListTotal: plate384ListTotal]
	}

	def render_listPlate96(Integer max) {
		params.max = Math.min(max ?: 5, 100)

		def plateType96 = PlateType.findByName('Plate96')

		def plate96Result = plateService.getPlateList(plateType96, flash.intPlateId, flash.extPlateId, flash.projectId, params)
		def plate96List = plate96Result[0]
		def plate96ListTotal = plate96Result[1]

		flash.intPlateId = flash.intPlateId
		flash.extPlateId = flash.extPlateId
		flash.projectId = flash.projectId
		flash.message = flash.message
		
		render(template:"listPlate96", model:[plate96List: plate96List, plate96ListTotal: plate96ListTotal])
	}

	def render_listPlate384(Integer max) {
		params.max = Math.min(max ?: 5, 100)

		def plateType384 = PlateType.findByName('Plate384')

		def plate384Result = plateService.getPlateList(plateType384, flash.intPlateId, flash.extPlateId, flash.projectId, params)
		def plate384List = plate384Result[0]
		def plate384ListTotal = plate384Result[1]

		flash.intPlateId = flash.intPlateId
		flash.extPlateId = flash.extPlateId
		flash.projectId = flash.projectId
		flash.message = flash.message
		
		render(template:"listPlate384", model:[plate384List: plate384List, plate384ListTotal: plate384ListTotal])
	}

	def exportPlateList() {
		def plateType96 = PlateType.findByName('Plate96')
		def plateType384 = PlateType.findByName('Plate384')

		def plate96Result = plateService.getPlateList(plateType96, flash.intPlateId, flash.extPlateId, flash.projectId, params)
		def plate384Result = plateService.getPlateList(plateType384, flash.intPlateId, flash.extPlateId, flash.projectId, params)

		def plate96List = plate96Result[0]
		def plate384List = plate384Result[0]

		def projectText

		if (Integer.valueOf(flash.projectId) > 0) {
			projectText = Project.get(flash.projectId).getName()
		}
		else {
			projectText = "All Projects"
		}

		def plateList = plateService.exportPlateCSV(plate384List, plate96List, flash.intPlateId, flash.extPlateId, projectText)

		flash.intPlateId = flash.intPlateId
		flash.extPlateId = flash.extPlateId
		flash.projectId = flash.projectId

		//CSV
		response.setHeader "Content-disposition", "attachment; filename=" + "plate_search_result.csv"
		response.contentType = 'text/csv'
		response.outputStream << plateList.text
		response.outputStream.flush()
	}

	def create96() {
		flash.message = ""

		[plateInstance: new Plate(params)]
	}

	def create384() {

		flash.message = ""
		params.createdDate  = new Date().format('dd-MM-yyyy')

		[plateInstance: new Plate()]
	}

	def save96() {
		// Fetch Plate Manifest And Create Excel Object

		def file = request.getFile("file")
		def wb

		try {
			wb = WorkbookFactory.create(file.getInputStream())
		} catch(e) {
			flash.message = "Error: Invalid file format. Make sure it is an Excel spreadsheet."
			render(view: 'create96', model: [plateInstance: new Plate(params)])
			return
		}

		def sheet = wb.getSheetAt(0)

		if (!sheet.getRow(1).getCell(0).getStringCellValue().equalsIgnoreCase("Primary Contact name:") || !sheet.getRow(5).getCell(0).getStringCellValue().equalsIgnoreCase("Plate ID"))
		{
			flash.message = "Error: Invalid manifest file. Make sure it is the correct Manifest file."
			render(view: 'create96', model: [plateInstance: new Plate(params)])
			return
		}

		def row
		def cell

		def plateMap = [:]
		def projectMap = [:]
		def investigatorMap = [:]

		def plateTypeInstance = PlateType.findByName('Plate96')

		// Read Investigator Info from manifest
		def investigatorName = sheet.getRow(0).getCell(1, Row.CREATE_NULL_AS_BLANK).getStringCellValue()
		def firstName = investigatorName.split(' ')[0..-2].join(' ')
		def lastName = investigatorName.split(' ')[-1]
		// Check if investigator exists...
		// Find or save by will save the instance if it is null
		def investigatorInstance = Investigator.findOrSaveByFirstNameAndLastName(firstName, lastName)

		// Read Project Info from manifest
		def projectName = sheet.getRow(2).getCell(1, Row.CREATE_NULL_AS_BLANK).getStringCellValue()
		// Check if project exists...
		// Find or save by will save the instance if it is null
		def projectInstance = Project.findOrSaveByInvestigatorAndName(investigatorInstance, projectName)

		// Read PlatePrefix from form and find the next highest PlateID

		def intPlateId = plateService.getNextHighestPlateId(params.intPlatePrefix, plateTypeInstance)

		// Read Plate Info from manifest

		// ExtPlateId
		def extPlateId = sheet.getRow(6).getCell(0, Row.CREATE_NULL_AS_BLANK).getStringCellValue()

		// CreatedDate
		def createdDateString = sheet.getRow(3).getCell(1, Row.CREATE_NULL_AS_BLANK).getStringCellValue()
		def createdDate = new Date()
		// If field is not empty, update date.
		if (!createdDateString.isEmpty())
		{
			createdDate = Date.parse("dd-MM-yyyy", createdDateString)
		}

		def plateInstance = Plate.findByIntPlateId(intPlateId)

		if(plateInstance)
		{
			flash.message = "Cannot save " + intPlateId + ". It already exists in database"
			redirect(action: "create96")
		}

		params.intPlateId = intPlateId
		params.extPlateId = extPlateId
		params.createdDate = createdDate

		plateInstance = new Plate(params)

		plateInstance.setPlateType(PlateType.findByName("Plate96"))
		plateInstance.setProject(projectInstance)
		plateInstance.setCreatedBy(investigatorInstance.getFirstName())

		if (!plateInstance.save(flush:true))
		{
			plateInstance.errors.each {
				println it
			}
		}

		def sampleList = []

		for (rowNo in 6..101)
		{
			def samplesInPlateMap = [:]

			cell = sheet.getRow(rowNo).getCell(1)
			samplesInPlateMap['well'] = cell.getStringCellValue()
			samplesInPlateMap['wellNumber'] = rowNo - 5

			cell = sheet.getRow(rowNo).getCell(2, Row.CREATE_NULL_AS_BLANK)
			//def cellTypeValue = cell.getCellType()
			cell.setCellType(Cell.CELL_TYPE_STRING)
			samplesInPlateMap['sampleId'] = cell.getStringCellValue()
			
			//println(samplesInPlateMap['sampleId'])
			
			cell = sheet.getRow(rowNo).getCell(3, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['sampleVol'] = cell.getNumericCellValue()

			cell = sheet.getRow(rowNo).getCell(4, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['dnaAmount'] = cell.getNumericCellValue()

			cell = sheet.getRow(rowNo).getCell(5, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['dnaSource'] = cell.getStringCellValue()

			cell = sheet.getRow(rowNo).getCell(6, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['dnaType'] = cell.getStringCellValue()

			cell = sheet.getRow(rowNo).getCell(7, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['dnaExtract'] = cell.getStringCellValue()

			cell = sheet.getRow(rowNo).getCell(8, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['comment'] = cell.getStringCellValue()
			samplesInPlateMap['plate'] = plateInstance

			def sampleInstance = new Sample(samplesInPlateMap)

			// Queue samples
			sampleList.add(sampleInstance)
		}

		for (samples in sampleList)
		{
			if (!samples.save())
			{
				samples.errors.each {
					println it
				}

				render(view: "create96", model: [plateInstance: plateInstance])
				return
			}
		}

		plateInstance.refresh()

		plateService.printLabel(plateInstance)

		flash.message = "Plate " + plateInstance.getIntPlateId() + " created."

		redirect(action: "show", id: plateInstance.id)

	}

	def save384() {

		flash.message = ""

		// Read PlatePrefix from form and find the next highest PlateID
		def plateType = PlateType.findByName("Plate384")

		params.intPlateId = plateService.getNextHighestPlateId(params.intPlatePrefix, plateType)	

		def plateInstance = new Plate(params)
		plateInstance.setPlateType(plateType)

		if(!params.q1Plate?.id) {
			flash.message = "Error: Q1 Plate " + params.q1Plate.name + " does not exist."
		}
		else if(!params.q2Plate?.id) {
			flash.message = "Error: Q2 Plate " + params.q2Plate.name + " does not exist."

		}
		else if(!params.q3Plate?.id) {
			flash.message = "Error: Q3 Plate " + params.q3Plate.name + " does not exist."
		}
		else if(!params.q4Plate?.id) {
			flash.message = " Error: Q4 Plate " + params.q4Plate.name + " does not exist."
		}

		if (!flash.message.isEmpty())
		{
			render(view: "create384", model: [plateInstance: plateInstance])
			return
		}


		plateInstance.setCreatedBy("Bob")

		if (!plateInstance.save(flush:true))
		{
			plateInstance.errors.each {
				println it
			}
		}

		plateInstance.refresh()
		plateService.printLabel(plateInstance)

		redirect(action: "show", id: plateInstance.id)
	}

	def show(Long id) {
		
		flash.message = ""
		def plateInstance = Plate.get(id)
		if (!plateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'plate.label', default: 'Plate'), id])
			redirect(action: "list")
			return
		}

		def samplesGridView = null
		def samplesListView = null

		def motherPlateList = plateService.getMotherPlates(plateInstance)

		if(!params.samplesListView)
		{
			samplesGridView = plateInstance.getSamples()
		}
		else
		{
			samplesListView = plateInstance.getSamples()
		}

		[plateInstance: plateInstance, samplesGridView: samplesGridView, samplesListView: samplesListView, motherPlateList: motherPlateList]
	}

	def render_showSamplesView() {
		def plateInstance = Plate.get(params.id)

		def samplesGridView = null
		def samplesListView = null

		if(!params.samplesListView)
		{
			samplesGridView = plateInstance.getSamples()
		}
		else
		{
			samplesListView = plateInstance.getSamples()
		}
		render(template: "showSamplesView", model: [samplesGridView: samplesGridView, samplesListView: samplesListView])
	}

	def render_showPlateInfo() {
		def qPlateInstance = Plate.get(params.id)
		render(template: "showPlateInfo", model: [qPlateInstance: qPlateInstance])
	}


	def clone(Long id) {

		flash.message = ""
		
		def oldPlateInstance = Plate.get(id)
		def newPlateInstance = Plate.deepClone(oldPlateInstance)

		// Read PlatePrefix from form and find the next highest PlateID
		def intPlateIdRegex = oldPlateInstance.getIntPlateId() =~ /\D+/
		def intPlatePrefix = intPlateIdRegex[0].toString().toUpperCase()

		def intPlateId = plateService.getNextHighestPlateId(intPlatePrefix, oldPlateInstance.getPlateType())
		
		newPlateInstance.setIntPlateId(intPlateId)

		if (!newPlateInstance.save(flush: true)) {
			render(view: "show", model: [plateInstance: plateInstance])
			return

			newPlateInstance.errors.each {
				println it
			}
		}

		flash.message = "The cloned plate is automatically assigned the internal ID " + intPlateId

		newPlateInstance.refresh()

		plateService.printLabel(newPlateInstance)

		def samplesGridView = newPlateInstance.getSamples()

		[plateInstance: newPlateInstance, samplesGridView: samplesGridView, samplesListView: null]
	}

	def edit(Long id) {
		def plateInstance = Plate.get(id)
		if (!plateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'plate.label', default: 'Plate'), id])
			redirect(action: "list")
			return
		}

		[plateInstance: plateInstance]
	}

	def update(Long id, Long version) {
		def plateInstance = Plate.get(id)
		if (!plateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'plate.label', default: 'Plate'), id])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (plateInstance.version > version) {
				plateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
				[message(code: 'plate.label', default: 'Plate')] as Object[],
				"Another user has updated this Plate while you were editing")
				render(view: "edit", model: [plateInstance: plateInstance])
				return
			}
		}

		plateInstance.properties = params

		if (!plateInstance.save(flush: true)) {
			render(view: "edit", model: [plateInstance: plateInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'plate.label', default: 'Plate'), plateInstance.intPlateId])
		redirect(action: "show", id: plateInstance.id)
	}

	def delete(Long id) {
		def plateInstance = Plate.get(id)
		if (!plateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'plate.label', default: 'Plate'), id])
			redirect(action: "list")
			return
		}

		def motherq1plateList = Plate.findAllByQ1Plate(plateInstance)
		def motherq2plateList = Plate.findAllByQ2Plate(plateInstance)
		def motherq3plateList = Plate.findAllByQ3Plate(plateInstance)
		def motherq4plateList = Plate.findAllByQ4Plate(plateInstance)

		def motherPlateList = motherq1plateList + motherq2plateList + motherq3plateList + motherq4plateList

		if (motherPlateList.isEmpty()) //not null or empty
		{
			try {
				plateInstance.delete(flush: true)
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'plate.label', default: 'Plate'), plateInstance.intPlateId])
				redirect(action: "list")
			}
			catch (DataIntegrityViolationException e) {
				flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'plate.label', default: 'Plate'), plateInstance.intPlateId])
				redirect(action: "show", id: id)
			}
		}
		else
		{
			flash.message = "Plate is part of a 384 Plate. Cannot be deleted."
			redirect(action: "show", id: id)
		}
	}

	def exportSampleList(Long id)
	{
		def plateInstance = Plate.get(id)

		if (params.format == "sequenome")
		{
			def sequenome = plateService.exportSampleSequenome(plateInstance)

			//TXT
			response.setHeader "Content-disposition", "attachment; filename=" + plateInstance.getIntPlateId() + "_sequenome.txt"
			response.contentType = 'text/txt'
			response.outputStream << sequenome.text
			response.outputStream.flush()
		}
		if (params.format == "csvList")
		{
			def csvList = plateService.exportSampleCSV(plateInstance, "list")

			//CSV
			response.setHeader "Content-disposition", "attachment; filename=" + plateInstance.getIntPlateId() + "_list.csv"
			response.contentType = 'text/csv'
			response.outputStream << csvList.text
			response.outputStream.flush()
		}
		else if (params.format == "csvGrid")
		{
			def csvGrid = plateService.exportSampleCSV(plateInstance, "grid")

			//CSV
			response.setHeader "Content-disposition", "attachment; filename=" + plateInstance.getIntPlateId() + "_grid.csv"
			response.contentType = 'text/csv'
			response.outputStream << csvGrid.text
			response.outputStream.flush()
		}
	}

	def exportSample384List(Long id)
	{
		def plateInstance = Plate.get(id)

		if (params.format == "csvList")
		{
			def csvList = plateService.exportSample384CSV(plateInstance, "list")

			//CSV
			response.setHeader "Content-disposition", "attachment; filename=" + plateInstance.getIntPlateId() + "_list.csv"
			response.contentType = 'text/csv'
			response.outputStream << csvList.text
			response.outputStream.flush()
		}
		else if (params.format == "csvGrid")
		{
			def csvGrid = plateService.exportSample384CSV(plateInstance, "grid")

			//CSV
			response.setHeader "Content-disposition", "attachment; filename=" + plateInstance.getIntPlateId() + "_grid.csv"
			response.contentType = 'text/csv'
			response.outputStream << csvGrid.text
			response.outputStream.flush()
		}
	}
}
