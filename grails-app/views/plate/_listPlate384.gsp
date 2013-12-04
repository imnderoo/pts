<h3>384-well</h3>
<div class="scaffold-list">
	<table class="table table-striped table-bordered">
		<thead>
			<tr class="info">
				<g:sortableColumn property="intPlateId" title="${message(code: 'plate.intPlateId.label', default: 'Internal ID')}" />

				<g:sortableColumn property="extPlateId" title="${message(code: 'plate.extPlateId.label', default: 'External ID')}" />

				<g:sortableColumn property="createdDate" title="${message(code: 'plate.createdDate.label', default: 'Created Date')}" />

				<g:sortableColumn property="project" title="${message(code: 'plate.project.label', default: 'Project')}" />
				
				<g:sortableColumn property="q1Plate" title="Children Plate" />
			</tr>
		</thead>
		<tbody>
			<g:each in="${plate384List}" status="i" var="plateInstance">
				<tr>

					<td>
						<g:link action="show" id="${plateInstance.id}">
							${fieldValue(bean: plateInstance, field: "intPlateId")}
						</g:link>
					</td>

					<td>
						${fieldValue(bean: plateInstance, field: "extPlateId")}
					</td>

					<td>
						${fieldValue(bean: plateInstance, field: "createdDate")}
					</td>

					<td>
						${fieldValue(bean: plateInstance, field: "project")}
					</td>

					<td>
						${fieldValue(bean: plateInstance, field: "q1Plate")},
						${fieldValue(bean: plateInstance, field: "q2Plate")},
						${fieldValue(bean: plateInstance, field: "q3Plate")},
						${fieldValue(bean: plateInstance, field: "q4Plate")}
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
	<div class="pagination pagination-small">
		<ul>
			<li>
				<util:remotePaginate action="render_listPlate384" update="listPlate384"  next="&gt;" prev="&lt;" total="${plate384Total}"/>
			</li>
		</ul>
	</div>
</div>