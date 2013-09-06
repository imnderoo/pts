

<%@ page import="pts.Sample" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'sample.label', default: 'Sample')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-sample"
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
					
						<g:sortableColumn property="sampleId" title="${message(code: 'sample.sampleId.label', default: 'Sample Id')}" />
					
						<g:sortableColumn property="sampleVol" title="${message(code: 'sample.sampleVol.label', default: 'Sample Vol')}" />
					
						<g:sortableColumn property="dnaAmount" title="${message(code: 'sample.dnaAmount.label', default: 'Dna Amount')}" />
					
						<g:sortableColumn property="dnaSource" title="${message(code: 'sample.dnaSource.label', default: 'Dna Source')}" />
					
						<g:sortableColumn property="dnaType" title="${message(code: 'sample.dnaType.label', default: 'Dna Type')}" />
					
						<g:sortableColumn property="dnaExtract" title="${message(code: 'sample.dnaExtract.label', default: 'Dna Extract')}" />
					
				</tr>
			</thead>
			<tbody>
				<g:each in="${sampleInstanceList}" status="i"
					var="sampleInstance">
					<tr>
						
						<td><g:link action="show" id="${sampleInstance.id}">${fieldValue(bean: sampleInstance, field: "sampleId")}</g:link></td>
					
						<td>${fieldValue(bean: sampleInstance, field: "sampleVol")}</td>
					
						<td>${fieldValue(bean: sampleInstance, field: "dnaAmount")}</td>
					
						<td>${fieldValue(bean: sampleInstance, field: "dnaSource")}</td>
					
						<td>${fieldValue(bean: sampleInstance, field: "dnaType")}</td>
					
						<td>${fieldValue(bean: sampleInstance, field: "dnaExtract")}</td>
					
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${sampleInstanceTotal}" />
		</div>
	</div>
</body>
</html>
