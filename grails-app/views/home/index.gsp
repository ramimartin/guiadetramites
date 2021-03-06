<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>GeoTrámites - Guía de Trámites</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

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

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
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
			#container{
				margin-right:auto;
				margin-left: auto;
			}
		</style>
		<meta name="layout" content="main"/>

		<script src="${resource(dir: 'plugins/jquery-1.8.3/js/jquery', file: 'jquery-1.8.3.min.js')}" type="text/javascript" ></script>
		<link href="${resource(dir: 'less', file: 'custom-bootstrap.less.css')}" type="text/css" media="screen, projection" rel="stylesheet" />

		<g:javascript src="argenmap/googlemaps.js" />
		<g:javascript src="argenmap/argenmap.jquery.min.js" />
		<g:javascript src="argenmap/mapa.js" />


	</head>
	<body>

		<div class="breadcrumb">
			<div class="container">
				<ul class="breadcrumb">
				  <li><a href="${createLinkTo(dir: '')}" class="">Inicio</a></li>
				</ul>
			</div>
		</div>

		<div class="container">
<div id="mapa" style="height:600px;"></div>
		</div>

	</body>
</html>
