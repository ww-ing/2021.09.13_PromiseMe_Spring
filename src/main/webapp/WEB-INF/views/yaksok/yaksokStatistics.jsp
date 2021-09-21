<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="myctx" value="${pageContext.request.contextPath}"/>  
    
    <!-- Load c3.css -->
	<link href="${myctx}/resources/static/yaksok/statistics/css/c3.min.css" rel="stylesheet">

    <script>
    
    var chart = c3.generate({
        bindto: '#chartMonth',
        data: {
            columns: [
              ['${month_selectMonth}월', 0, 200, 100, 400, 150, 250, 100, 111, 122, 140, 105, 110, 220, 150, 250, 100, 111, 122, 140, 105, 110, 220, 150, 250, 100, 111, 122, 140, 105, 110, 220]
            ]
          }
      });
    
    var chart = c3.generate({
        bindto: '#chartYear',
        data: {
          columns: [
            ['2020', 0, 70, 120, 400, 250, 250, 200, 411, 222, 640, 305, 410, 700],
            ['2021', 0, 120, 320, 200, 150, 550, 400, 111, 292, 440, 105, 910, 200]
          ]
        }
    });
    
    var chart = c3.generate({
    	bindto: '#pie',
        data: {
            columns: [
                ['1회 예약', ${notOverlapCount}],
                ['2회 이상 예약', ${overlapCount}],
            ],
            type : 'pie',
            onmouseover: function (d, i) { console.log("onmouseover", d, i); },
            onmouseout: function (d, i) { console.log("onmouseout", d, i); }
        }
    });
    
    $('#month_yearList').change(function(){
    	
    	$.ajax({
    		type:'get',
    		url:'yaksokStatistics.me',
    		cache:false,
    		data:$('form').serialize(),
    		dataType:'html'
    		
    	}).done(function(res){
    		/* $('#yaksokMenu').html(res).find('#monthList') */
    		/* $('#yaksokMenu').load(location.href+'#monthList') */
    		/* location.reload(true); */
    		$('#yaksokMenu').html(res) 
    		alert('month_year 완료')
    		
    	})
    	.fail(function(err){
    		alert('error: '+err.status);
    	})
    })
    
    $('#month_monthList').change(function(){
    	
    	$.ajax({
    		type:'get',
    		url:'yaksokStatistics.me',
    		cache:false,
    		data:$('form').serialize(),
    		dataType:'html'
    		
    	}).done(function(res){
    		$('#yaksokMenu').html(res) 
    		alert('month_month 완료')
    		
    	})
    	.fail(function(err){
    		alert('error: '+err.status);
    	})
    })
    
    $('#year_yearList').change(function(){
    	
    	$.ajax({
    		type:'get',
    		url:'yaksokStatistics.me',
    		cache:false,
    		data:$('form').serialize(),
    		dataType:'html'
    		
    	}).done(function(res){
    		/* $('#yaksokMenu').html(res).find('#monthList') */
    		/* $('#yaksokMenu').load(location.href+'#monthList') */
    		/* location.reload(true); */
    		$('#yaksokMenu').html(res) 
    		alert('year_month 완료')
    		
    	})
    	.fail(function(err){
    		alert('error: '+err.status);
    	})
    })
    
    
    
    
    
    </script>
				<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <br>
                    <h1 class="h3 mb-2 text-gray-800">통계</h1><br>
					
					<form name="monthStatistics" action="list" class="form-inline">
					<input type="hidden" name="yidx" value="${yidx}" >
                    <!-- Content Row -->
                    <div class="row">
                        <div class="col-xl-8 col-lg-7">
				
                            <!-- Area Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">해당 월의 통계</h6>
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
                                        <div id="chartMonth"></div>
                                        <hr>
                                       	해당 월의 예약 통계를 보여줍니다.
                                    </div>
                                </div>
                            </div>

                            <!-- Bar Chart -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">해당 연도의 통계</h6>
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
                                        <div id="chartYear"></div>
                                    </div>
                                    <hr>
                                    해당 연도와 전년도의 예약 통계를 비교합니다.
                                </div>
                            </div>

                        </div>
						</form>
						
                        <!-- Donut Chart -->
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">중복 예약 통계</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-pie pt-4">
                                        <!-- <canvas id="myPieChart"></canvas> -->
                                        <div id="pie"></div>
                                    </div>
                                    <hr>
                                    전체 예약중 1회 예약 비율과 2회 이상 예약한 통계를 보여줍니다.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->