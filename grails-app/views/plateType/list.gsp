

<%@ page import="pts.PlateType" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'plateType.label', default: 'PlateType')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-plateType"
		class="content span8 scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="alert alert-info" role="status">${flash.message}</div>
		</g:if>
		<table class="table table-striped table-bordered">
			<thead>
				<tr class="info">
					
						<g:sortableColumn property="name" title="${message(code: 'plateType.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="row" title="${message(code: 'plateType.row.label', default: 'Row')}" />
					
						<g:sortableColumn property="col" title="${message(code: 'plateType.col.label', default: 'Col')}" />
					
				</tr>
			</thead>
			<tbody>
				<g:each in="${plateTypeInstanceList}" status="i"
					var="plateTypeInstance">
					<tr>
						
						<td><g:link action="show" id="${plateTypeInstance.id}">${fieldValue(bean: plateTypeInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: plateTypeInstance, field: "row")}</td>
					
						<td>${fieldValue(bean: plateTypeInstance, field: "col")}</td>
					
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${plateTypeInstanceTotal}" />
		</div>
	</div>
</body>
</html>
