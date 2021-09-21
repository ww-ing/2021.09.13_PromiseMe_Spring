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
        <link href="resources/static/templates/template3/css/styles.css" rel="stylesheet" />
		<script src="https://code.jquery.com/jquery-latest.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		</head>
		
		<body>
		<c:if test="${onoffData.yaksokonoff eq 1}">
		
        <!-- Header - set the background image for the header in the line below-->
        <header class="py-5 bg-image-full" style="background-image: url('https://source.unsplash.com/wfh8dDlNFOk/1600x900')">
            <div class="text-center my-5">
                <img class="img-fluid rounded-circle mb-4" src="https://dummyimage.com/150x150/6c757d/dee2e6.jpg" alt="..." />
                <h1 class="text-white fs-3 fw-bolder">${info.content_main_title}</h1>
                <p class="text-white-50 mb-0">${info.content_main}</p>
            </div>
        </header>
        <!-- Content section-->
        <section class="py-5">
            <div class="container my-5">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <h2>${info.content1_title}</h2>
                        <p class="lead">${info.content1}</p>
                        <p class="mb-0">The universe is almost 14 billion years old, and, wow! Life had no problem starting here on Earth! I think it would be inexcusably egocentric of us to suggest that we're alone in the universe.</p>
                        <a class="btn btn-secondary " href="#yaksokReserveModal" data-toggle="modal">예약하기</a>
                    </div>
                </div>
            </div>
        </section>
		<!-- Call to Action-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">지금 바로 예약 플랫폼의 주인이 되어보세요! <a href="start.me">약속하기 바로가기</a></p></div>
            </div>        
        <!-- Image element - set the background image for the header in the line below-->
        <div class="py-5 bg-image-full" style="background-image: url('https://source.unsplash.com/4ulffa6qoKA/1200x800')">
            <!-- Put anything you want here! The spacer below with inline CSS is just for demo purposes!-->
            <div style="height: 20rem"></div>
        </div>
        
        <!-- Content section-->
        <section class="py-5">
            <div class="container my-5">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <h2>${info.content2_title}</h2>
                        <p class="lead">${info.content2}</p>
                        <p class="mb-0">I can't tell you how many people say they were turned off from science because of a science teacher that completely sucked out all the inspiration and enthusiasm they had for the course.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Content section-->
        <section class="py-5">
            <div class="container my-5">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <h2>${info.content3_title}</h2>
                        <p class="lead">${info.content3}</p>
                        <p class="mb-0">I can't tell you how many people say they were turned off from science because of a science teacher that completely sucked out all the inspiration and enthusiasm they had for the course.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; (주) 약속하는사람들 2021 </p></div>
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
