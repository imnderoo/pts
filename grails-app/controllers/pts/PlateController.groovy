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

	def create() {
		println("CREATE")
		println(params)
		[plateInstance: new Plate(params)]
	}

	def save() {
		println("SAVE")
		println(params)

		//def plateInstance = new Plate(params)

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

		// Read Investigator Info
		row = sheet.getRow(0)
		cell = row.getCell(1)
		def investigatorName = cell.getStringCellValue()
		def firstName = investigatorName.split(' ')[0..-2].join(' ')
		def lastName = investigatorName.split(' ')[-1]
		// Check if investigator exists...
		def investigatorInstance = Investigator.findByFirstNameAndLastName(firstName, lastName)
		// If not, create new investigator
		if (investigatorInstance == null)
		{
			investigatorMap['firstName'] = firstName
			investigatorMap['lastName'] = lastName
			investigatorInstance = new Investigator(investigatorMap)
			if(!investigatorInstance.save(flush:true))
			{
				investigatorInstance.errors.each {
					println it
				}
			}
		}

		// Read Project Info
		row = sheet.getRow(2)
		cell = row.getCell(1, Row.CREATE_NULL_AS_BLANK)
		def projectName = cell.getStringCellValue()
		// Check if project exists...
		def projectInstance = Project.findByInvestigatorAndName(investigatorInstance, projectName)
		// If not, create new Project
		if (projectInstance == null)
		{
			projectMap['name'] = projectName
			projectMap['investigator'] = investigatorInstance
			projectInstance = new Project(projectMap)
			if (!projectInstance.save(flush:true))
			{
				projectInstance.errors.each {
					println it
				}
			}
		}

		// Read Plate Info

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


		def plateInstance = Plate.findByIntPlateId(params.intPlateId.toUpperCase())

		if (plateInstance == null)
		{
			plateMap['intPlateId'] = params.intPlateId.toUpperCase()
			plateMap['extPlateId'] = extPlateId
			plateMap['plateType'] = PlateType.findByName("Plate96")
			plateMap['createdDate'] = createdDate
			plateMap['project'] = projectInstance
			//TODO: Replace createdBy with logged in user name
			plateMap['createdBy'] = investigatorInstance.getFirstName()
			plateInstance = new Plate(plateMap)

			if (!plateInstance.save(flush:true))
			{
				plateInstance.errors.each {
					println it
				}
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

			def sampleInstance = new SamplesInPlate(samplesInPlateMap)

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

		//
		//
		//        flash.message = message(code: 'default.created.message', args: [message(code: 'plate.label', default: 'Plate'), plateInstance.id])
		//        redirect(action: "show", id: plateInstance.id)
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
}
