<%@ page import="pts.Plate"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">

<title>Clone Plate</title>
</head>
<body>
	<div id="edit-plate" class="content span12 scaffold-edit" role="main">
		<h1>Clone Plate</h1>

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
						<g:actionSubmit class="btn" action="update" value="Save" />
						<g:actionSubmit class="btn btn-danger" action="delete" value="Delete" />
					</div>
				</div>
			</fieldset>

			<div class="row-fluid">
				<div class="span12">

					<g:if test="${plateInstance?.samples}">
						<h3>
							<g:message code="plate.samples.label" default="Samples In Plate" />

							<span class="btn-group" data-toggle="buttons-radio"> <g:remoteLink class="btn active"
									action="renderSamplesView" id="${plateInstance.id}" update="showSamplesView" params="[samplesGridView:'true']">
									<i class="icon-th"></i> Grid</g:remoteLink> <g:remoteLink class="btn" action="renderSamplesView" id="${plateInstance.id}"
									update="showSamplesView" params="[samplesListView:'true']">
									<i class="icon-list"></i> List</g:remoteLink>
							</span>
						</h3>
					</g:if>
					<div id="showSamplesView">
						<g:render template="showSamplesView" />
					</div>
				</div>
			</div>
		</g:form>
	</div>
</body>
</html>
