

<%@ page import="pts.Sample"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName" value="${message(code: 'sample.label', default: 'sample')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	
	<div id="list-sample" class="content span12 scaffold-list" role="main">
		<h1>Samples List</h1>

		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<g:form class="navbar-form">
						<input type="text" class="span2" name="sampleId" placeholder="Sample ID" value="${params.sampleId}">
						<input type="text" class="span2" name="intPlateId" placeholder="Int Plate ID" value="${params.intPlateId}">
						<g:actionSubmit action="list" value="Search" class="btn" />
					</g:form>
				</div>
			</div>
		</div>

		<div class="row-fluid">
			<div id="listSample" class="span8">
				<g:render template="listSample" />
			</div>
		</div>
	</div>
</body>
</html>
