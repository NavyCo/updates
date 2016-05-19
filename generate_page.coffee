fs = require 'fs'
li = (title,text,date) -> 
	date = if typeof date is 'object' then date else new Date date
	timform = (str) -> str.replace /(\d{2}):(\d{2}):(\d{2}) \w+-\d+ \([\w\s]{1,}\)/, "$1:$2"
	_o    = []
	_o.push """\t\t\t\t<li>"""
	_o.push (
		[
			"""\t\t\t\t\t<time class="cbp_tmtime" datetime="#{do date.toISOString}">"""
			"<span>#{date.toLocaleDateString()}</span> <span>#{timform do date.toTimeString}</span>"
			"""</time>"""
		].join ''
	)
	_o.push """\t\t\t\t\t<div class="cbp_tmicon fa fa-child" style="font: normal normal normal 2em/36px FontAwesome;"></div>"""
	_o.push """\t\t\t\t\t<div class="cbp_tmlabel">"""
	_o.push """\t\t\t\t\t\t<h2>#{title}</h2>"""
	_o.push """\t\t\t\t\t\t<p>#{text}</p>"""
	_o.push """\t\t\t\t\t</div>"""
	_o.push """\t\t\t\t</li>"""
	return _o.join '\n'
pg = (list) ->
	_o    = []
	_o.push """<!DOCTYPE html>"""
	_o.push """<html lang="en" class="no-js">"""
	_o.push """\t<head>"""
	_o.push """\t\t<meta charset="UTF-8" />"""
	_o.push """\t\t<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> """
	_o.push """\t\t<meta name="viewport" content="width=device-width, initial-scale=1.0"> """
	_o.push """\t\t<title>My timeline</title>"""
	_o.push """\t\t<meta name="description" content="My timeline" />"""
	_o.push """\t\t<meta name="keywords" content="timeline, Nicholas J. Phillips, @NavyCo" />"""
	_o.push """\t\t<meta name="author" content="@NavyCo, Nicholas J. Phillips" />"""
	_o.push """\t\t<link rel="shortcut icon" href="../favicon.ico">"""
	_o.push """\t\t<link rel="stylesheet" type="text/css" href="css/default.css" />"""
	_o.push """\t\t<link rel="stylesheet" type="text/css" href="css/component.css" />"""
	_o.push """\t\t<link rel="stylesheet" type="text/css" href="css/fa.css" />"""
	_o.push """\t\t<script src="js/modernizr.custom.js"></script>"""
	_o.push """\t</head>"""
	_o.push """\t<body>"""
	_o.push """\t\t<div class="container">"""
	_o.push """\t\t\t<header class="clearfix">"""
	_o.push """\t\t\t\t<span>Nicholas J. Phillips</span>"""
	_o.push """\t\t\t\t<h1>Timeline</h1>"""
	_o.push """\t\t\t\t<nav><a href="../" class="icon-arrow-left" data-info="Home">Home</a></nav>"""
	_o.push """\t\t\t</header>\t"""
	_o.push """\t\t\t<div class="main">"""
	_o.push """\t\t\t\t<ul class="cbp_tmtimeline">"""
	for l in list then _o.push l
	_o.push """\t\t\t\t</ul>"""
	_o.push """\t\t\t</div>"""
	_o.push """\t\t</div>"""
	_o.push """\t\t<div>"""
	_o.push """\t\t<h4 style='text-align:right;padding-right:1%'>I got this template from: <a href='http://tympanus.net/codrops/2013/05/02/vertical-timeline/' style='color:slategray;'>Codrops</a></h4>"""
	_o.push """\t\t</div>"""
	_o.push """\t</body>"""
	_o.push """</html>"""
	return _o.join '\n'

lists = []
lists.push li "Born", "I was born at on this day!", "5-16-2000"
lists.push li "I started coding", "I initially learned DOS command-scripting and VBScripting.", "3-27-2004 12:00"
page = pg lists
fs.writeFileSync "index.html", page, "utf-8"