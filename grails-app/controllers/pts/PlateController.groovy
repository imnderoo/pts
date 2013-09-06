package pts

import java.sql.RowId;

import org.apache.poi.ss.usermodel.Cell
import org.apache.poi.ss.usermodel.Row
import org.apache.poi.ss.usermodel.Sheet
import org.apache.poi.ss.usermodel.Workbook
import org.apache.poi.ss.usermodel.WorkbookFactory
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile

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
		
		def plateInstance = new Plate(params)
		
//		if (!plateInstance.save(flush: true)) {
//			render(view: "create", model: [plateInstance: plateInstance])
//			return
//		}
			
		// Fetch Plate Manifest And Create Excel Object
		
		def file = request.getFile("file")
//		def fileName = file.getOriginalFilename()
//		println(fileName)
		
		def wb = WorkbookFactory.create(file.getInputStream())
		def sheet = wb.getSheetAt(0)
		def row
		def cell
		
		def plateMap = [:]
		def projectMap = [:]
		def investigatorMap = [:]

		def plateTypeInstance = PlateType.findByName('Plate96')
		 
		// Read investigator
		row = sheet.getRow(0)
		cell = row.getCell(1)
		String cellVal = cell.getStringCellValue()
		println(cellVal)
		investigatorMap['firstName'] = "John"
		investigatorMap['lastName'] = "Smith"
		
		// Save Investigator
		def investigatorInstance = new Investigator(investigatorMap)
		
		println(investigatorMap)
		
//		investigatorInstance.save(flush: true)
		// Add Investigator to Project Map
//		projectMap['investigator'] = Investigator.findByFirstName(investigatorMap['firstName'])
		
		// Read project name
		row = sheet.getRow(2)
		cell = row.getCell(1, Row.CREATE_NULL_AS_BLANK)
		
		projectMap['name'] = cell.getStringCellValue()
//		projectMap['investigator'] = investigatorInstance
		
		
		// Save Project
		def projectInstance = new Project(projectMap)
		
//		investigatorInstance.addToProject(projectInstance)
		
		if (!investigatorInstance.save(flush: true)) {
			render(view: "create", model: [plateInstance: plateInstance])
			println("NOT SAVED")
			return
		}		
		else
		{
			println("SAVED")
		}
//		projectInstance.save(flush: true)
		
		// Add Project to Plate Map
//		plateMap['project'] = Project.findByName(projectMap['name'])
			
		render(view: "create", model: [plateInstance: plateInstance])
		return
		
//		// Read created date
//		row = sheet.getRow(3)
//		cell = row.getCell(1, Row.CREATE_NULL_AS_BLANK)
//		plateMap['createdDate'] = cell.getStringCellValue()
//		
//		// Read plate id
//		row = sheet.getRow(6)
//		cell = row.getCell(0, Row.CREATE_NULL_AS_BLANK)
//		plateMap['intPlateId'] = cell.getStringCellValue()
//		plateMap['extPlateId'] = cell.getStringCellValue()
//		plateMap['plateType'] = plateTypeInstance()
//		
//		def sampleList = []
//		
//		for (rowNo in 6..101)
//		{
//			def sampleMap = [:]
//			def sampleInPlateMap = [:]
//			
//			row = sheet.getRow(rowNo)
//			cell = row.getCell(1)
//			sampleInPlateMap['well'] = cell.getStringCellValue()
//			
//			row = sheet.getRow(rowNo)
//			cell = row.getCell(2, Row.CREATE_NULL_AS_BLANK)
//			sampleMap['sampleId'] = cell.getStringCellValue()
//			
//			row = sheet.getRow(rowNo)
//			cell = row.getCell(3, Row.CREATE_NULL_AS_BLANK)
//			sampleMap['sampleVol'] = cell.getStringCellValue()
//			
//			row = sheet.getRow(rowNo)
//			cell = row.getCell(4, Row.CREATE_NULL_AS_BLANK)
//			sampleMap['dnaAmount'] = cell.getStringCellValue()
//			
//			row = sheet.getRow(rowNo)
//			cell = row.getCell(5, Row.CREATE_NULL_AS_BLANK)
//			sampleMap['dnaSource'] = cell.getStringCellValue()
//			
//			row = sheet.getRow(rowNo)
//			cell = row.getCell(6, Row.CREATE_NULL_AS_BLANK)
//			sampleMap['dnaType'] = cell.getStringCellValue()
//			
//			row = sheet.getRow(rowNo)
//			cell = row.getCell(7, Row.CREATE_NULL_AS_BLANK)
//			sampleMap['dnaExtract'] = cell.getStringCellValue()
//			
//			row = sheet.getRow(rowNo)
//			cell = row.getCell(8, Row.CREATE_NULL_AS_BLANK)
//			sampleMap['comment'] = cell.getStringCellValue()
//			
//			def sampleInstance = new Sample(sampleMap)
//			
//			sampleList.add(sampleInstance)
//			
//			def samplesInPlateInstance = new SampleInPlate()
//			
//		}
//		
//		for (samples in sampleList)
//		{
//			
//		}
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
