<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

<link href="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/css/bootstrap4-toggle.min.css" rel="stylesheet">  
<script src="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/js/bootstrap4-toggle.min.js"></script>

<form name="settingF" action="#" method="post">
	<input type="hidden" name="yidx" value="${onoffData.yidx}">
	<div class="m-5">
			예약 페이지:	
			<br>
		<div class="mb-3">
			<input type="checkbox" data-toggle="toggle" name="yaksokonoff" ${yaksokonoffCheck}>
		</div>
	
			일정 캘린더:
			<br>			
		<div class="mb-3">
			<input type="checkbox" data-toggle="toggle" name="calendaronoff" ${calendaronoffCheck}>
		</div>
		
			<input type="hidden" data-toggle="toggle" name="overlaponoff" value="1">
			<input type="hidden" data-toggle="toggle" name="payonoff" value="1">
			<input type="hidden" data-toggle="toggle" name="maxreserve" value="1">
			<%-- 중복 예약:
			<br>		
		<div class="mb-3">
			<input type="checkbox" data-toggle="toggle" name="overlapOnOff" ${overlaponoffCheck}>
		</div>
			
			결제 기능:
			<br>
		<div class="mb-3">
			<input type="checkbox" data-toggle="toggle" name="payOnOff" ${payonoffCheck}>
		</div>	
			예약 제한:
			<br>
		<div class="mb-3">
			<input type="checkbox" data-toggle="toggle" name="maxreserveOnOff" ${maxreserveonoffCheck}>
		</div>	 --%>
		<br>
		<div class="mb-3">
			<a class="btn btn-primary" onclick="updateSetting()">저장</a>
		</div>
	</div>
	
</form>