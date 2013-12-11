package pts

import org.springframework.dao.DataIntegrityViolationException


class SampleController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def sampleService

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 12, 100)

		def sampleList = []
		def sampleListTotal = 0
				
		if (!params.sampleId && !params.intPlateId)
		{
			flash.message = "Enter SampleID or IntPlateID to begin"
		}
		else
		{
			// sampleFilter = [sampleList, sampleListTotal]
			def sampleFilter = sampleService.getSampleList(params.sampleId, params.intPlateId, params)
			sampleList = sampleFilter[0]
			sampleListTotal = sampleFilter[1]
			
			flash.sampleId = params.sampleId
			flash.intPlateId = params.intPlateId
			flash.message = sampleListTotal + " samples found"
		}
		
		[sampleList: sampleList, sampleListTotal: sampleListTotal]
	}

	def render_listSample(Integer max) {
		params.max = Math.min(max ?: 12, 100)

		// sampleFilter = [sampleList, sampleListTotal]
		def sampleFilter = sampleService.getSampleList(flash.sampleId, flash.intPlateId, params)
		def sampleList = sampleFilter[0]
		def sampleListTotal = sampleFilter[1]

		flash.sampleId = flash.sampleId
		flash.intPlateId = flash.intPlateId
		flash.message = sampleListTotal + " samples found"

		render(template:"listSample", model:[sampleList: sampleList, sampleListTotal: sampleListTotal])
	}

	def create() {
		[sampleInstance: new Sample(params)]
	}

	def save() {
		def sampleInstance = new Sample(params)
		if (!sampleInstance.save(flush: true)) {
			render(view: "create", model: [sampleInstance: sampleInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'sample.label', default: 'sample'), sampleInstance.id])
		redirect(action: "show", id: sampleInstance.id)
	}

	def show(Long id) {
		def sampleInstance = Sample.get(id)
		if (!sampleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'sample.label', default: 'sample'), id])
			redirect(action: "list")
			return
		}

		[sampleInstance: sampleInstance]
	}

	def edit(Long id) {
		def sampleInstance = Sample.get(id)
		if (!sampleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'sample.label', default: 'sample'), id])
			redirect(action: "list")
			return
		}

		[sampleInstance: sampleInstance]
	}

	def update(Long id, Long version) {
		def sampleInstance = Sample.get(id)
		if (!sampleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'sample.label', default: 'sample'), id])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (sampleInstance.version > version) {
				sampleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
				[message(code: 'sample.label', default: 'sample')] as Object[],
				"Another user has updated this sample while you were editing")
				render(view: "edit", model: [sampleInstance: sampleInstance])
				return
			}
		}

		sampleInstance.properties = params

		if (!sampleInstance.save(flush: true)) {
			render(view: "edit", model: [sampleInstance: sampleInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [message(code: 'sample.label', default: 'sample'), sampleInstance.id])
		redirect(action: "show", id: sampleInstance.id)
	}

	def delete(Long id) {
		def sampleInstance = Sample.get(id)
		if (!sampleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'sample.label', default: 'sample'), id])
			redirect(action: "list")
			return
		}

		try {
			sampleInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'sample.label', default: 'sample'), id])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'sample.label', default: 'sample'), id])
			redirect(action: "show", id: id)
		}
	}
}
