<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <!-- The jQuery library is a prerequisite for all jqSuite products -->
    <script type="text/ecmascript" src="/biz/jqgrid/js/jquery.min.js"></script> 
    <!-- We support more than 40 localizations -->
    <script type="text/ecmascript" src="/biz/jqgrid/js/i18n/grid.locale-en.js"></script>
    <!-- This is the Javascript file of jqGrid -->   
    <script type="text/ecmascript" src="/biz/jqgrid/js/jquery.jqGrid.min.js"></script>
    <!-- This is the localization file of the grid controlling messages, labels, etc.
    <!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"> 
    <!-- The link to the CSS that the grid needs -->
    <link rel="stylesheet" type="text/css" media="screen" href="/biz/jqgrid/css/ui.jqgrid-bootstrap.css" />
	<script>
		$.jgrid.defaults.width = 780;
		$.jgrid.defaults.styleUI = 'Bootstrap';
	</script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <meta charset="utf-8" />
    <title>jqGrid Loading Data - JSON</title>
</head>
<body>
<div style="margin-left:20px">
    <table id="jqGrid"></table>
    <div id="jqGridPager"></div>
</div>
<script type="text/javascript"> 

$(document).ready(function () {
	console.log('bac!!!!~~~~~~~~');
		$("#jqGrid").jqGrid({
		url: 'data.json',
		datatype: "json",
		 colModel: [
		 	{ label: '<input type="checkbox" checked>', name: 'check', width: 40},
			{ label: 'No', name: 'seq', width: 35 },
			{ label: '근무가능일', name: 'wrk_posb_day', width: 90 },
			{ label: '월제시금액', name: 'sugst_money', width: 100 },
			{ label: 'PJ형태구분코드', name: 'pjt_gbn_code', width: 100, sorttype: 'integer' },
			// sorttype is used only if the data is loaded locally or loadonce is set to true
			{ label: '장비유무', name: 'eqm_yn', width: 80, sorttype: 'number' },
			{ label: '현재연봉', name: 'current_salary', width: 80, sorttype: 'number' },
			{ label: '근무지', name: 'work_area', width: 80, sorttype: 'number' }
		],
		viewrecords: true, // show the current page, data rang and total records on the toolbar
		width: 780,
		height: 200,
		rowNum: 30,
		loadonce: true, // this is just for the demo
		pager: "#jqGridPager"
	});
	console.log('bac!!!!');
});

 </script>

</body>
</html>