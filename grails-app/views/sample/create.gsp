<%@ page import="pts.Sample"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'sample.label', default: 'sample')}" />
<title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
	<div id="create-sample" class="content span8 scaffold-create" role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>

		<g:hasErrors bean="${sampleInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${sampleInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
						<g:message error="${error}" />
					</li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form class="form-horizontal" action="save">
			<fieldset class="form">
				<g:render template="form" />
			</fieldset>
			<fieldset class="buttons">
				<div class="control-group">
					<div class="controls">
						<g:submitButton name="create" class="btn" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</div>
				</div>
			</fieldset>
		</g:form>
	</div>
</body>
</html>
