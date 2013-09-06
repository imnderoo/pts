<%@ page import="pts.Plate"%>

<h5>Upload Plate Manifest:</h5>

<div class="fileupload fileupload-new" data-provides="fileupload">
	<div class="input-append">
		<span class="uneditable-input fileupload-preview"></span>
		
		<span class="btn btn-file"> <span class="fileupload-new">Select
				file</span> <span class="fileupload-exists">Change</span> <input
			type="file" name="file" /></span><a href="#" class="btn fileupload-exists"
			data-dismiss="fileupload">Remove</a>
	</div>
</div>

<%--				<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'project', 'error')} required">--%>
<%--					<div class="control-group">--%>
<%--				--%>
<%--						<label class="control-label" for="project">--%>
<%--							<g:message code="plate.project.label" default="Project" />--%>
<%--							<span class="required-indicator">*</span>--%>
<%--						</label>--%>
<%--						<div class="controls">--%>
<%--							<g:select id="project" name="project.id" from="${pts.Project.list()}" optionKey="id" required="" value="${plateInstance?.project?.id}" class="many-to-one"/>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			--%>
<%--				<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'intPlateId', 'error')} required">--%>
<%--					<div class="control-group">--%>
<%--				--%>
<%--						<label class="control-label" for="intPlateId">--%>
<%--							<g:message code="plate.intPlateId.label" default="Int Plate Id" />--%>
<%--							<span class="required-indicator">*</span>--%>
<%--						</label>--%>
<%--						<div class="controls">--%>
<%--							<g:textField name="intPlateId" maxlength="8" required="" value="${plateInstance?.intPlateId}"/>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			--%>
<%--				<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'extPlateId', 'error')} required">--%>
<%--					<div class="control-group">--%>
<%--				--%>
<%--						<label class="control-label" for="extPlateId">--%>
<%--							<g:message code="plate.extPlateId.label" default="Ext Plate Id" />--%>
<%--							<span class="required-indicator">*</span>--%>
<%--						</label>--%>
<%--						<div class="controls">--%>
<%--							<g:textField name="extPlateId" maxlength="8" required="" value="${plateInstance?.extPlateId}"/>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			--%>
<%--				<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'plateType', 'error')} required">--%>
<%--					<div class="control-group">--%>
<%--				--%>
<%--						<label class="control-label" for="plateType">--%>
<%--							<g:message code="plate.plateType.label" default="Plate Type" />--%>
<%--							<span class="required-indicator">*</span>--%>
<%--						</label>--%>
<%--						<div class="controls">--%>
<%--							<g:select id="plateType" name="plateType.id" from="${pts.PlateType.list()}" optionKey="id" required="" value="${plateInstance?.plateType?.id}" class="many-to-one"/>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			--%>
<%--				<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'createdBy', 'error')} ">--%>
<%--					<div class="control-group">--%>
<%--				--%>
<%--						<label class="control-label" for="createdBy">--%>
<%--							<g:message code="plate.createdBy.label" default="Created By" />--%>
<%--							--%>
<%--						</label>--%>
<%--						<div class="controls">--%>
<%--							<g:textField name="createdBy" maxlength="24" value="${plateInstance?.createdBy}"/>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			--%>
<%--				<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'createdDate', 'error')} ">--%>
<%--					<div class="control-group">--%>
<%--				--%>
<%--						<label class="control-label" for="createdDate">--%>
<%--							<g:message code="plate.createdDate.label" default="Created Date" />--%>
<%--							--%>
<%--						</label>--%>
<%--						<div class="controls">--%>
<%--							<g:textField name="createdDate" value="${plateInstance?.createdDate}"/>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			--%>
<%--				<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'enzymeUsed', 'error')} ">--%>
<%--					<div class="control-group">--%>
<%--				--%>
<%--						<label class="control-label" for="enzymeUsed">--%>
<%--							<g:message code="plate.enzymeUsed.label" default="Enzyme Used" />--%>
<%--							--%>
<%--						</label>--%>
<%--						<div class="controls">--%>
<%--							<g:select name="enzymeUsed" from="${plateInstance.constraints.enzymeUsed.inList}" value="${plateInstance?.enzymeUsed}" valueMessagePrefix="plate.enzymeUsed" noSelection="['': '']"/>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			--%>
<%--				<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'pcrCondition', 'error')} ">--%>
<%--					<div class="control-group">--%>
<%--				--%>
<%--						<label class="control-label" for="pcrCondition">--%>
<%--							<g:message code="plate.pcrCondition.label" default="Pcr Condition" />--%>
<%--							--%>
<%--						</label>--%>
<%--						<div class="controls">--%>
<%--							<g:select name="pcrCondition" from="${plateInstance.constraints.pcrCondition.inList}" value="${plateInstance?.pcrCondition}" valueMessagePrefix="plate.pcrCondition" noSelection="['': '']"/>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			--%>
<%--				<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'reactionSize', 'error')} ">--%>
<%--					<div class="control-group">--%>
<%--				--%>
<%--						<label class="control-label" for="reactionSize">--%>
<%--							<g:message code="plate.reactionSize.label" default="Reaction Size" />--%>
<%--							--%>
<%--						</label>--%>
<%--						<div class="controls">--%>
<%--							<g:select name="reactionSize" from="${plateInstance.constraints.reactionSize.inList}" value="${plateInstance?.reactionSize}" valueMessagePrefix="plate.reactionSize" noSelection="['': '']"/>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
<%--			--%>
<%--				<div class="fieldcontain ${hasErrors(bean: plateInstance, field: 'chipId', 'error')} ">--%>
<%--					<div class="control-group">--%>
<%--				--%>
<%--						<label class="control-label" for="chipId">--%>
<%--							<g:message code="plate.chipId.label" default="Chip Id" />--%>
<%--							--%>
<%--						</label>--%>
<%--						<div class="controls">--%>
<%--							<g:textField name="chipId" value="${plateInstance?.chipId}"/>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>

