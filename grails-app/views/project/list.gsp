

<%@ page import="pts.Project"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-project" class="content span8 scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
	
		<table class="table table-striped table-bordered">
			<thead>
				<tr class="info">

					<g:sortableColumn property="name" title="${message(code: 'project.name.label', default: 'Name')}" />

					<g:sortableColumn property="investigator.lastName"
						title="${message(code: 'project.investigator.labelr', default: 'Investigator')}" />

					<th># Plates</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${projectInstanceList}" status="i" var="projectInstance">
					<tr>

						<td>
							<g:link action="show" id="${projectInstance.id}">
								${fieldValue(bean: projectInstance, field: "name")}
							</g:link>
						</td>

						<td>
							${fieldValue(bean: projectInstance, field: "investigator")}
						</td>
						
						<td>
							<g:set var="plates" value="${0}"/>
						
							<g:each in="${projectInstance.plate}">
									<g:set var="plates" value="${plates + 1}"/>
							</g:each>
							${plates}
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${projectInstanceTotal}" />
		</div>
	</div>
</body>
</html>
