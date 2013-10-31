<g:if test="${samplesGridView}">
	<g:each in="${samplesGridView}" var="s" status="count">
		<span class="uneditable-input input-smaller" aria-labelledby="samplesInPlate-label"><g:link class="small-text" controller="sample" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
		<g:if test="${(count + 1) % 12 == 0}">
			<br>
		</g:if>
	</g:each>

</g:if>

<g:if test="${samplesListView}">
	<table class="table table-striped table-bordered">
		<tr class="info">
			<td><b>Sample ID</b></td>
			<td><b>Well</b></td>
			<td><b>Well Number</b></td>
		</tr>
		
		<g:each in="${samplesListView}" var="s" status="count">
			<tr>
				<td>
					<g:link class="small-text" controller="sample" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link>
				</td>
				<td>
					${s?.well}
				</td>
				<td>
					${s?.wellNumber}
				</td>
			</tr>
		</g:each>
	
	</table>
</g:if>
