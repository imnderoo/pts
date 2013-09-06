<%@ page import="pts.SampleInPlate" %>



				<div class="fieldcontain ${hasErrors(bean: sampleInPlateInstance, field: 'well', 'error')} required">
					<div class="control-group">
				
						<label class="control-label" for="well">
							<g:message code="sampleInPlate.well.label" default="Well" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<g:textField name="well" required="" value="${sampleInPlateInstance?.well}"/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: sampleInPlateInstance, field: 'plate', 'error')} required">
					<div class="control-group">
				
						<label class="control-label" for="plate">
							<g:message code="sampleInPlate.plate.label" default="Plate" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<g:select id="plate" name="plate.id" from="${pts.Plate.list()}" optionKey="id" required="" value="${sampleInPlateInstance?.plate?.id}" class="many-to-one"/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: sampleInPlateInstance, field: 'result', 'error')} ">
					<div class="control-group">
				
						<label class="control-label" for="result">
							<g:message code="sampleInPlate.result.label" default="Result" />
							
						</label>
						<div class="controls">
							<g:textField name="result" value="${sampleInPlateInstance?.result}"/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: sampleInPlateInstance, field: 'sample', 'error')} required">
					<div class="control-group">
				
						<label class="control-label" for="sample">
							<g:message code="sampleInPlate.sample.label" default="Sample" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<g:select id="sample" name="sample.id" from="${pts.Sample.list()}" optionKey="id" required="" value="${sampleInPlateInstance?.sample?.id}" class="many-to-one"/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: sampleInPlateInstance, field: 'status', 'error')} ">
					<div class="control-group">
				
						<label class="control-label" for="status">
							<g:message code="sampleInPlate.status.label" default="Status" />
							
						</label>
						<div class="controls">
							<g:textField name="status" value="${sampleInPlateInstance?.status}"/>
						</div>
					</div>
				</div>
			
