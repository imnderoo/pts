<div class="navbar navbar-static-top navbar-inverse">
	<div class="navbar-inner">
		<div class="container">
			<a class="brand" href="/pts">PTS&nbsp;<i class="iconic-beaker"></i></a>

			<ul class="nav pull-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Investigator <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li>
							<g:link controller="Investigator" action="list">List Investigator</g:link>
						</li>
						<li>
							<g:link controller="Investigator" action="create">New Investigator</g:link>
						</li>
					</ul>
				</li>

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Project <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li>
							<g:link controller="Project" action="list">List Project</g:link>
						</li>
						<li>
							<g:link controller="Project" action="create">New Project</g:link>
						</li>
					</ul>
				</li>

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Plate Type <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li>
							<g:link controller="PlateType" action="list">List Plate Type</g:link>
						</li>
						<li>
							<g:link controller="PlateType" action="create">New Plate Type</g:link>
						</li>
					</ul>
				</li>

			</ul>
			<ul class="nav">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Plate <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li>
							<g:link controller="Plate" action="list">List Plate</g:link>
						</li>
						<li>
							<g:link controller="Plate" action="create96">New Plate96</g:link>
						</li>
						<li>
							<g:link controller="Plate" action="create384">New Plate384</g:link>
						</li>
					</ul>
				</li>

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Sample <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li>
							<g:link controller="Sample" action="list">List Sample</g:link>
						</li>
					</ul>
				</li>

			</ul>
		</div>
	</div>

	<g:if test="${flash.message}">
		<div class="page-alert">
			<div class="alert alert-info" role="status">
				${flash.message}
			</div>
		</div>
	</g:if>
	
</div>

