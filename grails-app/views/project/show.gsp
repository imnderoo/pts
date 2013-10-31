

<%@ page import="pts.Project" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'project.label', default: 'Project')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="show-project"
		class="content span8 scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="alert alert-info" role="status">${flash.message}</div>
		</g:if>

		<g:form class="form-horizontal">

			
				<g:if test="${projectInstance?.name}">
				
				<div class="control-group">

					<label id="name-label" class="control-label"><g:message code="project.name.label" default="Name" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="name-label"><g:fieldValue bean="${projectInstance}" field="name"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${projectInstance?.investigator}">
					<div class="control-group">
						<label id="investigator-label" class="control-label"><g:message code="project.investigator.label" default="Investigator" /></label>
						<div class="controls">
							<span class="uneditable-input" aria-labelledby="investigator-label"><g:link controller="investigator" action="show" id="${projectInstance?.investigator?.id}">${projectInstance?.investigator?.encodeAsHTML()}</g:link></span>						
						</div>
					
					</div>
				</g:if>

			<fieldset class="buttons">
				<div class="control-groups">
					<div class="controls">
						<g:hiddenField name="id" value="${projectInstance?.id}" />
						<g:link class="btn" action="edit" id="${projectInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<g:actionSubmit class="btn" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</div>
				</div>
			</fieldset>
		</g:form>

		<g:if test="${projectInstance?.plate}">
		<h3>Plate List</h3>
			<table class="table table-striped table-bordered">
				<g:each in="${projectInstance.plate}" var="p">
					<tr>
						<td>
							<g:link controller="plate" action="show"id="${p.id}">${p?.encodeAsHTML()}</g:link>
						</td>
					</tr>
				</g:each>
			</table>
		</g:if>
	</div>
</body>
</html>
