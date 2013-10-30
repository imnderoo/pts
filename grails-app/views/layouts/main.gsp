<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<r:require modules="app" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<g:layoutHead />
<r:layoutResources />
</head>
<body>
	<g:render template="/layouts/nav" />

	<div class="container">

		<div class="row">
			<g:layoutBody />
		</div>
		<div class="row">
			<g:render template="/layouts/footer" />
		</div>
		<div class="row">
			<div id="spinner" class="spinner" style="display: none;">
				<g:message code="spinner.alt" default="Loading&hellip;" />
			</div>
		</div>
		<r:layoutResources />
	</div>
</body>
</html>
