<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Insert title here</title>
<link rel="stylesheet" href="./resources/codebase/dhtmlxscheduler.css" type="text/css">
<script src="./resources/codebase/dhtmlxscheduler.js" type="text/javascript"></script>

<style type="text/css" media="screen">
    html, body{
        margin:0px;
        padding:0px;
        height:100%;
        overflow:hidden;
    }   
</style>
</head>

<body>
<div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100%;'>
    <div class="dhx_cal_navline">
        <div class="dhx_cal_prev_button">&nbsp;</div>
        <div class="dhx_cal_next_button">&nbsp;</div>
        <div class="dhx_cal_today_button"></div>
        <div class="dhx_cal_date"></div>
        <div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div> 
        <div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
        <div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
    </div>
    <div class="dhx_cal_header"></div>
    <div class="dhx_cal_data"></div>       
</div>
<script>
/* scheduler.init('scheduler_here', new Date(),"month"); */
 scheduler.config.multi_day = true;
		scheduler.config.xml_date="%Y-%m-%d %H:%i";
		
		scheduler.init('scheduler_here',new Date(),"month");
		/* scheduler.load("./data/events.xml"); */
		
		var calendar = scheduler.renderCalendar({
			container:"cal_here", 
			navigation:true,
			handler:function(date){
				scheduler.setCurrentView(date, scheduler._mode);
			}
		});
		scheduler.linkCalendar(calendar);
		scheduler.setCurrentView(scheduler._date, scheduler._mode);

</script>
</body>

</html>