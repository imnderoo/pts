<%@ page import="pts.Sample" %>

		<div class="fieldcontain ${hasErrors(bean: sampleInstance, field: 'sampleId', 'error')} required">
			<div class="control-group">
		
				<label class="control-label" for="sampleId">
					<g:message code="sample.sampleId.label" default="Sample Id" />
					<span class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:textField name="sampleId" maxlength="12" required="" value="${sampleInstance?.sampleId}"/>
				</div>
			</div>
		</div>
	
		<div class="fieldcontain ${hasErrors(bean: sampleInstance, field: 'well', 'error')} required">
			<div class="control-group">
		
				<label class="control-label" for="well">
					<g:message code="sample.well.label" default="Well" />
					<span class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:textField name="well" maxlength="8" required="" value="${sampleInstance?.well}"/>
				</div>
			</div>
		</div>
	
		<div class="fieldcontain ${hasErrors(bean: sampleInstance, field: 'sampleVol', 'error')} required">
			<div class="control-group">
		
				<label class="control-label" for="sampleVol">
					<g:message code="sample.sampleVol.label" default="Sample Vol" />
					<span class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:field name="sampleVol" value="${fieldValue(bean: sampleInstance, field: 'sampleVol')}" required=""/>
				</div>
			</div>
		</div>
	
		<div class="fieldcontain ${hasErrors(bean: sampleInstance, field: 'dnaAmount', 'error')} required">
			<div class="control-group">
		
				<label class="control-label" for="dnaAmount">
					<g:message code="sample.dnaAmount.label" default="Dna Amount" />
					<span class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:field name="dnaAmount" value="${fieldValue(bean: sampleInstance, field: 'dnaAmount')}" required=""/>
				</div>
			</div>
		</div>
	
		<div class="fieldcontain ${hasErrors(bean: sampleInstance, field: 'dnaSource', 'error')} ">
			<div class="control-group">
		
				<label class="control-label" for="dnaSource">
					<g:message code="sample.dnaSource.label" default="Dna Source" />
					
				</label>
				<div class="controls">
					<g:textField name="dnaSource" maxlength="24" value="${sampleInstance?.dnaSource}"/>
				</div>
			</div>
		</div>
	
		<div class="fieldcontain ${hasErrors(bean: sampleInstance, field: 'dnaType', 'error')} ">
			<div class="control-group">
		
				<label class="control-label" for="dnaType">
					<g:message code="sample.dnaType.label" default="Dna Type" />
					
				</label>
				<div class="controls">
					<g:textField name="dnaType" maxlength="24" value="${sampleInstance?.dnaType}"/>
				</div>
			</div>
		</div>
	
		<div class="fieldcontain ${hasErrors(bean: sampleInstance, field: 'dnaExtract', 'error')} ">
			<div class="control-group">
		
				<label class="control-label" for="dnaExtract">
					<g:message code="sample.dnaExtract.label" default="Dna Extract" />
					
				</label>
				<div class="controls">
					<g:textField name="dnaExtract" maxlength="24" value="${sampleInstance?.dnaExtract}"/>
				</div>
			</div>
		</div>
	
		<div class="fieldcontain ${hasErrors(bean: sampleInstance, field: 'comment', 'error')} ">
			<div class="control-group">
		
				<label class="control-label" for="comment">
					<g:message code="sample.comment.label" default="Comment" />
					
				</label>
				<div class="controls">
					<g:textField name="comment" maxlength="24" value="${sampleInstance?.comment}"/>
				</div>
			</div>
		</div>
	
		<div class="fieldcontain ${hasErrors(bean: sampleInstance, field: 'plate', 'error')} required">
			<div class="control-group">
		
				<label class="control-label" for="plate">
					<g:message code="sample.plate.label" default="Plate" />
					<span class="required-indicator">*</span>
				</label>
				<div class="controls">
					<g:select id="plate" name="plate.id" from="${pts.Plate.list()}" optionKey="id" required="" value="${sampleInstance?.plate?.id}" class="many-to-one"/>
				</div>
			</div>
		</div>
			
