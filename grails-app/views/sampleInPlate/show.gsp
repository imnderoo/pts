

<%@ page import="pts.SampleInPlate" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'sampleInPlate.label', default: 'SampleInPlate')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="show-sampleInPlate"
		class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>

		<g:form class="form-horizontal">

			
				<g:if test="${sampleInPlateInstance?.well}">
				
				<div class="control-group">

					<label id="well-label" class="control-label"><g:message code="sampleInPlate.well.label" default="Well" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="well-label"><g:fieldValue bean="${sampleInPlateInstance}" field="well"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${sampleInPlateInstance?.plate}">
				
				<div class="control-group">

					<label id="plate-label" class="control-label"><g:message code="sampleInPlate.plate.label" default="Plate" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="plate-label"><g:link controller="plate" action="show" id="${sampleInPlateInstance?.plate?.id}">${sampleInPlateInstance?.plate?.encodeAsHTML()}</g:link></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${sampleInPlateInstance?.result}">
				
				<div class="control-group">

					<label id="result-label" class="control-label"><g:message code="sampleInPlate.result.label" default="Result" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="result-label"><g:fieldValue bean="${sampleInPlateInstance}" field="result"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${sampleInPlateInstance?.sample}">
				
				<div class="control-group">

					<label id="sample-label" class="control-label"><g:message code="sampleInPlate.sample.label" default="Sample" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="sample-label"><g:link controller="sample" action="show" id="${sampleInPlateInstance?.sample?.id}">${sampleInPlateInstance?.sample?.encodeAsHTML()}</g:link></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${sampleInPlateInstance?.status}">
				
				<div class="control-group">

					<label id="status-label" class="control-label"><g:message code="sampleInPlate.status.label" default="Status" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="status-label"><g:fieldValue bean="${sampleInPlateInstance}" field="status"/></span>
					
					</div>
					
				</div>
				</g:if>
			


	
			<fieldset class="buttons">
				<div class="control-groups">
					<div class="controls">
						<g:hiddenField name="id" value="${sampleInPlateInstance?.id}" />
						<g:link class="btn" action="edit" id="${sampleInPlateInstance?.id}">
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
