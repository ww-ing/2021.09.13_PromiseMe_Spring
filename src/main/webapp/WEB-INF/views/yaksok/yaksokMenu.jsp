<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="myctx" value="${pageContext.request.contextPath}"/>  
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>약속해줘</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${myctx}/resources/static/yaksok/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${myctx}/resources/static/yaksok/css/styles.css" rel="stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        
        <!--  통계 페이지 js -->
        <!-- Load d3.js and c3.js -->
        <script src="https://d3js.org/d3.v5.min.js"></script>
        <script src="${myctx}/resources/static/yaksok/statistics/js/c3.min.js"></script>
        
        <script>
        		/* 페이지 시작 시 첫 페이지를 테마 페이지로 지정 */
    			$(function(){
    				showMenu('yaksokSetForm');
    			})
				
    			/* 메뉴 */
    			function showMenu(menu){
    				$.ajax({
    					type:'get',
    					url:menu+'?yidx='+${info.yidx},
    					cache:false,
    					dataType:'html'

    				}).done(function(res){
    					$('#yaksokMenu').html(res);
    				})
    				.fail(function(err){
    					alert('error: '+err.status);
    				})
    			}
        		
    			/* 약속 정보 저장 */
    		    function saveTemplate() {
    		        document.forms["info"].submit();
    		    }
        		
    			//-------------------------------------------------약속 예약 정보
    			
    			/* yaksokReserveList.jsp 페이지의 약속 정보 리스트 페이징처리*/
    			function showCpage(cpage){
    				$.ajax({
    					type:'get',
    					url:'yaksokReserveList?yidx='+${info.yidx}+'&&cpage='+cpage,
    					cache:false,
    					dataType:'html'

    				}).done(function(res){
    					$('#yaksokMenu').html(res);
    				})
    				.fail(function(err){
    					alert('error: '+err.status);
    				})
    			}
    			
    			/* yaksokReserveList.jsp의 yaksokReserveListUserInfoModal.jsp의 모달 보여주기 */
    			function yaksokReserveListUserInfoModalShow(){
    				$('#yaksokReserveListUserInfoModal').modal('show')
    			}
    			
    			/* yaksokReserveList.jsp의 yaksokReserveListUserInfoModal.jsp의 모달 숨기기 */
    			function yaksokReserveListUserInfoModalHide(){
    				$('#yaksokReserveListUserInfoModal').modal('hide')
    				showCpage('1');
    			}
    			
    			/* yaksokReserveList.jsp의 유저 정보 클릭 시 yaksokReserveListUserInfoModal.jsp의 모달에 데이터 전달하고 보여주기*/
				function yaksokReserveListUserInfoModal(yidx,ridx){
					
					$.ajax({
						type:'get',
						url:'yaksokReserveListUserInfoModal?yidx='+yidx+'&&ridx='+ridx,
						cache:false,
						dataType:'html'
						
					}).done(function(res){
						$('#yaksokReserveListUserInfoModal').html(res)
						yaksokReserveListUserInfoModalShow();
						
					})
					.fail(function(err){
						alert('error: '+err.status);
					})
					
				}
    			
    			//-------------------------------------------------약속 OnOff
    			
    			/* yaksoksetting.jsp 페이지의 약속 OnOff 정보 업데이트*/
    			function updateSetting(){

    				$.ajax({
    					type:'get',
    					url:'yaksokSettingUpdate',
    					data:$('form').serialize(),
    					cache:false,
    					dataType:'html'
    					
    				}).done(function(res){
    					alert('수정 완료');
    					$('#yaksokMenu').html(res);
    				})
    				.fail(function(err){
    					alert('error: '+err.status);
    				})
    				
    			}
    			
    			//-------------------------------------------------약속 캘린더
    			
    			/* yaksokCalendarAddModal.jsp 의 추가 버튼 클릭 시 추가하기*/
    	      	function yaksokAddButton(){
    	      		var selectYear=$(".selectYear").html();
    	       	 	var slectMonth=$(".selectMonth").html();
    	       	 	var selectDay=$(".select_day .dayVal").html(); 
    	       	 	alert(selectYear+"/"+slectMonth+"/"+selectDay);
    	       	 	insertCalendar(selectYear,slectMonth,selectDay);
    	      		
    	      	}
    			
    			/*yaksokCalendarAddModal.jsp 모달 보여주기*/
    			function yaksokCalendarAddModalShow(){
    				$('#yaksokCalendarAddModal').modal('show')
    			}
    			
    			/*yaksokCalendarAddModal.jsp 모달 숨기기*/
    			function yaksokCalendarAddModalHide(){
    				$('#yaksokCalendarAddModal').modal('hide')
    			}
    			
    			/* yaksokCalendarAddModal.jsp 페이지의 캘린더 일정 등록 버튼 클릭 시*/
    			function insertCalendar(year,month,selectDay){
    				
    				$.ajax({
    					type:'get',
    					url:'yaksokCalendarAdd?year='+year+'&&month='+month+'&&day='+selectDay,
    					data:$('form').serialize(),
    					cache:false,
    					dataType:'html'
    					
    				}).done(function(res){
    					alert('등록 완료')
    					yaksokCalendarAddModalHide();
    					$('#yaksokMenu').html(res) 
    				})
    				.fail(function(err){
    					alert('error: '+err.status);
    				})
    				
    			}
    			
    			/* yaksokCalendar.jsp의 yaksokCalendarEditModal.jsp의 모달 보여주기 */
    			function yaksokCalendarEditModalShow(){
    		    	$('#yaksokCalendarEditModal').modal('show')
    		    } 
    			
    			/* yaksokCalendar.jsp의 yaksokCalendarEditModal.jsp의 모달 숨기기 */
    			function yaksokCalendarEditModalHide(){
    		    	$('#yaksokCalendarEditModal').modal('hide')
    		    }
    			
    			/* yaksokCalendar.jsp의 일정 클릭 시 yaksokCalendarEditModal.jsp의 모달에 데이터 전달하고 보여주기 */
    			function editCalendar(yidx,cidx){
    		    	
    		    	$.ajax({
    		    		type:'get',
    		    		url:'yaksokCalendarEditModal?yidx='+yidx+'&&cidx='+cidx,
    		    		cache:false,
    		    		dataType:'html'
    		    		
    		    	}).done(function(res){
    		    		$('#yaksokCalendarEditModal').html(res)
    		    		yaksokCalendarEditModalShow();
    		    	}) 
    		    	.fail(function(err){
    		    		alert('error: '+err.status);
    		    	})
    		    	
    		    }
    			
    			/* yaksokCalendar.jsp의 yaksokCalendarEditModal.jsp의 모달 일정 수정하기*/
    			function yaksokCalendarEdit(){
    				
    				$.ajax({
    					type:'get',
    					url:'yaksokCalendarEdit',
    					data:$('form').serialize(),
    					cache:false,
    					dataType:'html'
    					
    				}).done(function(res){
    					alert('수정 완료')
    					yaksokCalendarEditModalHide();
    					$('#yaksokMenu').html(res) 
    				})
    				.fail(function(err){
    					alert('error: '+err.status);
    				})
    				
    			}
    			
    			/* yaksokCalendar.jsp의 yaksokCalendarEditModal.jsp의 모달 일정 삭제하기 */
    			function yaksokCalendarDelete(cidx,yidx){
    				
    				$.ajax({
    					type:'get',
    					url:'yaksokCalendarDelete',
    					data:$('form').serialize(),
    					cache:false,
    					dataType:'html'
    					
    				}).done(function(res){
    					alert('삭제 완료')
    					yaksokCalendarEditModalHide();
    					$('#yaksokMenu').html(res) 
    				})
    				.fail(function(err){
    					alert('error: '+err.status);
    				})
    			}
    			
    			//-------------------------------------------------약속 통계
    			function showStatistics(){
    				
    				$.ajax({
    					type:'get',
    					url:'yaksokStatistics?yidx='+${info.yidx},
    					cache:false,
    					dataType:'html'

    				}).done(function(res){
    					$('#yaksokMenu').html(res);
    				})
    				.fail(function(err){
    					alert('등록된 예약이 없습니다.');
    				})
    				
    			}
    			
    		</script>
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">약속해줘</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="showMenu('yaksokSetForm')">테마</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="showMenu('yaksokCalendar')">일정관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="showCpage('1')">예약관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="showStatistics()">통계</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" onclick="showMenu('yaksokSetting')">설정</a>
                    
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btn-primary" id="sidebarToggle">메뉴</button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item dropdown">
                                    내 약속링크 : <a href="../yaksokReservePage?url=${info.yaksokurl}" target="_blank">localhost:9090/PromiseMe/yaksokReservePage?url=${info.yaksokurl}</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#!">내 정보</a>
                                        <a class="dropdown-item" href="#!">내 약속</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#!">로그아웃</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div id="yaksokMenu">
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${myctx}/resources/static/yaksok/js/scripts.js"></script>
    </body>
</html>