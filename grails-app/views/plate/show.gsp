

<%@ page import="pts.Plate" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'plate.label', default: 'Plate')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="show-plate"
		class="content span8 scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="alert alert-info" role="status">${flash.message}</div>
		</g:if>

		<g:form class="form-horizontal">

			
				<g:if test="${plateInstance?.project}">
				
				<div class="control-group">

					<label id="project-label" class="control-label"><g:message code="plate.project.label" default="Project" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="project-label"><g:link controller="project" action="show" id="${plateInstance?.project?.id}">${plateInstance?.project?.encodeAsHTML()}</g:link></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${plateInstance?.intPlateId}">
				
				<div class="control-group">

					<label id="intPlateId-label" class="control-label"><g:message code="plate.intPlateId.label" default="Int Plate Id" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="intPlateId-label"><g:fieldValue bean="${plateInstance}" field="intPlateId"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${plateInstance?.extPlateId}">
				
				<div class="control-group">

					<label id="extPlateId-label" class="control-label"><g:message code="plate.extPlateId.label" default="Ext Plate Id" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="extPlateId-label"><g:fieldValue bean="${plateInstance}" field="extPlateId"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${plateInstance?.plateType}">
				
				<div class="control-group">

					<label id="plateType-label" class="control-label"><g:message code="plate.plateType.label" default="Plate Type" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="plateType-label"><g:link controller="plateType" action="show" id="${plateInstance?.plateType?.id}">${plateInstance?.plateType?.encodeAsHTML()}</g:link></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${plateInstance?.createdBy}">
				
				<div class="control-group">

					<label id="createdBy-label" class="control-label"><g:message code="plate.createdBy.label" default="Created By" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="createdBy-label"><g:fieldValue bean="${plateInstance}" field="createdBy"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${plateInstance?.createdDate}">
				
				<div class="control-group">

					<label id="createdDate-label" class="control-label"><g:message code="plate.createdDate.label" default="Created Date" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="createdDate-label"><g:fieldValue bean="${plateInstance}" field="createdDate"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${plateInstance?.childrenPlate}">
				
				<div class="control-group">

					<label id="childrenPlate-label" class="control-label"><g:message code="plate.childrenPlate.label" default="Children Plate" /></label>
					
					<div class="controls">
					
						<g:each in="${plateInstance.childrenPlate}" var="c">
						<span class="uneditable-input" aria-labelledby="childrenPlate-label"><g:link controller="plate" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${plateInstance?.enzymeUsed}">
				
				<div class="control-group">

					<label id="enzymeUsed-label" class="control-label"><g:message code="plate.enzymeUsed.label" default="Enzyme Used" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="enzymeUsed-label"><g:fieldValue bean="${plateInstance}" field="enzymeUsed"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${plateInstance?.pcrCondition}">
				
				<div class="control-group">

					<label id="pcrCondition-label" class="control-label"><g:message code="plate.pcrCondition.label" default="Pcr Condition" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="pcrCondition-label"><g:fieldValue bean="${plateInstance}" field="pcrCondition"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${plateInstance?.reactionSize}">
				
				<div class="control-group">

					<label id="reactionSize-label" class="control-label"><g:message code="plate.reactionSize.label" default="Reaction Size" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="reactionSize-label"><g:fieldValue bean="${plateInstance}" field="reactionSize"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${plateInstance?.chipId}">
				
				<div class="control-group">

					<label id="chipId-label" class="control-label"><g:message code="plate.chipId.label" default="Chip Id" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="chipId-label"><g:fieldValue bean="${plateInstance}" field="chipId"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${plateInstance?.samples}">
				
				<div class="control-group">

					<label id="samplesInPlate-label" class="control-label"><g:message code="plate.samples.label" default="Sample In Plate" /></label>
					
					<div class="controls">
					
						<g:each in="${plateInstance.samples}" var="s">
						<span class="uneditable-input" aria-labelledby="samplesInPlate-label"><g:link controller="sample" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
					</div>
					
				</div>
				</g:if>
			


	
			<fieldset class="buttons">
				<div class="control-groups">
					<div class="controls">
						<g:hiddenField name="id" value="${plateInstance?.id}" />
						<g:link class="btn" action="edit" id="${plateInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<g:actionSubmit class="btn" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</div>
				</div>
			</fieldset>
		</g:form>
	</div>
</body>
</html>
