<%@ page import="pts.Investigator" %>



				<div class="fieldcontain ${hasErrors(bean: investigatorInstance, field: 'firstName', 'error')} required">
					<div class="control-group">
				
						<label class="control-label" for="firstName">
							<g:message code="investigator.firstName.label" default="First Name" />
							<span class="required-indicator">*</span>
						</label>
						<div class="controls">
							<g:textField name="firstName" maxlength="24" required="" value="${investigatorInstance?.firstName}"/>
						</div>
					</div>
				</div>
			
				<div class="fieldcontain ${hasErrors(bean: investigatorInstance, field: 'lastName', 'error')} ">
					<div class="control-group">
				
						<label class="control-label" for="lastName">
							<g:message code="investigator.lastName.label" default="Last Name" />
							
						</label>
						<div class="controls">
							<g:textField name="lastName" value="${investigatorInstance?.lastName}"/>
						</div>
					</div>
				</div>
			
