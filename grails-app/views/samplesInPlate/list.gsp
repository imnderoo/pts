

<%@ page import="pts.SamplesInPlate" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'samplesInPlate.label', default: 'SamplesInPlate')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-samplesInPlate"
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
					
						<g:sortableColumn property="sampleId" title="${message(code: 'samplesInPlate.sampleId.label', default: 'Sample Id')}" />
					
						<g:sortableColumn property="well" title="${message(code: 'samplesInPlate.well.label', default: 'Well')}" />
					
						<g:sortableColumn property="sampleVol" title="${message(code: 'samplesInPlate.sampleVol.label', default: 'Sample Vol')}" />
					
						<g:sortableColumn property="dnaAmount" title="${message(code: 'samplesInPlate.dnaAmount.label', default: 'Dna Amount')}" />
					
						<g:sortableColumn property="dnaSource" title="${message(code: 'samplesInPlate.dnaSource.label', default: 'Dna Source')}" />
					
						<g:sortableColumn property="dnaType" title="${message(code: 'samplesInPlate.dnaType.label', default: 'Dna Type')}" />
					
				</tr>
			</thead>
			<tbody>
				<g:each in="${samplesInPlateInstanceList}" status="i"
					var="samplesInPlateInstance">
					<tr>
						
						<td><g:link action="show" id="${samplesInPlateInstance.id}">${fieldValue(bean: samplesInPlateInstance, field: "sampleId")}</g:link></td>
					
						<td>${fieldValue(bean: samplesInPlateInstance, field: "well")}</td>
					
						<td>${fieldValue(bean: samplesInPlateInstance, field: "sampleVol")}</td>
					
						<td>${fieldValue(bean: samplesInPlateInstance, field: "dnaAmount")}</td>
					
						<td>${fieldValue(bean: samplesInPlateInstance, field: "dnaSource")}</td>
					
						<td>${fieldValue(bean: samplesInPlateInstance, field: "dnaType")}</td>
					
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${samplesInPlateInstanceTotal}" />
		</div>
	</div>
</body>
</html>
