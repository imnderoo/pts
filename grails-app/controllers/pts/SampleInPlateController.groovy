package pts

import org.springframework.dao.DataIntegrityViolationException

class SampleInPlateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [sampleInPlateInstanceList: SampleInPlate.list(params), sampleInPlateInstanceTotal: SampleInPlate.count()]
    }

    def create() {
        [sampleInPlateInstance: new SampleInPlate(params)]
    }

    def save() {
        def sampleInPlateInstance = new SampleInPlate(params)
        if (!sampleInPlateInstance.save(flush: true)) {
            render(view: "create", model: [sampleInPlateInstance: sampleInPlateInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'sampleInPlate.label', default: 'SampleInPlate'), sampleInPlateInstance.id])
        redirect(action: "show", id: sampleInPlateInstance.id)
    }

    def show(Long id) {
        def sampleInPlateInstance = SampleInPlate.get(id)
        if (!sampleInPlateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sampleInPlate.label', default: 'SampleInPlate'), id])
            redirect(action: "list")
            return
        }

        [sampleInPlateInstance: sampleInPlateInstance]
    }

    def edit(Long id) {
        def sampleInPlateInstance = SampleInPlate.get(id)
        if (!sampleInPlateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sampleInPlate.label', default: 'SampleInPlate'), id])
            redirect(action: "list")
            return
        }

        [sampleInPlateInstance: sampleInPlateInstance]
    }

    def update(Long id, Long version) {
        def sampleInPlateInstance = SampleInPlate.get(id)
        if (!sampleInPlateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sampleInPlate.label', default: 'SampleInPlate'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (sampleInPlateInstance.version > version) {
                sampleInPlateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'sampleInPlate.label', default: 'SampleInPlate')] as Object[],
                          "Another user has updated this SampleInPlate while you were editing")
                render(view: "edit", model: [sampleInPlateInstance: sampleInPlateInstance])
                return
            }
        }

        sampleInPlateInstance.properties = params

        if (!sampleInPlateInstance.save(flush: true)) {
            render(view: "edit", model: [sampleInPlateInstance: sampleInPlateInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'sampleInPlate.label', default: 'SampleInPlate'), sampleInPlateInstance.id])
        redirect(action: "show", id: sampleInPlateInstance.id)
    }

    def delete(Long id) {
        def sampleInPlateInstance = SampleInPlate.get(id)
        if (!sampleInPlateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'sampleInPlate.label', default: 'SampleInPlate'), id])
            redirect(action: "list")
            return
        }

        try {
            sampleInPlateInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'sampleInPlate.label', default: 'SampleInPlate'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sampleInPlate.label', default: 'SampleInPlate'), id])
            redirect(action: "show", id: id)
        }
    }
}
