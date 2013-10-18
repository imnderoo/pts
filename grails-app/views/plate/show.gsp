<%@ page import="pts.Plate"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'plate.label', default: 'Plate')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="show-plate"
		class="content span12 scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="alert alert-info" role="status">${flash.message}</div>
		</g:if>

		<g:form class="form-horizontal">
				
				<div class="row-fluid">
				<div class="span5">
				<div class="control-group">
					<label id="project-label" class="control-label"><g:message code="plate.project.label" default="Project" /></label>
					<div class="controls">
						<span class="uneditable-input" aria-labelledby="project-label"><g:link controller="project" action="show" id="${plateInstance?.project?.id}">${plateInstance?.project?.encodeAsHTML()}</g:link></span>
					</div>
				</div>
	
				<div class="control-group">
					<label id="intPlateId-label" class="control-label"><g:message code="plate.intPlateId.label" default="Int Plate Id" /></label>
					<div class="controls">	
						<span class="uneditable-input" aria-labelledby="intPlateId-label"><g:fieldValue bean="${plateInstance}" field="intPlateId"/></span>					
					</div>				
				</div>
				
				<div class="control-group">
					<label id="extPlateId-label" class="control-label"><g:message code="plate.extPlateId.label" default="Ext Plate Id" /></label>		
					<div class="controls">			
						<span class="uneditable-input" aria-labelledby="extPlateId-label"><g:fieldValue bean="${plateInstance}" field="extPlateId"/></span>		
					</div>				
				</div>
				
				<div class="control-group">
					<label id="plateType-label" class="control-label"><g:message code="plate.plateType.label" default="Plate Type" /></label>				
					<div class="controls">				
						<span class="uneditable-input" aria-labelledby="plateType-label"><g:link controller="plateType" action="show" id="${plateInstance?.plateType?.id}">${plateInstance?.plateType?.encodeAsHTML()}</g:link></span>
					</div>
				</div>
			
				<div class="control-group">
					<label id="createdBy-label" class="control-label"><g:message code="plate.createdBy.label" default="Created By" /></label>
					<div class="controls">
						<span class="uneditable-input" aria-labelledby="createdBy-label"><g:fieldValue bean="${plateInstance}" field="createdBy"/></span>
					</div>
				</div>
				
				<div class="control-group">
					<label id="createdDate-label" class="control-label"><g:message code="plate.createdDate.label" default="Created Date" /></label>
					<div class="controls">
						<span class="uneditable-input" aria-labelledby="createdDate-label"><g:fieldValue bean="${plateInstance}" field="createdDate"/></span>
					</div>
				</div>
				
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
						
						<g:link class="btn" action="clone" id="${plateInstance?.id}">
							<g:message code="default.button.clone.label" default="Clone" />
						</g:link>
					</div>
				</div>
			</fieldset>
				</div>
				<div class="span5">
				
				<div class="control-group">
					<label id="enzymeUsed-label" class="control-label"><g:message code="plate.enzymeUsed.label" default="Enzyme Used" /></label>
					
					<div class="controls">
						<span class="uneditable-input" aria-labelledby="enzymeUsed-label"><g:fieldValue bean="${plateInstance}" field="enzymeUsed"/></span>
					</div>
				</div>

				<div class="control-group">
					<label id="pcrCondition-label" class="control-label"><g:message code="plate.pcrCondition.label" default="Pcr Condition" /></label>
					<div class="controls">	
						<span class="uneditable-input" aria-labelledby="pcrCondition-label"><g:fieldValue bean="${plateInstance}" field="pcrCondition"/></span>
					</div>
				</div>
				
				<div class="control-group">

					<label id="reactionSize-label" class="control-label"><g:message code="plate.reactionSize.label" default="Reaction Size" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="reactionSize-label"><g:fieldValue bean="${plateInstance}" field="reactionSize"/></span>
					
					</div>
					
				</div>
			

				
				<div class="control-group">
					<label id="chipId-label" class="control-label"><g:message code="plate.chipId.label" default="Chip Id" /></label>
					<div class="controls">
						<span class="uneditable-input" aria-labelledby="chipId-label"><g:fieldValue bean="${plateInstance}" field="chipId"/></span>
					</div>
				</div>
				
			</div>
			</div>
			
			</g:form>
				
			<div class="row-fluid">
			<div class="span12">
		
				<g:if test="${plateInstance?.samples}">

					<h3><g:message code="plate.samples.label" default="Samples In Plate" /></h3>
					
						<g:each in="${plateInstance.samples}" var="s">
						<span class="uneditable-input input-small" aria-labelledby="samplesInPlate-label"><g:link controller="sample" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</g:if>
			</div>
			</div>

			<g:if test="${plateInstance?.childrenPlate}">
			
				<h3><g:message code="plate.childrenPlate.label" default="Children Plate" /></h3>
			
						
							<g:each in="${plateInstance.childrenPlate}" var="c">
							<span class="uneditable-input" aria-labelledby="childrenPlate-label"><g:link controller="plate" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
							</g:each>
						
				</g:if>


	</div>
</body>
</html>
