package pts

import org.apache.poi.ss.usermodel.Row
import org.apache.poi.ss.usermodel.WorkbookFactory
import org.springframework.dao.DataIntegrityViolationException


class PlateController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[plateInstanceList: Plate.list(params), plateInstanceTotal: Plate.count()]
	}

	def create96() {
		[plateInstance: new Plate(params)]
	}

	def save96() {
		// Fetch Plate Manifest And Create Excel Object

		def file = request.getFile("file")

		def wb = WorkbookFactory.create(file.getInputStream())
		def sheet = wb.getSheetAt(0)
		def row
		def cell

		def plateMap = [:]
		def projectMap = [:]
		def investigatorMap = [:]

		def plateTypeInstance = PlateType.findByName('Plate96')

		// Read Investigator Info from manifest
		row = sheet.getRow(0)
		cell = row.getCell(1)
		def investigatorName = cell.getStringCellValue()
		def firstName = investigatorName.split(' ')[0..-2].join(' ')
		def lastName = investigatorName.split(' ')[-1]
		// Check if investigator exists...
		// Find or save by will save the instance if it is null
		def investigatorInstance = Investigator.findOrSaveByFirstNameAndLastName(firstName, lastName)

		// Read Project Info from manifest
		row = sheet.getRow(2)
		cell = row.getCell(1, Row.CREATE_NULL_AS_BLANK)
		def projectName = cell.getStringCellValue()
		// Check if project exists...
		// Find or save by will save the instance if it is null
		def projectInstance = Project.findOrSaveByInvestigatorAndName(investigatorInstance, projectName)

		// Read PlatePrefix from form and find the next highest PlateID
		def intPlatePrefix = params.intPlatePrefix.toString().toUpperCase()

		def plateSearchResult = Plate.findAllByIntPlateIdIlike("%" + intPlatePrefix + "%", [max: 1, sort: "intPlateId", order: "desc"])
		def plateHighestId = 0

		if	(!plateSearchResult.isEmpty())
		{
			plateSearchResult = plateSearchResult.first().getIntPlateId()
			plateHighestId = Integer.parseInt(plateSearchResult.minus(intPlatePrefix))
		}

		def intPlateId = intPlatePrefix + String.format("%04d", plateHighestId + 1)

		// Read Plate Info from manifest

		// ExtPlateId
		row = sheet.getRow(6)
		cell = row.getCell(0, Row.CREATE_NULL_AS_BLANK)
		def extPlateId = cell.getStringCellValue()

		// CreatedDate
		row = sheet.getRow(3)
		cell = row.getCell(1, Row.CREATE_NULL_AS_BLANK)
		def createdDateString = cell.getStringCellValue()
		def createdDate = new Date()
		// If field is not empty, update date.
		if (!createdDateString.isEmpty())
		{
			createdDate = Date.parse("dd-MM-yyyy", createdDateString)
		}

		def plateInstance = Plate.findOrCreateByIntPlateId(intPlateId.toUpperCase())

		plateInstance.setExtPlateId(extPlateId)
		plateInstance.setPlateType(PlateType.findByName("Plate96"))
		plateInstance.setCreatedDate(createdDate)
		plateInstance.setProject(projectInstance)
		plateInstance.setCreatedBy(investigatorInstance.getFirstName())
		plateInstance.setEnzymeUsed(params.enzymeUsed)
		plateInstance.setPcrCondition(params.pcrCondition)
		plateInstance.setReactionSize(params.reactionSize)
		plateInstance.setChipId(params.chipId)

		if (!plateInstance.save(flush:true))
		{
			plateInstance.errors.each {
				println it
			}
		}


		def sampleList = []

		for (rowNo in 7..101)
		{
			def samplesInPlateMap = [:]

			row = sheet.getRow(rowNo)
			cell = row.getCell(1)
			samplesInPlateMap['well'] = cell.getStringCellValue()

			row = sheet.getRow(rowNo)
			cell = row.getCell(2, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['sampleId'] = cell.getStringCellValue()

			row = sheet.getRow(rowNo)
			cell = row.getCell(3, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['sampleVol'] = cell.getNumericCellValue()

			row = sheet.getRow(rowNo)
			cell = row.getCell(4, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['dnaAmount'] = cell.getNumericCellValue()

			row = sheet.getRow(rowNo)
			cell = row.getCell(5, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['dnaSource'] = cell.getStringCellValue()

			row = sheet.getRow(rowNo)
			cell = row.getCell(6, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['dnaType'] = cell.getStringCellValue()

			row = sheet.getRow(rowNo)
			cell = row.getCell(7, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['dnaExtract'] = cell.getStringCellValue()

			row = sheet.getRow(rowNo)
			cell = row.getCell(8, Row.CREATE_NULL_AS_BLANK)
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
			}
		}

		plateInstance.refresh()

		render(view: "show", model: [plateInstance: plateInstance])
		return

		//        flash.message = message(code: 'default.created.message', args: [message(code: 'plate.label', default: 'Plate'), plateInstance.id])
		//        redirect(action: "show", id: plateInstance.id)
	}

	def create384() {
		[plateInstance: new Plate(params)]
	}

	def save384() {

		// Fetch Plate Manifest And Create Excel Object

		def file = request.getFile("file")

		def wb = WorkbookFactory.create(file.getInputStream())
		def sheet = wb.getSheetAt(0)
		def row
		def cell

		def plateMap = [:]
		def projectMap = [:]
		def investigatorMap = [:]

		def plateTypeInstance = PlateType.findByName('Plate96')

		// Read Investigator Info from manifest
		row = sheet.getRow(0)
		cell = row.getCell(1)
		def investigatorName = cell.getStringCellValue()
		def firstName = investigatorName.split(' ')[0..-2].join(' ')
		def lastName = investigatorName.split(' ')[-1]
		// Check if investigator exists...
		// Find or save by will save the instance if it is null
		def investigatorInstance = Investigator.findOrSaveByFirstNameAndLastName(firstName, lastName)

		// Read Project Info from manifest
		row = sheet.getRow(2)
		cell = row.getCell(1, Row.CREATE_NULL_AS_BLANK)
		def projectName = cell.getStringCellValue()
		// Check if project exists...
		// Find or save by will save the instance if it is null
		def projectInstance = Project.findOrSaveByInvestigatorAndName(investigatorInstance, projectName)


		// Read PlatePrefix from form and find the next highest PlateID
		def intPlatePrefix = params.intPlatePrefix.toString().toUpperCase()

		def highestPlateNum = getHighestPlateNumber(intPlatePrefix)

		def intPlateId = intPlatePrefix + String.format("%04d", highestPlateNum + 1)

		// Read Plate Info from manifest

		// ExtPlateId
		row = sheet.getRow(6)
		cell = row.getCell(0, Row.CREATE_NULL_AS_BLANK)
		def extPlateId = cell.getStringCellValue()

		// CreatedDate
		row = sheet.getRow(3)
		cell = row.getCell(1, Row.CREATE_NULL_AS_BLANK)
		def createdDateString = cell.getStringCellValue()
		def createdDate = new Date()
		// If field is not empty, update date.
		if (!createdDateString.isEmpty())
		{
			createdDate = Date.parse("dd-MM-yyyy", createdDateString)
		}

		def plateInstance = Plate.findOrCreateByIntPlateId(intPlateId.toUpperCase())

		plateInstance.setExtPlateId(extPlateId)
		plateInstance.setPlateType(PlateType.findByName("Plate96"))
		plateInstance.setCreatedDate(createdDate)
		plateInstance.setProject(projectInstance)
		//TODO: update created by to current logged in user
		plateInstance.setCreatedBy(investigatorInstance.getFirstName())
		plateInstance.setEnzymeUsed(params.enzymeUsed)
		plateInstance.setPcrCondition(params.pcrCondition)
		plateInstance.setReactionSize(params.reactionSize)
		plateInstance.setChipId(params.chipId)

		if (!plateInstance.save(flush:true))
		{
			plateInstance.errors.each {
				println it
			}
		}

		def sampleList = []

		for (rowNo in 7..101)
		{
			def samplesInPlateMap = [:]

			row = sheet.getRow(rowNo)
			cell = row.getCell(1)
			samplesInPlateMap['well'] = cell.getStringCellValue()

			row = sheet.getRow(rowNo)
			cell = row.getCell(2, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['sampleId'] = cell.getStringCellValue()

			row = sheet.getRow(rowNo)
			cell = row.getCell(3, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['sampleVol'] = cell.getNumericCellValue()

			row = sheet.getRow(rowNo)
			cell = row.getCell(4, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['dnaAmount'] = cell.getNumericCellValue()

			row = sheet.getRow(rowNo)
			cell = row.getCell(5, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['dnaSource'] = cell.getStringCellValue()

			row = sheet.getRow(rowNo)
			cell = row.getCell(6, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['dnaType'] = cell.getStringCellValue()

			row = sheet.getRow(rowNo)
			cell = row.getCell(7, Row.CREATE_NULL_AS_BLANK)
			samplesInPlateMap['dnaExtract'] = cell.getStringCellValue()

			row = sheet.getRow(rowNo)
			cell = row.getCell(8, Row.CREATE_NULL_AS_BLANK)
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
			}
		}

		plateInstance.refresh()

		render(view: "show", model: [plateInstance: plateInstance])
		return
	}

	def show(Long id) {
		def plateInstance = Plate.get(id)
		if (!plateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'plate.label', default: 'Plate'), id])
			redirect(action: "list")
			return
		}

		[plateInstance: plateInstance]
	}

	def clone(Long id) {

		def oldPlateInstance = Plate.get(id)
		def newPlateInstance = Plate.deepClone(oldPlateInstance)
		
		// Read PlatePrefix from form and find the next highest PlateID
		def intPlateIdRegex = oldPlateInstance.getIntPlateId() =~ /\D+/
		def intPlatePrefix = intPlateIdRegex[0].toString().toUpperCase()
		
		def plateSearchResult = Plate.findAllByIntPlateIdIlike("%" + intPlatePrefix + "%", [max: 1, sort: "intPlateId", order: "desc"])
		def plateHighestId = 0

		if	(!plateSearchResult.isEmpty())
		{
			plateSearchResult = plateSearchResult.first().getIntPlateId()
			plateHighestId = Integer.parseInt(plateSearchResult.minus(intPlatePrefix))
		}

		def intPlateId = intPlatePrefix + String.format("%04d", plateHighestId + 1)
		newPlateInstance.setIntPlateId(intPlateId)
		
		[plateInstance: newPlateInstance]
	}

	def saveClone()
	{
		println (params)
		
//		def oldPlateInstance = Plate.get(id)

//		if (!oldPlateInstance) {
//			flash.message = message(code: 'default.not.found.message', args: [message(code: 'plate.label', default: 'Plate'), id])
//			redirect(action: "list")
//			return
//		}

//		params.createdDate = Date.parse("dd-MM-yyyy", params.createdDate)
		
		def plateInstance = new Plate(params)
		
		if (!plateInstance.save())
		{
			plateInstance.errors.each {
				println it
			}
		}
		
//		// Copy old plate info to new plate. Namely the project and samples relationships
//		newPlateInstance.setExtPlateId(oldPlateInstance.getExtPlateId())
//		newPlateInstance.setPlateType(oldPlateInstance.getPlateType())
//		newPlateInstance.setProject(oldPlateInstance.getProject())

		//TODO: Wait... wouldn't cloning the plate change the sample concentration and volume??
		//TODO: Need to ask Ajay to confirm before preceding with this.
		//TODO: Might be easier to just submit a different excel sheet.

		//TODO: Update createdBy to current logged in user.
		
//		newPlateInstance.setCreatedBy(oldPlateInstance.getCreatedBy())
//
//
//		newPlateInstance.setCreatedDate(params.createdDate)
//		newPlateInstance.setEnzymeUsed(params.enzymeUsed)
//		newPlateInstance.setPcrCondition(params.pcrCondition)
//		newPlateInstance.setReactionSize(params.reactionSize)
//		newPlateInstance.setChipId(params.chipId)
//
//		def oldPlateSampleList = Sample.findAll {
//			plate == oldPlateInstance
//		}
//
//		for (samples in oldPlateSampleList)
//		{
//			def newSample = samples.clone()
//			newSample.setPlate(oldPlateInstance)
//
//			if (!newSample.save())
//			{
//				samples.errors.each {
//					println it
//				}
//			}
//		}		
		render(view: "show", model: [plateInstance: plateInstance])
		return
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

		flash.message = message(code: 'default.updated.message', args: [message(code: 'plate.label', default: 'Plate'), plateInstance.id])
		redirect(action: "show", id: plateInstance.id)
	}

	def delete(Long id) {
		def plateInstance = Plate.get(id)
		if (!plateInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'plate.label', default: 'Plate'), id])
			redirect(action: "list")
			return
		}

		try {
			plateInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'plate.label', default: 'Plate'), id])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'plate.label', default: 'Plate'), id])
			redirect(action: "show", id: id)
		}
	}

	def getHighestPlateNumber(String intPlatePrefix){
		def plateSearchResult = Plate.findAllByIntPlateIdIlike("%" + intPlatePrefix + "%", [max: 1, sort: "intPlateId", order: "desc"])
		def plateHighestId = 0

		if	(!plateSearchResult.isEmpty())
		{
			plateSearchResult = plateSearchResult.first().getIntPlateId()
			plateHighestId = Integer.parseInt(plateSearchResult.minus(intPlatePrefix))
		}

		return plateHighestId
	}
}
