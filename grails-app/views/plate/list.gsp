

<%@ page import="pts.Plate"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'plate.label', default: 'Plate')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-plate" class="content span12" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>

		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<g:form class="navbar-form">
						<input type="text" class="span2" name="intPlateId" placeholder="Int Plate ID" value="${params.intPlateId}">
						<input type="text" class="span2" name="extPlateId" placeholder="Ext Plate ID" value="${params.extPlateId}">
						<g:select class="input-medium many-to-one" id="project" name="projectId" from="${pts.Project.list()}" optionKey="id"
							value="${params.projectId}" noSelection="${[0:'All Projects']}" />

						<g:actionSubmit action="list" value="Search" class="btn" />

						<div class="btn-group pull-right">
							<a class="btn dropdown-toggle pull-right" data-toggle="dropdown" href="dropdown-menu"> Export <span class="caret"></span>
							</a>

							<ul class="dropdown-menu">
								<li class="nav-header">Plates List</li>
								<li>
									<g:actionSubmit action="exportPlateList" class="submit-dropdown" value="To CSV" />
								</li>
							</ul>
						</div>

					</g:form>


				</div>
			</div>
		</div>

		<div class="row-fluid">
			<div id="listPlate384" class="span6">
				<g:render template="listPlate384" />
			</div>

			<div id="listPlate96" class="span6">
				<g:render template="listPlate96" />
			</div>
		</div>

	</div>
</body>
</html>
