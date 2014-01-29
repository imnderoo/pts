<div class="row-fluid">
	<div class="span5">

		<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'intPlateId', 'error')} required">
			<div class="control-group">

				<label class="control-label" for="intPlateId">
					<g:message code="plate.intPlateId.label" default="Int Plate Id" />
					<span class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:textField name="intPlateId" maxlength="8" required="" readonly="true" value="${plateInstance?.intPlateId}" />
				</div>
			</div>
		</div>

		<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'extPlateId', 'error')} required">
			<div class="control-group">

				<label class="control-label" for="extPlateId">
					<g:message code="plate.extPlateId.label" default="Ext Plate Id" />
					<span class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:textField class="input-xlarge small-text" name="extPlateId" maxlength="8" required="" readonly="true" value="${plateInstance?.extPlateId}" />
				</div>
			</div>
		</div>

		<div class="control-group">

			<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'project', 'error')} required">

				<label class="control-label" for="project">
					<g:message code="plate.project.label" default="Project" />
					<span class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:textField name="project.name" maxlength="8" required="" readonly="true" value="${plateInstance?.project}" />
					<g:hiddenField name="project.id" maxlength="8" required="" readonly="true" value="${plateInstance?.project?.id}" />
				</div>
			</div>

		</div>

		<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'createdBy', 'error')} required">
			<div class="control-group">

				<label class="control-label" for="createdBy">
					<g:message code="plate.createdBy.label" default="Created By" />
					<span class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:textField name="createdBy" maxlength="8" required="" readonly="true" value="${plateInstance?.createdBy}" />
				</div>
			</div>
		</div>

		<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'createdDate', 'error')} required">
			<div class="control-group">

				<label class="control-label" for="createdDate">
					<g:message code="plate.createdDate.label" default="Created Date" />
					<span class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:textField class="datepicker" name="createdDate" maxlength="10" required=""
						value="${formatDate(date:plateInstance?.createdDate, format:"dd-MM-yyyy")}" placeholder="DD-MM-YYYY" />
				</div>
			</div>
		</div>

	</div>
	<div class="span5">
	
		<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'plateType', 'error')} required">
			<div class="control-group">

				<label class="control-label" for="plateType">
					<g:message code="plate.extPlateId.label" default="Plate Type" />
					<span class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:textField name="plateType.name" maxlength="8" required="" readonly="true" value="${plateInstance?.plateType}" />
					<g:hiddenField name="plateType.id" maxlength="8" required="" readonly="true" value="${plateInstance?.plateType?.id}" />
				</div>
			</div>
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'enzymeUsed', 'error')} ">
			<div class="control-group">

				<label class="control-label" for="enzymeUsed">
					<g:message code="plate.enzymeUsed.label" default="Enzyme Used" />

				</label>
				<div class="controls">
					<g:select name="enzymeUsed" from="${plateInstance.constraints.enzymeUsed.inList}" value="${plateInstance?.enzymeUsed}"
						valueMessagePrefix="plate.enzymeUsed" noSelection="['': '']" />
				</div>
			</div>
		</div>

		<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'pcrCondition', 'error')} ">
			<div class="control-group">

				<label class="control-label" for="pcrCondition">
					<g:message code="plate.pcrCondition.label" default="Pcr Condition" />

				</label>
				<div class="controls">
					<g:select name="pcrCondition" from="${plateInstance.constraints.pcrCondition.inList}"
						value="${plateInstance?.pcrCondition}" valueMessagePrefix="plate.pcrCondition" noSelection="['': '']" />
				</div>
			</div>
		</div>

		<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'reactionSize', 'error')} ">
			<div class="control-group">

				<label class="control-label" for="reactionSize">
					<g:message code="plate.reactionSize.label" default="Reaction Size" />

				</label>
				<div class="controls">
					<g:select name="reactionSize" from="${plateInstance.constraints.reactionSize.inList}"
						value="${plateInstance?.reactionSize}" valueMessagePrefix="plate.reactionSize" noSelection="['': '']" />
				</div>
			</div>
		</div>

		<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'chipId', 'error')} ">
			<div class="control-group">

				<label class="control-label" for="chipId">
					<g:message code="plate.chipId.label" default="Chip Id" />

				</label>
				<div class="controls">
					<g:textField name="chipId" value="${plateInstance?.chipId}" />
				</div>
			</div>
		</div>

	</div>
</div>