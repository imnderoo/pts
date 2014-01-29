<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>PTS</title>
<style type="text/css" media="screen">
#page-body {
	margin: 2em 1em 1.25em 18em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="content">
			<h1>PTS Beta</h1>
			<ul>
				<li>
					<g:link controller="Plate" action="list">List Plate</g:link>

				</li>
				<li>
					<g:link controller="Sample" action="list">List Sample</g:link>
				</li>
				<li>
					<g:link controller="Project" action="list">List Project</g:link>
				</li>
				<li>
					<g:link controller="Investigator" action="list">List Investigator</g:link>
				</li>
				<li>
					<g:link controller="PlateType" action="list">List Plate Type</g:link>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
