<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>How to start</title>
<style type="text/css" media="screen">
html, body {
	margin: 0px;
	padding: 0px;
	height: 100%;
	overflow: hidden;
}
</style>
<script src="./codebase/dhtmlxscheduler.js" type="text/javascript"></script>
<link rel="stylesheet" href="./codebase/dhtmlxscheduler.css" type="text/css">
</head>
<body>
	<div id="scheduler_here" class="dhx_cal_container"
		style='width: 100%; height: 100%;'>
		<div class="dhx_cal_navline">
			<div class="dhx_cal_prev_button">&nbsp;</div>
			<div class="dhx_cal_next_button">&nbsp;</div>
			<div class="dhx_cal_today_button"></div>
			<div class="dhx_cal_date"></div>
			<div class="dhx_cal_tab" name="day_tab" style="right: 204px;"></div>
			<div class="dhx_cal_tab" name="week_tab" style="right: 140px;"></div>
			<div class="dhx_cal_tab" name="month_tab" style="right: 76px;"></div>
		</div>
		<div class="dhx_cal_header"></div>
		<div class="dhx_cal_data"></div>
	</div>
	<script>
		scheduler.config.xml_date = "%Y-%m-%d";
		scheduler.config.details_on_create = true;
		scheduler.config.details_on_dblclick = true;
		scheduler.init('scheduler_here', new Date(), "month");
		scheduler.config.full_day = true; 
		
/* 		var events = [ {
			id : 1,
			text : "Meeting",
			start_date : "2018/04/11",
			end_date : "2018/04/11"
		}, {
			id : 2,
			text : "Conference",
			start_date : "2018/04/15",
			end_date : "2018/04/18"
		}, {
			id : 3,
			text : "Interview",
			start_date : "2018/04/24",
			end_date : "2018/04/24"
		} ];

		scheduler.parse(events, "json"); *///takes the name and format of the data source
		scheduler.load("getSchedulerList.ajax","json"); 
	</script>
</body>
</html>