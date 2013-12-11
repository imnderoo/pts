<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'intPlateId', 'error')} required">
	<div class="control-group">

		<label class="control-label" for="intPlateId">
			<g:message code="plate.intPlateId.label" default="Int Plate Prefix" />
			<span class="required-indicator">*</span>
		</label>
		<div class="controls">
			<g:textField class="input-small" name="intPlatePrefix" required="" pattern="[a-zA-Z]{2}" placeholder="2-letters" maxlength="2" value="${params.intPlatePrefix}"/>
		</div>
	</div>
</div>

<div class="control-group">
	<label class="control-label">Plate Manifest:</label>
	<div class="controls">
		<div class="fileupload fileupload-new" data-provides="fileupload">
			<div class="input-append">
				<span class="uneditable-input fileupload-preview input-medium"></span> <span class="btn btn-file"> <span class="fileupload-new">Select
						file</span> <span class="fileupload-exists">Change</span> <input type="file" name="file" /></span><a href="#"
					class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>
			</div>
		</div>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'enzymeUsed', 'error')} ">
	<div class="control-group">

		<label class="control-label" for="enzymeUsed">
			<g:message code="plate.enzymeUsed.label" default="Enzyme Used" />

		</label>
		<div class="controls">
			<g:select  class="input-medium"  name="enzymeUsed" from="${plateInstance.constraints.enzymeUsed.inList}" value="${plateInstance?.enzymeUsed}"
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
			<g:select  class="input-medium" name="pcrCondition" from="${plateInstance.constraints.pcrCondition.inList}"
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
			<g:select  class="input-medium" name="reactionSize" from="${plateInstance.constraints.reactionSize.inList}"
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
			<g:textField  class="input-medium" name="chipId" value="${plateInstance?.chipId}" />
		</div>
	</div>
</div>

