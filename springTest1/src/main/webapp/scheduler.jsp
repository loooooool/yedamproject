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
<script src="${pageContext.request.contextPath}/scripts/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="./codebase/dhtmlxscheduler_flat.css"
	type="text/css">
<script src="./codebase/dhtmlxscheduler.js" type="text/javascript"></script>
<script src="./codebase/locale/locale_en.js" type="text/javascript"
	charset="utf-8"></script>
</head>
<body>
	<div id="scheduler_here" class="dhx_cal_container"
		style='width: 100%; height: 100%;'>
		<form action="Scheduler">
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
		</form>
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
		scheduler.load("getSchedulerList.ajax", "json");

		/* var dp = new dataProcessor("insertSchedulerList.ajax", "json");
		dp.init(scheduler);  */

		scheduler.attachEvent("onEventSave", function(id,ev,is_new) {
			console.dir(ev)
			if (!ev.text) {
				alert("내용을 입력해주세요");
				return false;
			}
				var sd= ev.start_date
				var s = sd.getFullYear()+'/'+sd.getMonth()+'/'+sd.getDate();
				
				var ed= ev.end_date
				var e = ed.getFullYear()+'/'+ed.getMonth()+'/'+ed.getDate();
				
			$.ajax({
				url:"${pageContext.request.contextPath}/insertScheduler.ajax",
				data:{name:ev.text,startday:s,endday:e},
				success:function(datas){
					
				}
			})
			return true;
		})
	</script>


</body>
</html>