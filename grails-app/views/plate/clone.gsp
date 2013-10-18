<%@ page import="pts.Plate"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">

<title>Clone Plate</title>
</head>
<body>
	<div id="edit-plate" class="content span8 scaffold-edit" role="main">
		<h1>Clone Plate</h1>
		<g:if test="${flash.message}">
			<div class="alert alert-info" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${plateInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${plateInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
						<g:message error="${error}" />
					</li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form class="form-horizontal" method="post">
			<g:hiddenField name="id" value="${plateInstance?.id}" />

			<fieldset class="form">
				<g:render template="editForm" />
			</fieldset>

			<fieldset class="buttons">
				<div class="control-group">
					<div class="controls">
						<g:actionSubmit class="btn" action="update" value="Update" />
						<g:actionSubmit class="btn btn-danger" action="delete" value="Delete" />
					</div>
				</div>
			</fieldset>

			<fieldset class="samples">
				<div class="span12">

					<g:if test="${plateInstance?.samples}">

						<h3>
							<g:message code="plate.samples.label" default="Samples In Plate" />
						</h3>

						<g:each in="${plateInstance.samples}" var="s">
							<span class="uneditable-input input-small" aria-labelledby="samplesInPlate-label"><g:link controller="sample" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>

					</g:if>
				</div>
			</fieldset>
		</g:form>
	</div>
</body>
</html>
