package pts

import org.springframework.dao.DataIntegrityViolationException

class InvestigatorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [investigatorInstanceList: Investigator.list(params), investigatorInstanceTotal: Investigator.count()]
    }

    def create() {
        [investigatorInstance: new Investigator(params)]
    }

    def save() {
        def investigatorInstance = new Investigator(params)
		
        if (!investigatorInstance.save(flush: true)) {
            render(view: "create", model: [investigatorInstance: investigatorInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'investigator.label', default: 'Investigator'), investigatorInstance.id])
        redirect(action: "show", id: investigatorInstance.id)
    }

    def show(Long id) {
        def investigatorInstance = Investigator.get(id)
        if (!investigatorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'investigator.label', default: 'Investigator'), id])
            redirect(action: "list")
            return
        }

        [investigatorInstance: investigatorInstance]
    }

    def edit(Long id) {
        def investigatorInstance = Investigator.get(id)
        if (!investigatorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'investigator.label', default: 'Investigator'), id])
            redirect(action: "list")
            return
        }

        [investigatorInstance: investigatorInstance]
    }

    def update(Long id, Long version) {
        def investigatorInstance = Investigator.get(id)
        if (!investigatorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'investigator.label', default: 'Investigator'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (investigatorInstance.version > version) {
                investigatorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'investigator.label', default: 'Investigator')] as Object[],
                          "Another user has updated this Investigator while you were editing")
                render(view: "edit", model: [investigatorInstance: investigatorInstance])
                return
            }
        }

        investigatorInstance.properties = params

        if (!investigatorInstance.save(flush: true)) {
            render(view: "edit", model: [investigatorInstance: investigatorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'investigator.label', default: 'Investigator'), investigatorInstance.id])
        redirect(action: "show", id: investigatorInstance.id)
    }

    def delete(Long id) {
        def investigatorInstance = Investigator.get(id)
        if (!investigatorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'investigator.label', default: 'Investigator'), id])
            redirect(action: "list")
            return
        }

        try {
            investigatorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'investigator.label', default: 'Investigator'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'investigator.label', default: 'Investigator'), id])
            redirect(action: "show", id: id)
        }
    }
}
