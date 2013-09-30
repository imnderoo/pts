

<%@ page import="pts.SamplesInPlate" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'samplesInPlate.label', default: 'SamplesInPlate')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="show-samplesInPlate"
		class="content span8 scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="alert alert-info" role="status">${flash.message}</div>
		</g:if>

		<g:form class="form-horizontal">

			
				<g:if test="${samplesInPlateInstance?.sampleId}">
				
				<div class="control-group">

					<label id="sampleId-label" class="control-label"><g:message code="samplesInPlate.sampleId.label" default="Sample Id" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="sampleId-label"><g:fieldValue bean="${samplesInPlateInstance}" field="sampleId"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${samplesInPlateInstance?.well}">
				
				<div class="control-group">

					<label id="well-label" class="control-label"><g:message code="samplesInPlate.well.label" default="Well" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="well-label"><g:fieldValue bean="${samplesInPlateInstance}" field="well"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${samplesInPlateInstance?.sampleVol}">
				
				<div class="control-group">

					<label id="sampleVol-label" class="control-label"><g:message code="samplesInPlate.sampleVol.label" default="Sample Vol" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="sampleVol-label"><g:fieldValue bean="${samplesInPlateInstance}" field="sampleVol"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${samplesInPlateInstance?.dnaAmount}">
				
				<div class="control-group">

					<label id="dnaAmount-label" class="control-label"><g:message code="samplesInPlate.dnaAmount.label" default="Dna Amount" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="dnaAmount-label"><g:fieldValue bean="${samplesInPlateInstance}" field="dnaAmount"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${samplesInPlateInstance?.dnaSource}">
				
				<div class="control-group">

					<label id="dnaSource-label" class="control-label"><g:message code="samplesInPlate.dnaSource.label" default="Dna Source" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="dnaSource-label"><g:fieldValue bean="${samplesInPlateInstance}" field="dnaSource"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${samplesInPlateInstance?.dnaType}">
				
				<div class="control-group">

					<label id="dnaType-label" class="control-label"><g:message code="samplesInPlate.dnaType.label" default="Dna Type" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="dnaType-label"><g:fieldValue bean="${samplesInPlateInstance}" field="dnaType"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${samplesInPlateInstance?.dnaExtract}">
				
				<div class="control-group">

					<label id="dnaExtract-label" class="control-label"><g:message code="samplesInPlate.dnaExtract.label" default="Dna Extract" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="dnaExtract-label"><g:fieldValue bean="${samplesInPlateInstance}" field="dnaExtract"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${samplesInPlateInstance?.comment}">
				
				<div class="control-group">

					<label id="comment-label" class="control-label"><g:message code="samplesInPlate.comment.label" default="Comment" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="comment-label"><g:fieldValue bean="${samplesInPlateInstance}" field="comment"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${samplesInPlateInstance?.plate}">
				
				<div class="control-group">

					<label id="plate-label" class="control-label"><g:message code="samplesInPlate.plate.label" default="Plate" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="plate-label"><g:link controller="plate" action="show" id="${samplesInPlateInstance?.plate?.id}">${samplesInPlateInstance?.plate?.encodeAsHTML()}</g:link></span>
					
					</div>
					
				</div>
				</g:if>
			


	
			<fieldset class="buttons">
				<div class="control-groups">
					<div class="controls">
						<g:hiddenField name="id" value="${samplesInPlateInstance?.id}" />
						<g:link class="btn" action="edit" id="${samplesInPlateInstance?.id}">
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
