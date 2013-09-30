

<%@ page import="pts.Investigator"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'investigator.label', default: 'Investigator')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="show-investigator" class="content span8 scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="alert alert-info" role="status">
				${flash.message}
			</div>
		</g:if>

		<g:form class="form-horizontal">


			<g:if test="${investigatorInstance?.firstName}">

				<div class="control-group">

					<label id="firstName-label" class="control-label">
						<g:message code="investigator.firstName.label" default="First Name" />
					</label>

					<div class="controls">

						<span class="uneditable-input" aria-labelledby="firstName-label"><g:fieldValue bean="${investigatorInstance}"
								field="firstName" /></span>

					</div>

				</div>
			</g:if>

			<g:if test="${investigatorInstance?.lastName}">

				<div class="control-group">

					<label id="lastName-label" class="control-label">
						<g:message code="investigator.lastName.label" default="Last Name" />
					</label>

					<div class="controls">

						<span class="uneditable-input" aria-labelledby="lastName-label"><g:fieldValue bean="${investigatorInstance}"
								field="lastName" /></span>

					</div>

				</div>
			</g:if>

			<fieldset class="buttons">
				<div class="control-groups">
					<div class="controls">
						<g:hiddenField name="id" value="${investigatorInstance?.id}" />
						<g:link class="btn" action="edit" id="${investigatorInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<g:actionSubmit class="btn" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</div>
				</div>
			</fieldset>
			<p></p>

			<g:if test="${investigatorInstance?.project}">

				<div class="control-group">

					<label id="project-label" class="control-label">
						<g:message code="investigator.project.label" default="Project" />
					</label>

					<div class="controls">

						<table class="table table-bordered">

							<g:each in="${investigatorInstance.project}" var="p">
								<tr>
									<td>
										<g:link controller="project" action="show" id="${p.id}">
											${p?.encodeAsHTML()}
										</g:link>
									</td>
								</tr>
							</g:each>
						</table>
					</div>

				</div>
			</g:if>





		</g:form>
	</div>
</body>
</html>
