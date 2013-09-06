<%@ page import="pts.PlateType" %>



				<div class="fieldcontain ${hasErrors(bean: plateTypeInstance, field: 'name', 'error')} required">
					<div class="control-group">
				
						<label class="control-label" for="name">
							<g:message code="plateType.name.label" default="Name" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<g:textField name="name" required="" value="${plateTypeInstance?.name}"/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: plateTypeInstance, field: 'row', 'error')} required">
					<div class="control-group">
				
						<label class="control-label" for="row">
							<g:message code="plateType.row.label" default="Row" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<g:field name="row" type="number" min="0" max="50" value="${plateTypeInstance.row}" required=""/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: plateTypeInstance, field: 'col', 'error')} required">
					<div class="control-group">
				
						<label class="control-label" for="col">
							<g:message code="plateType.col.label" default="Col" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<g:field name="col" type="number" min="0" max="50" value="${plateTypeInstance.col}" required=""/>
						</div>
					</div>
				</div>
			
