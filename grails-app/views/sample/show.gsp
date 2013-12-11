

<%@ page import="pts.Sample"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'sample.label', default: 'sample')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="show-sample" class="content span8 scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>

		<g:form class="form-horizontal">


			<g:if test="${sampleInstance?.sampleId}">

				<div class="control-group">

					<label id="sampleId-label" class="control-label">
						<g:message code="sample.sampleId.label" default="Sample Id" />
					</label>

					<div class="controls">

						<span class="uneditable-input" aria-labelledby="sampleId-label"><g:fieldValue bean="${sampleInstance}"
								field="sampleId" /></span>

					</div>

				</div>
			</g:if>

			<g:if test="${sampleInstance?.well}">

				<div class="control-group">

					<label id="well-label" class="control-label">
						<g:message code="sample.well.label" default="Well" />
					</label>

					<div class="controls">

						<span class="uneditable-input" aria-labelledby="well-label"><g:fieldValue bean="${sampleInstance}" field="well" /></span>

					</div>

				</div>
			</g:if>

			<g:if test="${sampleInstance?.sampleVol}">

				<div class="control-group">

					<label id="sampleVol-label" class="control-label">
						<g:message code="sample.sampleVol.label" default="Sample Vol" />
					</label>

					<div class="controls">

						<span class="uneditable-input" aria-labelledby="sampleVol-label"><g:fieldValue bean="${sampleInstance}"
								field="sampleVol" /></span>

					</div>

				</div>
			</g:if>

			<g:if test="${sampleInstance?.dnaAmount}">

				<div class="control-group">

					<label id="dnaAmount-label" class="control-label">
						<g:message code="sample.dnaAmount.label" default="Dna Amount" />
					</label>

					<div class="controls">

						<span class="uneditable-input" aria-labelledby="dnaAmount-label"><g:fieldValue bean="${sampleInstance}"
								field="dnaAmount" /></span>

					</div>

				</div>
			</g:if>

			<g:if test="${sampleInstance?.dnaSource}">

				<div class="control-group">

					<label id="dnaSource-label" class="control-label">
						<g:message code="sample.dnaSource.label" default="Dna Source" />
					</label>

					<div class="controls">

						<span class="uneditable-input" aria-labelledby="dnaSource-label"><g:fieldValue bean="${sampleInstance}"
								field="dnaSource" /></span>

					</div>

				</div>
			</g:if>

			<g:if test="${sampleInstance?.dnaType}">

				<div class="control-group">

					<label id="dnaType-label" class="control-label">
						<g:message code="sample.dnaType.label" default="Dna Type" />
					</label>

					<div class="controls">

						<span class="uneditable-input" aria-labelledby="dnaType-label"><g:fieldValue bean="${sampleInstance}"
								field="dnaType" /></span>

					</div>

				</div>
			</g:if>

			<g:if test="${sampleInstance?.dnaExtract}">

				<div class="control-group">

					<label id="dnaExtract-label" class="control-label">
						<g:message code="sample.dnaExtract.label" default="Dna Extract" />
					</label>

					<div class="controls">

						<span class="uneditable-input" aria-labelledby="dnaExtract-label"><g:fieldValue bean="${sampleInstance}"
								field="dnaExtract" /></span>

					</div>

				</div>
			</g:if>

			<g:if test="${sampleInstance?.comment}">

				<div class="control-group">

					<label id="comment-label" class="control-label">
						<g:message code="sample.comment.label" default="Comment" />
					</label>

					<div class="controls">

						<span class="uneditable-input" aria-labelledby="comment-label"><g:fieldValue bean="${sampleInstance}"
								field="comment" /></span>

					</div>

				</div>
			</g:if>

			<g:if test="${sampleInstance?.plate}">

				<div class="control-group">

					<label id="plate-label" class="control-label">
						<g:message code="sample.plate.label" default="Plate" />
					</label>

					<div class="controls">

						<span class="uneditable-input" aria-labelledby="plate-label"><g:link controller="plate" action="show"
								id="${sampleInstance?.plate?.id}">
								${sampleInstance?.plate?.encodeAsHTML()}
							</g:link></span>

					</div>

				</div>
			</g:if>




			<fieldset class="buttons">
				<div class="control-groups">
					<div class="controls">
						<g:hiddenField name="id" value="${sampleInstance?.id}" />
						<g:link class="btn" action="edit" id="${sampleInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<g:actionSubmit class="btn" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</div>
				</div>
			</fieldset>
		</g:form>
	</div>
</body>
</html>
