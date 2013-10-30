<g:if test="${samplesGridView}">
	<g:each in="${samplesGridView}" var="s" status="count">
		<span class="uneditable-input input-smaller" aria-labelledby="samplesInPlate-label"><g:link class="small-text" controller="sample" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
		<g:if test="${(count + 1) % 12 == 0}">
			<br>
		</g:if>
	</g:each>

</g:if>

<g:if test="${samplesListView}">
	<g:each in="${samplesListView}" var="s" status="count">
		<span class="uneditable-input input-smaller" aria-labelledby="samplesInPlate-label"><g:link class="small-text" controller="sample" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
		<br>
	</g:each>
</g:if>
