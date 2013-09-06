

<%@ page import="pts.Investigator" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'investigator.label', default: 'Investigator')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-investigator"
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
					
						<g:sortableColumn property="firstName" title="${message(code: 'investigator.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'investigator.lastName.label', default: 'Last Name')}" />
					
				</tr>
			</thead>
			<tbody>
				<g:each in="${investigatorInstanceList}" status="i"
					var="investigatorInstance">
					<tr>
						
						<td><g:link action="show" id="${investigatorInstance.id}">${fieldValue(bean: investigatorInstance, field: "firstName")}</g:link></td>
					
						<td>${fieldValue(bean: investigatorInstance, field: "lastName")}</td>
					
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${investigatorInstanceTotal}" />
		</div>
	</div>
</body>
</html>
