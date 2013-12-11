<%@ page import="pts.Investigator"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'investigator.label', default: 'Investigator')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-investigator" class="content span8 scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>

		<div class="accordion" id="investigatorAccordion">
			<g:each in="${investigatorInstanceList}" status="i" var="investigatorInstance">
				<div class="accordion-group">
					<div class="accordion-custom">
						<a data-toggle="collapse" data-parent="#investigatorAccordion" href="#collapse${i}"> ${fieldValue(bean: investigatorInstance, field: "lastName")},
							${fieldValue(bean: investigatorInstance, field: "firstName")}
						</a>
						<div class="pull-right btn-group">
							<g:link class="btn btn-mini" action="edit" id="${investigatorInstance?.id}">
								<i class="icon-edit"></i>
							</g:link>
							<g:link class="btn btn-mini" action="delete" id="${investigatorInstance?.id}"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
								<i class="icon-trash"></i>	
							</g:link>
						</div>
					</div>
					<div id="collapse${i}" class="accordion-body collapse">
						<div class="accordion-inner">
							<g:if test="${investigatorInstance?.project}">

								<h4>Project List</h4>

								<table class="table table-bordered">

									<g:each in="${investigatorInstance.project}" var="p">
										<tr>
											<td>
												<g:link controller="project" action="show" id="${p.id}">
													${p?.encodeAsHTML()}
												</g:link>
											</td>
										</tr>
									</g:each>
								</table>
							</g:if>
							<g:else>
								<h3>No Projects Found</h3>
							</g:else>
						</div>
					</div>
				</div>

			</g:each>
		</div>
	</div>
</body>
</html>
