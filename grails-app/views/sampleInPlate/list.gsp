

<%@ page import="pts.SampleInPlate" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'sampleInPlate.label', default: 'SampleInPlate')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-sampleInPlate"
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
					
						<g:sortableColumn property="well" title="${message(code: 'sampleInPlate.well.label', default: 'Well')}" />
					
						<th><g:message code="sampleInPlate.plate.label" default="Plate" /></th>
					
						<g:sortableColumn property="result" title="${message(code: 'sampleInPlate.result.label', default: 'Result')}" />
					
						<th><g:message code="sampleInPlate.sample.label" default="Sample" /></th>
					
						<g:sortableColumn property="status" title="${message(code: 'sampleInPlate.status.label', default: 'Status')}" />
					
				</tr>
			</thead>
			<tbody>
				<g:each in="${sampleInPlateInstanceList}" status="i"
					var="sampleInPlateInstance">
					<tr>
						
						<td><g:link action="show" id="${sampleInPlateInstance.id}">${fieldValue(bean: sampleInPlateInstance, field: "well")}</g:link></td>
					
						<td>${fieldValue(bean: sampleInPlateInstance, field: "plate")}</td>
					
						<td>${fieldValue(bean: sampleInPlateInstance, field: "result")}</td>
					
						<td>${fieldValue(bean: sampleInPlateInstance, field: "sample")}</td>
					
						<td>${fieldValue(bean: sampleInPlateInstance, field: "status")}</td>
					
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${sampleInPlateInstanceTotal}" />
		</div>
	</div>
</body>
</html>
