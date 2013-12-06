

<%@ page import="pts.Sample"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'sample.label', default: 'sample')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-sample" class="content span8 scaffold-list" role="main">
		<h1>Samples List</h1>
		<g:if test="${flash.message}">
			<div class="alert alert-info" role="status">
				${flash.message}
			</div>
		</g:if>
		<table class="table table-striped table-bordered">
			<thead>
				<tr class="info">

					<g:sortableColumn property="sampleId" title="${message(code: 'sample.sampleId.label', default: 'Sample Id')}" />

					<g:sortableColumn property="well" title="${message(code: 'sample.well.label', default: 'Well')}" />

					<g:sortableColumn property="wellNumber" title="${message(code: 'sample.wellNumber.label', default: 'Well #')}" />

					<g:sortableColumn property="sampleVol" title="${message(code: 'sample.sampleVol.label', default: 'Sample Vol')}" />

					<g:sortableColumn property="dnaAmount" title="${message(code: 'sample.dnaAmount.label', default: 'Dna Amount')}" />

					<g:sortableColumn property="dnaSource" title="${message(code: 'sample.dnaSource.label', default: 'Dna Source')}" />

					<g:sortableColumn property="dnaType" title="${message(code: 'sample.dnaType.label', default: 'Dna Type')}" />

					<g:sortableColumn property="plate" title="${message(code: 'sample.plate.label', default: 'Plate')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${sampleInstanceList}" status="i" var="sampleInstance">
					<tr>

						<td>
							<g:link action="show" id="${sampleInstance.id}">
								${fieldValue(bean: sampleInstance, field: "sampleId")}
							</g:link>
						</td>

						<td>
							${fieldValue(bean: sampleInstance, field: "well")}
						</td>
						
						<td>
							${fieldValue(bean: sampleInstance, field: "wellNumber")}
						</td>

						<td>
							${fieldValue(bean: sampleInstance, field: "sampleVol")}
						</td>

						<td>
							${fieldValue(bean: sampleInstance, field: "dnaAmount")}
						</td>

						<td>
							${fieldValue(bean: sampleInstance, field: "dnaSource")}
						</td>

						<td>
							${fieldValue(bean: sampleInstance, field: "dnaType")}
						</td>
						
									<td>
							${fieldValue(bean: sampleInstance, field: "dnaType")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<ul>
				<li>
					<g:paginate total="${sampleInstanceTotal}" />
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
