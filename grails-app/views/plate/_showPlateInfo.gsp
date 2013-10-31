<table class="table table-bordered">
	<tr>
		<td>
			<g:if test="${qPlateInstance}">
				<h3><g:link controller="plate" action="show" id="${qPlateInstance?.id}">${qPlateInstance?.intPlateId?.encodeAsHTML()}</g:link></h3>
				<b>Enzyme Used:</b>
				${qPlateInstance?.enzymeUsed}<br>
				<b>PCR Conditiond:</b>
				${qPlateInstance?.pcrCondition}<br>
				<b>Reaction Size:</b>
				${qPlateInstance?.reactionSize}<br>
				<b>Chip ID:</b>
				${qPlateInstance?.chipId}<br>
				&nbsp;<br>
				&nbsp;<br>
			</g:if>
			<g:else>
				<h5>Plate Info:</h5>
			
			&nbsp;<br> &nbsp;Click on a plate to view detailed <b>Plate Info</b>
				<br> &nbsp;<br> &nbsp;<br> &nbsp;<br>
			&nbsp;<br> &nbsp;<br>
			</g:else>

		</td>

	</tr>
</table>