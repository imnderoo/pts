<%@ page import="pts.SampleInPlate" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'sampleInPlate.label', default: 'SampleInPlate')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div id="edit-sampleInPlate"
		class="content scaffold-edit" role="main">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${sampleInPlateInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${sampleInPlateInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form class="form-horizontal" method="post"
			>
			<g:hiddenField name="id" value="${sampleInPlateInstance?.id}" />
			<g:hiddenField name="version" value="${sampleInPlateInstance?.version}" />
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>
			<fieldset class="buttons">
				<div class="control-group">
					<div class="controls">
						<g:actionSubmit class="btn" action="update"
							value="${message(code: 'default.button.update.label', default: 'Update')}" />
						<g:actionSubmit class="btn" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							formnovalidate=""
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</div>
				</div>
			</fieldset>
		</g:form>
	</div>
</body>
</html>
