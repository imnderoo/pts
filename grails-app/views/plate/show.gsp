<%@ page import="pts.Plate"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'plate.label', default: 'Plate')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="show-plate" class="content span12 scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>

		<g:hasErrors bean="${plateInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${plateInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
						<g:message error="${error}" />
					</li>
				</g:eachError>
			</ul>
		</g:hasErrors>

		<g:form class="form-horizontal">
			<div class="row-fluid">
				<div class="span5">

					<div class="control-group">
						<label id="intPlateId-label" class="control-label">
							<g:message code="plate.intPlateId.label" default="Int Plate Id" />
						</label>
						<div class="controls">
							<span class="uneditable-input" aria-labelledby="intPlateId-label"><g:fieldValue bean="${plateInstance}"
									field="intPlateId" /></span>
						</div>
					</div>

					<div class="control-group">
						<label id="extPlateId-label" class="control-label">
							<g:message code="plate.extPlateId.label" default="Ext Plate Id" />
						</label>
						<div class="controls">
							<span class="uneditable-input" aria-labelledby="extPlateId-label"><g:fieldValue bean="${plateInstance}"
									field="extPlateId" /></span>
						</div>
					</div>

					<div class="control-group">
						<label id="project-label" class="control-label">
							<g:message code="plate.project.label" default="Project" />
						</label>
						<div class="controls">
							<span class="uneditable-input" aria-labelledby="project-label"><g:link controller="project" action="show" id="${plateInstance?.project?.id}">${plateInstance?.project?.encodeAsHTML()}
								</g:link></span>
						</div>
					</div>

					<div class="control-group">
						<label id="createdBy-label" class="control-label">
							<g:message code="plate.createdBy.label" default="Created By" />
						</label>
						<div class="controls">
							<span class="uneditable-input" aria-labelledby="createdBy-label"><g:fieldValue bean="${plateInstance}"
									field="createdBy" /></span>
						</div>
					</div>

					<div class="control-group">
						<label id="createdDate-label" class="control-label">
							<g:message code="plate.createdDate.label" default="Created Date" />
						</label>
						<div class="controls">
							<span class="uneditable-input" aria-labelledby="createdDate-label"><g:fieldValue bean="${plateInstance}"
									field="createdDate" /></span>
						</div>
					</div>

					<fieldset class="buttons">

						<div class="control-groups">
							<div class="controls">
								<g:hiddenField name="id" value="${plateInstance?.id}" />

								<g:link class="btn" action="edit" id="${plateInstance?.id}">
									<g:message code="default.button.edit.label" default="Edit" />
								</g:link>

								<g:if test="${plateInstance?.plateType?.name == "Plate96" }">
									<g:link class="btn" action="clone" id="${plateInstance?.id}">
										<g:message code="default.button.clone.label" default="Clone" />
									</g:link>
								</g:if>
								
								<g:actionSubmit class="btn btn-danger" action="delete"
									value="${message(code: 'default.button.delete.label', default: 'Delete')}"
									onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
							</div>
						</div>
						
					</fieldset>
				</div>
				<div class="span5">
					<div class="control-group">
						<label id="plateType-label" class="control-label">
							<g:message code="plate.plateType.label" default="Plate Type" />
						</label>
						<div class="controls">
							<span class="uneditable-input" aria-labelledby="plateType-label">${plateInstance?.plateType?.encodeAsHTML()}</span>
						</div>
					</div>

					<div class="control-group">
						<label id="enzymeUsed-label" class="control-label">
							<g:message code="plate.enzymeUsed.label" default="Enzyme Used" />
						</label>

						<div class="controls">
							<span class="uneditable-input" aria-labelledby="enzymeUsed-label"><g:fieldValue bean="${plateInstance}"
									field="enzymeUsed" /></span>
						</div>
					</div>

					<div class="control-group">
						<label id="pcrCondition-label" class="control-label">
							<g:message code="plate.pcrCondition.label" default="Pcr Condition" />
						</label>
						<div class="controls">
							<span class="uneditable-input" aria-labelledby="pcrCondition-label"><g:fieldValue bean="${plateInstance}"
									field="pcrCondition" /></span>
						</div>
					</div>

					<div class="control-group">
						<label id="reactionSize-label" class="control-label">
							<g:message code="plate.reactionSize.label" default="Reaction Size" />
						</label>

						<div class="controls">
							<span class="uneditable-input" aria-labelledby="reactionSize-label"><g:fieldValue bean="${plateInstance}"
									field="reactionSize" /></span>
						</div>
					</div>

					<div class="control-group">
						<label id="chipId-label" class="control-label">
							<g:message code="plate.chipId.label" default="Chip Id" />
						</label>
						<div class="controls">
							<span class="uneditable-input" aria-labelledby="chipId-label"><g:fieldValue bean="${plateInstance}"
									field="chipId" /></span>
						</div>
					</div>

				</div>
			</div>

		</g:form>

		<div class="row-fluid">
			<div class="span12">

				<g:if test="${plateInstance?.samples}">
					<h3>
						<g:message code="plate.samples.label" default="Samples In Plate" />

						<span class="btn-group" data-toggle="buttons-radio"> <g:remoteLink class="btn active" action="render_showSamplesView"
								id="${plateInstance.id}" update="showSamplesView" params="[samplesGridView:'true']"><i class="icon-th"></i> Grid</g:remoteLink> <g:remoteLink
								class="btn" action="render_showSamplesView" id="${plateInstance.id}" update="showSamplesView" params="[samplesListView:'true']"><i class="icon-list"></i> List</g:remoteLink>
						</span>
						
						<div class="btn-group">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="dropdown-menu">
								Export <span class="caret"></span>
							</a>
							
							<ul class="dropdown-menu">
								<li class="nav-header">Samples List</li>						
								<li><g:link action="exportSampleList" id="${plateInstance.id}" params="[format:'sequenome']">To Sequenome</g:link></li>
								<li><g:link action="exportSampleList" id="${plateInstance.id}" params="[format:'csvList']">To CSV</g:link></li>
								<li class="nav-header">Samples Grid</li>						
								<li><g:link action="exportSampleList" id="${plateInstance.id}" params="[format:'csvGrid']">To CSV</g:link></li>
							</ul>
						</div>
						
					</h3>
				</g:if>
				<div id="showSamplesView">
					<g:render template="showSamplesView" />
				</div>
			</div>
		</div>


		<g:if test="${plateInstance?.plateType?.name == "Plate384"}">
			<h3>
				<g:message code="plate.q1Plate.label" default="Children Plate" />
				
							<div class="btn-group">
							<a class="btn dropdown-toggle" data-toggle="dropdown" href="dropdown-menu">
								Export <span class="caret"></span>
							</a>
							
							<ul class="dropdown-menu">
								<li class="nav-header">Samples List</li>
								<li><g:link action="exportSample384List" id="${plateInstance.id}" params="[format:'csvList']">To CSV</g:link></li>
								<li class="nav-header">Samples Grid</li>
								<li><g:link action="exportSample384List" id="${plateInstance.id}" params="[format:'csvGrid']">To CSV</g:link></li>
								
							</ul>
						</div>
						
			</h3>

			<div class="row-fluid">
				<div class="span5">
					<table class="table table-bordered">
						<tr>
							<td>
								<h5>Quadrant 1:</h5>
								<span class="uneditable-input input-medium" aria-labelledby="q1Plate-label"><g:remoteLink controller="plate" action="render_showPlateInfo" update="showPlateInfo" id="${plateInstance.q1Plate?.id}">${plateInstance.q1Plate?.encodeAsHTML()}
									</g:remoteLink></span>
							</td>
							<td>
								<h5>Quadrant 2:</h5>
								<span class="uneditable-input input-medium" aria-labelledby="q2Plate-label"><g:remoteLink controller="plate" action="render_showPlateInfo"  update="showPlateInfo"  id="${plateInstance.q2Plate?.id}">${plateInstance.q2Plate?.encodeAsHTML()}
									</g:remoteLink></span>
							</td>
						</tr>
						<tr>
							<td>
								<h5>Quadrant 3:</h5>
								<span class="uneditable-input input-medium" aria-labelledby="q2Plate-label"><g:remoteLink controller="plate" action="render_showPlateInfo"  update="showPlateInfo"  id="${plateInstance.q3Plate?.id}">${plateInstance.q3Plate?.encodeAsHTML()}
									</g:remoteLink></span>
							</td>
							<td>
								<h5>Quadrant 4:</h5>
								<span class="uneditable-input input-medium" aria-labelledby="q2Plate-label"><g:remoteLink controller="plate" action="render_showPlateInfo"  update="showPlateInfo" id="${plateInstance.q4Plate?.id}">${plateInstance.q4Plate?.encodeAsHTML()}
									</g:remoteLink></span>
							</td>
						</tr>
					</table>
				</div>
				<div class="span6">
					<div id="showPlateInfo">
						<g:render template="showPlateInfo" />
					</div>
				</div>
			</div>
		</g:if>
		
		<g:if test="${motherPlateList}">
			<h3>
				<g:message code="plate.q1Plate.label" default="Mother Plate" />
			</h3>
			<div class="row-fluid">
				<div class="span4">
					<table class="table table-striped table-bordered">
						<tr class="info">
							<td>
								<b>Plate ID</b>
							</td>
						</tr>
						<g:each in="${motherPlateList}" var="m" status="count">
							<tr>
								<td>
									<g:link class="small-text" controller="plate" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link>
								</td>
							</tr>
						</g:each>
					</table>
				</div>
			</div>
		</g:if>

	</div>
</body>
</html>
