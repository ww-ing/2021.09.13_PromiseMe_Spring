<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="myctx" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>달력 만들기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="${myctx}/resources/static/yaksok/calendar/css/yaksokCalendar.css" rel="stylesheet" type="text/css" />
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
    <script>
    (function () {
        calendarMaker($("#calendarForm"), new Date());
        
    })();

    var nowDate = new Date();
    function calendarMaker(target, date) {
    	
        if (date == null || date == undefined) {
            date = new Date();
        }
        nowDate = date;
        if ($(target).length > 0) {
            var year = nowDate.getFullYear();
            var month = nowDate.getMonth() + 1;
            $(target).empty().append(assembly(year, month));
        } else {
            console.error("custom_calendar Target is empty!!!");
            return;
        }

        var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
        var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);


        var tag = "<tr>";
        var cnt = 0;
        //빈 공백 만들어주기
        for (i = 0; i < thisMonth.getDay(); i++) {
            tag += "<td></td>";
            cnt++;
        }

        //날짜 채우기
        for (i = 1; i <= thisLastDay.getDate(); i++) {
            if (cnt % 7 == 0) { tag += "<tr>"; }

            tag += "<td><div class='dayVal'>" + i + "</div><br> <div id='"+ year +"-"+ month +"-"+ i +"' class='dayList'></div> <br></td>";
            cnt++;
            if (cnt % 7 == 0) {
                tag += "</tr>";
            }
        }
        $(target).find("#custom_set_date").append(tag);
        

        function assembly(year, month) {
            var calendar_html_code =
                "<table class='custom_calendar_table' style='margin:auto'>" +
                "<input type='hidden' name='yidx' value='${yidx}'>" +
                "<colgroup>" +
                "<col style='width:180px'/>" +
                "<col style='width:180px'/>" +
                "<col style='width:180px'/>" +
                "<col style='width:180px'/>" +
                "<col style='width:180px'/>" +
                "<col style='width:180px'/>" +
                "<col style='width:180px'/>" +
                "</colgroup>" +
                "<thead class='cal_date'>" +
                "<th><button type='button' class='prev'><</button></th>" +
                "<th colspan='5'><p><span class='selectYear'>" + year + "</span>년 <span class='selectMonth'>" + month + "</span>월</p></th>" +
                "<th><button type='button' class='next'>></button></th>" +
                "</thead>" +
                "<thead  class='cal_week'>" +
                "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>" +
                "</thead>" +
                "<tbody id='custom_set_date'>" +
                "</tbody>" +
                "</form>" +
                "</table>" 
            return calendar_html_code;
        }

        function calMoveEvtFn() {
            //전달 클릭
            $(".custom_calendar_table").on("click", ".prev", function () {
                nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
                calendarMaker($(target), nowDate);
            });
            //다음달 클릭
            $(".custom_calendar_table").on("click", ".next", function () {
	           	 nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
	             calendarMaker($(target), nowDate);
		    });
	       	//일자 선택 클릭
	        $(".custom_calendar_table").on("click", "td", function () {
	        	 $(".custom_calendar_table .select_day").removeClass("select_day");
	          	 $(this).removeClass("select_day").addClass("select_day");
	           	 var selectDay=$(".select_day .dayVal").html();
	       	});
	       	 
        }
    
	    function addList(){
				
       		"<c:forEach var='list' items='${calendarList}'>" +
				$('#${list.cyear}-${list.cmonth}-${list.cday}').append('<div><a href="#" onclick="editCalendar(${list.yidx},${list.cidx})">${list.ctitle}</a></div>') +
			"</c:forEach>" 
   			
	   }
	    addList();
	   	calMoveEvtFn();
          
}
    
</script>
</head>
<body>
	<div class="container-fluid">
		<br>
		<h1 class="h3 mb-2 text-gray-800">일정관리</h1><br>
			<div class="card shadow mb-4 text-center">
				<div class="card-body">
					<div class="table-responsive">
						
						<!--  -->
    					<div id="calendarForm" >
    					</div>
    					<!--  -->
    					
    				</div>
    			</div>
    		</div>
    	</div>
    	<div class="text-center">
    	
    		<!-- <a class='btn btn-primary' href='#yaksokCalendarAddModal' data-toggle='modal'>등록</a> -->
    		<c:if test="${url eq null }">
    		<a class='btn btn-primary' href='#' onclick="yaksokCalendarAddModalShow()" data-toggle='modal'>등록</a>
    		</c:if>
    		
    		<c:if test="${url ne null }">
    		<!-- <button class="btn btn-primary" data-dismiss="modal">닫기</button> -->
    		<a class='btn btn-primary' href='#' onclick="closeReserveCalendar()" data-toggle='modal'>닫기</a>
    		</c:if>
    		
    	</div>
    	
    	<!-- yaksokCalendarEditModal.jsp의 데이터를 담을 div -->
    	<div class="modal" id="yaksokCalendarEditModal"></div>
    	
    <%@ include file="/WEB-INF/views/yaksok/modal/yaksokCalendarAddModal.jsp"%>
</body>
</html>