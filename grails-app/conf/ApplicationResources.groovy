modules = {
	app {

		resource url:'http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/themes/cupertino/jquery-ui.css', attrs:[ rel: "stylesheet", type:'css' ], bundle: 'bundle_app'
		resource url: [  dir: 'bootstrap-2.3.2/css', file: 'bootstrap.min.css' ], attrs:[ rel: "stylesheet", type:'css' ], bundle: 'bundle_app'
		resource url: [  dir: 'jasny-bootstrap/css', file: 'bootstrap.min.css' ], attrs:[ rel: "stylesheet", type:'css' ], bundle: 'bundle_app'
		resource url: [  dir: 'css', file: 'my.css' ], attrs:[ rel: "stylesheet", type:'css' ], bundle: 'bundle_app'

		resource url:'http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js', bundle: 'bundle_app'
		resource url:'http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js', bundle: 'bundle_app'
		resource url: [ dir: 'bootstrap-2.3.2/js', file: 'bootstrap.min.js'], bundle: 'bundle_app'
		resource url: [ dir: 'jasny-bootstrap/js', file: 'bootstrap.min.js'], bundle: 'bundle_app'
		resource url: [  dir: 'js', file: 'application.js' ], bundle: 'bundle_app'
	}
}