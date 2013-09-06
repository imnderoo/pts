<%@ page import="pts.Project" %>



				<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'name', 'error')} required">
					<div class="control-group">
				
						<label class="control-label" for="name">
							<g:message code="project.name.label" default="Name" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<g:textField name="name" maxlength="24" required="" value="${projectInstance?.name}"/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'investigator', 'error')} required">
					<div class="control-group">
				
						<label class="control-label" for="investigator">
							<g:message code="project.investigator.label" default="Investigator" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<g:select id="investigator" name="investigator.id" from="${pts.Investigator.list()}" optionKey="id" required="" value="${projectInstance?.investigator?.id}" class="many-to-one"/>
						</div>
					</div>
				</div>
			
