<%@ page import="pts.SamplesInPlate" %>



				<div class="fieldcontain ${hasErrors(bean: samplesInPlateInstance, field: 'sampleId', 'error')} required">
					<div class="control-group">
				
						<label class="control-label" for="sampleId">
							<g:message code="samplesInPlate.sampleId.label" default="Sample Id" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<g:textField name="sampleId" maxlength="12" required="" value="${samplesInPlateInstance?.sampleId}"/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: samplesInPlateInstance, field: 'well', 'error')} required">
					<div class="control-group">
				
						<label class="control-label" for="well">
							<g:message code="samplesInPlate.well.label" default="Well" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<g:textField name="well" maxlength="8" required="" value="${samplesInPlateInstance?.well}"/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: samplesInPlateInstance, field: 'sampleVol', 'error')} required">
					<div class="control-group">
				
						<label class="control-label" for="sampleVol">
							<g:message code="samplesInPlate.sampleVol.label" default="Sample Vol" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<g:field name="sampleVol" value="${fieldValue(bean: samplesInPlateInstance, field: 'sampleVol')}" required=""/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: samplesInPlateInstance, field: 'dnaAmount', 'error')} required">
					<div class="control-group">
				
						<label class="control-label" for="dnaAmount">
							<g:message code="samplesInPlate.dnaAmount.label" default="Dna Amount" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<g:field name="dnaAmount" value="${fieldValue(bean: samplesInPlateInstance, field: 'dnaAmount')}" required=""/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: samplesInPlateInstance, field: 'dnaSource', 'error')} ">
					<div class="control-group">
				
						<label class="control-label" for="dnaSource">
							<g:message code="samplesInPlate.dnaSource.label" default="Dna Source" />
							
						</label>
						<div class="controls">
							<g:textField name="dnaSource" maxlength="24" value="${samplesInPlateInstance?.dnaSource}"/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: samplesInPlateInstance, field: 'dnaType', 'error')} ">
					<div class="control-group">
				
						<label class="control-label" for="dnaType">
							<g:message code="samplesInPlate.dnaType.label" default="Dna Type" />
							
						</label>
						<div class="controls">
							<g:textField name="dnaType" maxlength="24" value="${samplesInPlateInstance?.dnaType}"/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: samplesInPlateInstance, field: 'dnaExtract', 'error')} ">
					<div class="control-group">
				
						<label class="control-label" for="dnaExtract">
							<g:message code="samplesInPlate.dnaExtract.label" default="Dna Extract" />
							
						</label>
						<div class="controls">
							<g:textField name="dnaExtract" maxlength="24" value="${samplesInPlateInstance?.dnaExtract}"/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: samplesInPlateInstance, field: 'comment', 'error')} ">
					<div class="control-group">
				
						<label class="control-label" for="comment">
							<g:message code="samplesInPlate.comment.label" default="Comment" />
							
						</label>
						<div class="controls">
							<g:textField name="comment" maxlength="24" value="${samplesInPlateInstance?.comment}"/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: samplesInPlateInstance, field: 'plate', 'error')} required">
					<div class="control-group">
				
						<label class="control-label" for="plate">
							<g:message code="samplesInPlate.plate.label" default="Plate" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<g:select id="plate" name="plate.id" from="${pts.Plate.list()}" optionKey="id" required="" value="${samplesInPlateInstance?.plate?.id}" class="many-to-one"/>
						</div>
					</div>
				</div>
			
