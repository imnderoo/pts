<%@ page import="pts.PlateType" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'plateType.label', default: 'PlateType')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div id="edit-plateType"
		class="content span8 scaffold-edit" role="main">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="alert alert-info" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${plateTypeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${plateTypeInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form class="form-horizontal" method="post"
			>
			<g:hiddenField name="id" value="${plateTypeInstance?.id}" />
			<g:hiddenField name="version" value="${plateTypeInstance?.version}" />
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
