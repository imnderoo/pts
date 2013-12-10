package pts

import org.springframework.dao.DataIntegrityViolationException

class PlateTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
		flash.message = ""
		
        params.max = Math.min(max ?: 10, 100)
        [plateTypeInstanceList: PlateType.list(params), plateTypeInstanceTotal: PlateType.count()]
    }

    def create() {
		flash.message = ""
		
        [plateTypeInstance: new PlateType(params)]
    }

    def save() {
        def plateTypeInstance = new PlateType(params)
		
        if (!plateTypeInstance.save(flush: true)) {
            render(view: "create", model: [plateTypeInstance: plateTypeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'plateType.label', default: 'PlateType'), plateTypeInstance.id])
        redirect(action: "show", id: plateTypeInstance.id)
    }

    def show(Long id) {
        def plateTypeInstance = PlateType.get(id)
        if (!plateTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plateType.label', default: 'PlateType'), id])
            redirect(action: "list")
            return
        }

        [plateTypeInstance: plateTypeInstance]
    }

    def edit(Long id) {
        def plateTypeInstance = PlateType.get(id)
        if (!plateTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plateType.label', default: 'PlateType'), id])
            redirect(action: "list")
            return
        }

        [plateTypeInstance: plateTypeInstance]
    }

    def update(Long id, Long version) {
        def plateTypeInstance = PlateType.get(id)
        if (!plateTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plateType.label', default: 'PlateType'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (plateTypeInstance.version > version) {
                plateTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'plateType.label', default: 'PlateType')] as Object[],
                          "Another user has updated this PlateType while you were editing")
                render(view: "edit", model: [plateTypeInstance: plateTypeInstance])
                return
            }
        }

        plateTypeInstance.properties = params

        if (!plateTypeInstance.save(flush: true)) {
            render(view: "edit", model: [plateTypeInstance: plateTypeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'plateType.label', default: 'PlateType'), plateTypeInstance.id])
        redirect(action: "show", id: plateTypeInstance.id)
    }

    def delete(Long id) {
        def plateTypeInstance = PlateType.get(id)
        if (!plateTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plateType.label', default: 'PlateType'), id])
            redirect(action: "list")
            return
        }

        try {
            plateTypeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'plateType.label', default: 'PlateType'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'plateType.label', default: 'PlateType'), id])
            redirect(action: "show", id: id)
        }
    }
}
