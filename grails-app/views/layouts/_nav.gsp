<div class="navbar navbar-static-top navbar-inverse">
	<div class="navbar-inner">
		<div class="container">
			<a class="brand" href="/pts"><i class="iconic-layers"></i>&nbsp;PTS</a>

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
				
					<a href="#" class="btn btn-inverse" data-toggle="dropdown"><i class="icon-th icon-white"></i></a>
					<ul class="dropdown-menu">
						<li>
							<a href="http://172.31.104.12/sts2"><i class="iconic-beaker"></i>&nbsp;STS2</a>
						</li>
						<li class="disabled">
							<a href="http://172.31.104.12/pts"><i class="iconic-layers"></i>&nbsp;PTS</a>
						</li>
						<li>
							<a href="http://172.31.104.12/seqDB"><i class="iconic-box"></i>&nbsp;SeqDB</a>
						</li>
						<li>
							<a href="http://172.31.104.12/serviceData"><i class="iconic-document-alt-stroke"></i>&nbsp;Service Data</a>
						</li>
						<li>
							<a href="http://172.31.104.12/ap"><i class="iconic-aperture"></i>&nbsp;Analysis Portal</a>
						</li>
					</ul>

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

