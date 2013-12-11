<%@ page import="pts.PlateType" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'plateType.label', default: 'PlateType')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="show-plateType"
		class="content span8 scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
	
		<g:form class="form-horizontal">
		
				<g:if test="${plateTypeInstance?.name}">
				
				<div class="control-group">

					<label id="name-label" class="control-label"><g:message code="plateType.name.label" default="Name" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="name-label"><g:fieldValue bean="${plateTypeInstance}" field="name"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${plateTypeInstance?.row}">
				
				<div class="control-group">

					<label id="row-label" class="control-label"><g:message code="plateType.row.label" default="Row" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="row-label"><g:fieldValue bean="${plateTypeInstance}" field="row"/></span>
					
					</div>
					
				</div>
				</g:if>
			
				<g:if test="${plateTypeInstance?.col}">
				
				<div class="control-group">

					<label id="col-label" class="control-label"><g:message code="plateType.col.label" default="Col" /></label>
					
					<div class="controls">
					
						<span class="uneditable-input" aria-labelledby="col-label"><g:fieldValue bean="${plateTypeInstance}" field="col"/></span>
					
					</div>
					
				</div>
				</g:if>
	
			<fieldset class="buttons">
				<div class="control-groups">
					<div class="controls">
						<g:hiddenField name="id" value="${plateTypeInstance?.id}" />
						<g:link class="btn" action="edit" id="${plateTypeInstance?.id}">
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<g:actionSubmit class="btn" action="delete"
							value="${message(code: 'default.button.delete.label', default: 'Delete')}"
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					</div>
				</div>
			</fieldset>
		</g:form>
	</div>
</body>
</html>
