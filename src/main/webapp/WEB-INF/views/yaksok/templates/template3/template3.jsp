<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
	
	<div>
	<c:if test="${edit ne 'edit'}">
	<button type="button" onclick="showTemplate('3','1')">수정</button>
	</c:if>
	
	<c:if test="${edit eq 'edit'}">
	<button type="button" onclick="saveTemplate()">저장</button>
	</c:if>
	</div>
	
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">약속해줘 예약</a>
            </div>
        </nav>
        
        <!-- 기본 페이지------------------------------------ -->
        <c:if test="${edit ne 'edit'}">
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
                        <a class="btn btn-secondary" href="#!">예약하기</a>
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
        </c:if>
        
        <!-- 수정 페이지------------------------------------ -->
        <c:if test="${edit eq 'edit'}">
        <!-- Header - set the background image for the header in the line below-->
        <form name="info" action="yaksokEdit" method="post">
        <input type="hidden" name="yidx" value="${info.yidx}">
	    <input type="hidden" name="yaksokurl" value="${info.yaksokurl}">
	    <input type="hidden" name="locate" value="${info.locate}">
	    <input type="hidden" name="templates" value="3">
	    <input type="hidden" name="number1_1" value="${info.number1_1}">
	    <input type="hidden" name="number1_2" value="${info.number1_2}">
	    <input type="hidden" name="number1_3" value="${info.number1_3}">
	    <input type="hidden" name="number2_1" value="${info.number2_1}">
	    <input type="hidden" name="number2_2" value="${info.number2_2}">
	    <input type="hidden" name="number2_3" value="${info.number2_3}">
	    
	    <input type="hidden" name="image1" value="${info.image1}">
	    <input type="hidden" name="image2" value="${info.image2}">
	    <input type="hidden" name="image3" value="${info.image3}">
	    <input type="hidden" name="image4" value="${info.image4}">
	    <input type="hidden" name="image5" value="${info.image5}">
        <header class="py-5 bg-image-full" style="background-image: url('https://source.unsplash.com/wfh8dDlNFOk/1600x900')">
            <div class="text-center my-5">
                <img class="img-fluid rounded-circle mb-4" src="https://dummyimage.com/150x150/6c757d/dee2e6.jpg" alt="..." />
                <h1 class="text-white fs-3 fw-bolder"><input type="text" name="content_main_title" 
                    value="${info.content_main_title}"></h1>
                <p class="text-white-50 mb-0"><textarea name="content_main">${info.content_main}</textarea></p>
            </div>
        </header>
        <!-- Content section-->
        <section class="py-5">
            <div class="container my-5">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <h2><input type="text" name="content1_title" 
                   		value="${info.content1_title}"></h2>
                        <p class="lead"><textarea name="content1">${info.content1}</textarea></p>
                        <p class="mb-0">The universe is almost 14 billion years old, and, wow! Life had no problem starting here on Earth! I think it would be inexcusably egocentric of us to suggest that we're alone in the universe.</p>
                        <a class="btn btn-secondary" href="#">예약하기</a>
                    </div>
                </div>
            </div>
        </section>
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
                        <h2><input type="text" name="content2_title" 
                	    value="${info.content2_title}"></h2>
                        <p class="lead"><textarea name="content2">${info.content2}</textarea></p>
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
                        <h2><input type="text" name="content3_title" 
                    	value="${info.content3_title}"></h2>
                        <p class="lead"><textarea name="content3">${info.content3}</textarea></p>
                        <p class="mb-0">I can't tell you how many people say they were turned off from science because of a science teacher that completely sucked out all the inspiration and enthusiasm they had for the course.</p>
                    </div>
                </div>
            </div>
        </section>
        </form>
        </c:if>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; (주) 약속하는사람들 2021 </p></div>
        </footer>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${myctx}/resources/static/templates/template3/css/styles.css" rel="stylesheet" />        