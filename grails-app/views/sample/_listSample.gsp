<g:if test="${flash.message}">
	<div class="alert alert-info" role="status">
		${flash.message}
	</div>
</g:if>

<g:if test="${sampleList}">

	<table class="table table-striped table-bordered">
		<thead>
			<tr class="info">

				<g:sortableColumn property="sampleId" title="${message(code: 'sample.sampleId.label', default: 'Sample ID')}" />

				<g:sortableColumn property="well" title="${message(code: 'sample.well.label', default: 'Well')}" />

				<g:sortableColumn property="sampleVol" title="${message(code: 'sample.sampleVol.label', default: 'Volume')}" />

				<g:sortableColumn property="dnaAmount" title="${message(code: 'sample.dnaAmount.label', default: 'DNA Amt')}" />

				<g:sortableColumn property="dnaSource" title="${message(code: 'sample.dnaSource.label', default: 'DNA Src')}" />

				<g:sortableColumn property="dnaType" title="${message(code: 'sample.dnaType.label', default: 'DNA Type')}" />

				<g:sortableColumn property="plate" title="${message(code: 'sample.plate.label', default: 'Plate')}" />

				<td>Project</td>

			</tr>
		</thead>
		<tbody>
			<g:each in="${sampleList}" status="i" var="sampleInstance">
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
						<g:link controller="plate" action="show" id="${sampleInstance.plate.id}">
							${sampleInstance.plate}
						</g:link>
					</td>
					<td>
						${sampleInstance.plate.project}
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
	<div class="pagination pagination-small">
		<ul>
			<li>
				<util:remotePaginate action="render_listSample" update="listSample" next="&gt;" prev="&lt;" total="${sampleListTotal}" />
			</li>
		</ul>
	</div>
</g:if>