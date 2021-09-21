<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="myctx" value="${pageContext.request.contextPath}"/>  

<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>약속해줘</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="yaksok/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${myctx}/resources/static/yaksok/css/styles.css" rel="stylesheet" />
		<script src="https://code.jquery.com/jquery-latest.js"></script>
        <!-- Bootstrap core JS-->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <!-- Core theme JS-->
        <script src="${myctx}/resources/static/yaksok/js/scripts.js"></script>		
	</head>	
		
		<body>
		<c:if test="${onoffData.yaksokonoff eq 1}">
		
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="#yaksokReserveModal">약속해줘 예약</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            </div>
        </nav>
        
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5 text-center">
                <div class="col-lg-12"><img class="img-fluid rounded mb-4 mb-lg-0" src="https://dummyimage.com/900x400/dee2e6/6c757d.jpg" alt="..." /></div>
                <div class="col-lg-12">
                    <h1 class="font-weight-light">${info.content_main_title}</h1>
                    <p>${info.content_main}</p>
                    <a class="btn btn-secondary " href="#yaksokReserveModal" data-toggle="modal">예약하기</a>
                </div>
            </div>
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-5"><img class="img-fluid rounded mb-4 mb-lg-0" src="https://dummyimage.com/900x400/dee2e6/6c757d.jpg" alt="..." /></div>
                <div class="col-lg-5">
                    <h3 class="font-weight-light">${info.content1_title}</h3>
                    <p>${info.content1}</p>
                </div>
            </div>
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-5"><img class="img-fluid rounded mb-4 mb-lg-0" src="https://dummyimage.com/900x400/dee2e6/6c757d.jpg" alt="..." /></div>
                <div class="col-lg-5">
                    <h3 class="font-weight-light">${info.content2_title}</h3>
                    <p>${info.content2}</p>
                </div>
            </div>
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-5"><img class="img-fluid rounded mb-4 mb-lg-0" src="https://dummyimage.com/900x400/dee2e6/6c757d.jpg" alt="..." /></div>
                <div class="col-lg-5">
                    <h3 class="font-weight-light">${info.content3_title}</h3>
                    <p>${info.content3}</p>
                </div>
            </div>
            <!-- Call to Action-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">지금 바로 예약 플랫폼의 주인이 되어보세요! <a href="start.me">약속하기 홈페이지</a></p></div>
            </div>
            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5">
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h3 class="card-title">위치</h3>
                            <p class="card-text">${info.locate}</p>
                            <a class="btn btn-secondary" href="#!">지도보기</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h3 class="card-title">연락처</h3>
                            <p class="card-text">매장 번호 : ${info.number1_1}-${info.number1_2}-${info.number1_3}<br>
                            					 휴대폰 : ${info.number2_1}-${info.number2_2}-${info.number2_3}</p>
                        </div>  
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h3 class="card-title">이메일</h3>
                            <p class="card-text">wdestinw@gmail.com</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; (주) 약속하는사람들 2021</p></div>
        </footer>
        </c:if>
        
        <c:if test="${onoffData.yaksokonoff eq 0}" >
	        <div class="text-primary text-center">
	        <h1>해당 약속은 현재 준비중입니다.</h1>
	        </div>
        </c:if>
        
        <!-- yaksokBookingModal.jsp의 소스를 include------------------------ -->
		<%@ include file="/WEB-INF/views/yaksok/modal/yaksokReserveModal.jsp"%>
  		<!-- ------------------------------------------------------------- --> 
        </body>  
</html>        