

<%@ page import="pts.Project" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'project.label', default: 'Project')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-project"
		class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<table class="table table-striped">
			<thead>
				<tr class="info">
					
						<g:sortableColumn property="name" title="${message(code: 'project.name.label', default: 'Name')}" />
					
						<th><g:message code="project.investigator.label" default="Investigator" /></th>
					
				</tr>
			</thead>
			<tbody>
				<g:each in="${projectInstanceList}" status="i"
					var="projectInstance">
					<tr>
						
						<td><g:link action="show" id="${projectInstance.id}">${fieldValue(bean: projectInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: projectInstance, field: "investigator")}</td>
					
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
