package pts

import org.springframework.dao.DataIntegrityViolationException

class SamplesInPlateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [samplesInPlateInstanceList: SamplesInPlate.list(params), samplesInPlateInstanceTotal: SamplesInPlate.count()]
    }

    def create() {
        [samplesInPlateInstance: new SamplesInPlate(params)]
    }

    def save() {
        def samplesInPlateInstance = new SamplesInPlate(params)
        if (!samplesInPlateInstance.save(flush: true)) {
            render(view: "create", model: [samplesInPlateInstance: samplesInPlateInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'samplesInPlate.label', default: 'SamplesInPlate'), samplesInPlateInstance.id])
        redirect(action: "show", id: samplesInPlateInstance.id)
    }

    def show(Long id) {
        def samplesInPlateInstance = SamplesInPlate.get(id)
        if (!samplesInPlateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'samplesInPlate.label', default: 'SamplesInPlate'), id])
            redirect(action: "list")
            return
        }

        [samplesInPlateInstance: samplesInPlateInstance]
    }

    def edit(Long id) {
        def samplesInPlateInstance = SamplesInPlate.get(id)
        if (!samplesInPlateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'samplesInPlate.label', default: 'SamplesInPlate'), id])
            redirect(action: "list")
            return
        }

        [samplesInPlateInstance: samplesInPlateInstance]
    }

    def update(Long id, Long version) {
        def samplesInPlateInstance = SamplesInPlate.get(id)
        if (!samplesInPlateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'samplesInPlate.label', default: 'SamplesInPlate'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (samplesInPlateInstance.version > version) {
                samplesInPlateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'samplesInPlate.label', default: 'SamplesInPlate')] as Object[],
                          "Another user has updated this SamplesInPlate while you were editing")
                render(view: "edit", model: [samplesInPlateInstance: samplesInPlateInstance])
                return
            }
        }

        samplesInPlateInstance.properties = params

        if (!samplesInPlateInstance.save(flush: true)) {
            render(view: "edit", model: [samplesInPlateInstance: samplesInPlateInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'samplesInPlate.label', default: 'SamplesInPlate'), samplesInPlateInstance.id])
        redirect(action: "show", id: samplesInPlateInstance.id)
    }

    def delete(Long id) {
        def samplesInPlateInstance = SamplesInPlate.get(id)
        if (!samplesInPlateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'samplesInPlate.label', default: 'SamplesInPlate'), id])
            redirect(action: "list")
            return
        }

        try {
            samplesInPlateInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'samplesInPlate.label', default: 'SamplesInPlate'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'samplesInPlate.label', default: 'SamplesInPlate'), id])
            redirect(action: "show", id: id)
        }
    }
}
