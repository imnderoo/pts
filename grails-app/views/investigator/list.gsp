<%@ page import="pts.Investigator"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'investigator.label', default: 'Investigator')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-investigator" class="content span8 scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="alert alert-info" role="status">
				${flash.message}
			</div>
		</g:if>
		<table class="table table-striped table-bordered">
			<thead>
				<tr class="info">

					<g:sortableColumn property="lastName" title="${message(code: 'investigator.lastName.label', default: 'Name')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${investigatorInstanceList}" status="i" var="investigatorInstance">
					<tr>
						<td>
							<g:link action="show" id="${investigatorInstance.id}">

								${fieldValue(bean: investigatorInstance, field: "lastName")}, ${fieldValue(bean: investigatorInstance, field: "firstName")}
							</g:link>
						</td>
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
