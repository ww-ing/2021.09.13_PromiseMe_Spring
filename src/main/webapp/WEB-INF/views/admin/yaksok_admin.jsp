<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="myctx" value="${pageContext.request.contextPath}"/>  
<div id="yaksokMenu">

<!-- Load d3.js and c3.js -->
<script src="https://d3js.org/d3.v5.min.js"></script>
<script src="../resources/static/yaksok/statistics/js/c3.min.js"></script>

<!-- Load c3.css -->
<link href="../resources/static/yaksok/statistics/css/c3.min.css" rel="stylesheet">
   
<c:import url="/top"/>

	<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <br>
                    <h1 class="h3 mb-2 text-gray-800">[관리자] 약속 통계</h1><br>
                    
                    <h5 class="text-center">
                    	<label>총 등록 : </label> <span class="text-primary">${totalYaksokCount}</span> 
                    	&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                    	&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                    	
                    	<label>최근 7일 등록 : </label> <span class="text-primary">${weekYaksokCount}</span> 
                    	&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                    	&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                    	
                    	<label>최근 30일 등록 : </label> <span class="text-primary">${monthYaksokCount}</span>
                    	&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                    	&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                    	
                    	<label>최근 1년 등록 : </label> <span class="text-primary">${yearYaksokCount}</span>
                    	
                    </h5>
                    
                    <br>
                    <br>
					
					<form name="monthStatistics" action="list" class="form-inline">
					<input type="hidden" name="yidx" value="${yidx}" >
                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-xl-8 col-lg-7">
				
                            <!-- Area Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">월 별 약속 등록</h6>
                                <div class="mt-3">
                                    
                                       <div id="month_yearList" style="float:left; margin-right:10px">
									   <select name="month_selectYear" class="form-control mr-2">
									   
									   <c:forEach var="yearList" items="${yearList}">
									   	  
									   	  <!-- 데이터가 없을 경우 -->
									   	  <c:if test="${yearList eq null}">
									   	  <option value="#">예약 없음</option>
									   	  </c:if>
									   	  
									   	  <!-- 데이터가 있을 경우 -->
									   	  <c:if test="${yearList ne null}">
									   	  
									   	  <!-- yearList의 해당 year을 변수로 생성 -->
									      
									   	  
									   	  <!-- 드롭다운 메뉴 출력 -->
									      <option value="${yearList}" 
									      
									      <c:set var="month_selectYear" value="${month_selectYear}" />
									      
									      <c:if test="${yearList eq  month_selectYear}">
									      selected
									      </c:if>
									      >
									      
									      20${yearList}
									      
									      </option>
									      
									      
									      </c:if>
									      
									   </c:forEach>   
									   
									   </select>
									   </div>
									   
									   <div id="month_monthList" style="float:left;">
									   <select name="month_selectMonth" class="form-control mr-2">
									   
									   <c:forEach var="monthList" items="${monthList}">
									   
									      <option value="${monthList}"
									   	     
									      <c:set var="month_selectMonth" value="${month_selectMonth}" />
									      
									      <c:if test="${monthList eq  month_selectMonth}">
									      selected
									      </c:if>
									      >
									      
									      ${monthList}월
									      
									      </option>
									   </c:forEach>
									   </select>
									   </div>
									<!-- </form> -->
									</div>
                                
                                </div>
                                <div class="card-body">
                                    <div class="chart-area">
                                        <!-- <canvas id="myAreaChart"></canvas> -->
                                        <div id="chartMonth_admin"></div>
                                        <hr>
                                       	해당 월의 약속 등록 통계
                                    </div>
                                </div>
                            </div>

                            <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">연도 별 약속 등록 통계</h6>
                                    <div class="mt-3">
                                    <!-- <form name="findF" action="list" class="form-inline"> -->
                                       <div id="year_yearList" style="float:left; margin-right:10px">
									   <select name="year_selectYear" class="form-control mr-2">
									   
									      <c:forEach var="yearList" items="${yearList}">
									      
									   	  <c:if test="${yearList eq null}">
									   	  <option value="#">예약 없음</option>
									   	  </c:if>
									   	  
									   	  <c:if test="${yearList ne null}">
									   	  
									      <option value="${yearList}"
									      
									      <c:set var="year_selectYear" value="${year_selectYear}" />
									      
									      <c:if test="${yearList eq year_selectYear }">
									      selected
									      </c:if>
									      
									      >20${yearList}</option>
									      
									      </c:if>
									      
									   	  </c:forEach>
									      
									   </select>
									   </div>
									
									</div>
									
                                </div>
                                
                                <div class="card-body">
                                    <div class="chart-area">
                                        <!-- <canvas id="myBarChart"></canvas> -->
                                        <div id="chartYear_admin"></div>
                                    </div>
                                    <hr>
                                    해당 연도의 약속 등록 통계
                                </div>
                            </div>

                        </div>
						</form>
						
                        </div>
	
<c:import url="/foot"/>
<script>
    
    var chart = c3.generate({
        bindto: '#chartMonth_admin',
        data: {
            columns: [
              [${month_selectMonth}+'월', 0 ${monthData}]
            ]
          }
      });
    
    var chart = c3.generate({
        bindto: '#chartYear_admin',
        data: {
          columns: [
            [${year_selectYear}+"년", 0 ${yearData}],
            [${year_selectYear_before}+"년", 0 ${yearData_before}]
          ]
        }
    });
    
    $('#month_yearList').change(function(){
    	
    	$.ajax({
    		type:'get',
    		url:'yaksokAdmin',
    		cache:false,
    		data:$('form').serialize(),
    		dataType:'html'
    		
    	}).done(function(res){
    		$('#yaksokMenu').html(res) 
    		
    	})
    	.fail(function(err){
    		alert('error: '+err.status);
    	})
    })
    
    $('#month_monthList').change(function(){
    	
    	$.ajax({
    		type:'get',
    		url:'yaksokAdmin',
    		cache:false,
    		data:$('form').serialize(),
    		dataType:'html'
    		
    	}).done(function(res){
    		$('#yaksokMenu').html(res) 
    		
    	})
    	.fail(function(err){
    		alert('error: '+err.status);
    	})
    })
    
    $('#year_yearList').change(function(){
    	
    	$.ajax({
    		type:'get',
    		url:'yaksokAdmin',
    		cache:false,
    		data:$('form').serialize(),
    		dataType:'html'
    		
    	}).done(function(res){
    		$('#yaksokMenu').html(res) 
    		
    	})
    	.fail(function(err){
    		alert('error: '+err.status);
    	})
    })
    </script>

<!-- 페이지 새로 띄우기 -->    
</div>	