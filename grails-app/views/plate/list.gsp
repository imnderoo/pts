

<%@ page import="pts.Plate" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'plate.label', default: 'Plate')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-plate"
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
					
						<th><g:message code="plate.project.label" default="Project" /></th>
					
						<g:sortableColumn property="intPlateId" title="${message(code: 'plate.intPlateId.label', default: 'Int Plate Id')}" />
					
						<g:sortableColumn property="extPlateId" title="${message(code: 'plate.extPlateId.label', default: 'Ext Plate Id')}" />
					
						<th><g:message code="plate.plateType.label" default="Plate Type" /></th>
					
						<g:sortableColumn property="createdBy" title="${message(code: 'plate.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="createdDate" title="${message(code: 'plate.createdDate.label', default: 'Created Date')}" />
					
				</tr>
			</thead>
			<tbody>
				<g:each in="${plateInstanceList}" status="i"
					var="plateInstance">
					<tr>
						
						<td><g:link action="show" id="${plateInstance.id}">${fieldValue(bean: plateInstance, field: "project")}</g:link></td>
					
						<td>${fieldValue(bean: plateInstance, field: "intPlateId")}</td>
					
						<td>${fieldValue(bean: plateInstance, field: "extPlateId")}</td>
					
						<td>${fieldValue(bean: plateInstance, field: "plateType")}</td>
					
						<td>${fieldValue(bean: plateInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: plateInstance, field: "createdDate")}</td>
					
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${plateInstanceTotal}" />
		</div>
	</div>
</body>
</html>
