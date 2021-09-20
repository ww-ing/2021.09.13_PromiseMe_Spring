<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="myctx" value="${pageContext.request.contextPath}"/>  
	
	<div>
	<c:if test="${edit ne 'edit'}">
	<button type="button" onclick="showTemplate('2','1')">수정</button>
	</c:if>
	
	<c:if test="${edit eq 'edit'}">
	<button type="button" onclick="saveTemplate()">저장</button>
	</c:if>
	</div>

	<c:if test="${edit ne 'edit'}">
	<div class="templatemo-container">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 black-bg left-container">
			<h2 class="logo-left hidden-xs margin-bottom-60">약속해줘</h2>
		</div> <!-- left section -->
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 white-bg right-container">
			<h2 class="logo-right hidden-xs margin-bottom-60">예약</h2>
			<div class="tm-right-inner-container">
				<h1 class="templatemo-header">${info.content_main_title}</h1>
				<img src="${myctx}/resources/static/templates/template2/images/wooden-desk.jpg" alt="Wooden Desk" class="img-thumbnail">
				<a class="btn btn-secondary" href="#">예약하기</a>
				<article>
					<h2>${info.content1_title}</h2>
					<p>${info.content1}</p>
				</article>
				<article>
					<h2>${info.content2_title}</h2>
					<p>${info.content2}</p>
				</article>
				<article>
					<h2>${info.content3_title}</h2>
					<p>${info.content3}</p>
				</article>
				
				<br><br>
				<div>
					<div>
						<h3>연락처</h3>
						<p>${info.number1_1}-${info.number1_2}-${info.number1_1}</p>
					</div>
					<br>
					<div>	
						<h3>위치</h3>
						<p>${info.locate}</p>
						<a class="btn btn-secondary" href="#!">지도보기</a>
					</div>		
				</div>
				<!-- Call to Action-->
            	<div class="card text-white bg-secondary my-5 py-4 text-center">
                	<div class="card-body"><p class="text-white m-0">지금 바로 예약 플랫폼의 주인이 되어보세요! <a href="start.me">약속하기 바로가기</a></p></div>
            	</div>
				
				<footer>
					<p class="col-lg-6 col-md-6 col-sm-12 col-xs-12 templatemo-copyright">Copyright &copy; (주) 약속하는사람들 2021</p>
				</footer>
			</div>
		</div> <!-- right section -->
	</div>	
</c:if>
	
	<!-- 수정 페이지------------------------------- -->
	<c:if test="${edit eq 'edit'}">
	<!-- Page content-->
	<form name="info" action="yaksokEdit" method="post">
	<input type="hidden" name="yidx" value="${info.yidx}">
    <input type="hidden" name="yaksokurl" value="${info.yaksokurl}">
    <input type="hidden" name="templates" value="2">
    <input type="hidden" name="number2_1" value="${info.number2_1}">
    <input type="hidden" name="number2_2" value="${info.number2_2}">
    <input type="hidden" name="number2_3" value="${info.number2_3}">
    <input type="hidden" name="content_main" value="${info.content_main}">
    
    <input type="hidden" name="image1" value="${info.image1}">
    <input type="hidden" name="image2" value="${info.image2}">
    <input type="hidden" name="image3" value="${info.image3}">
    <input type="hidden" name="image4" value="${info.image4}">
    <input type="hidden" name="image5" value="${info.image5}">
	
	<div class="templatemo-container">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 black-bg left-container">
			<h2 class="logo-left hidden-xs margin-bottom-60">약속해줘</h2>
		</div> <!-- left section -->
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 white-bg right-container">
			<h2 class="logo-right hidden-xs margin-bottom-60">예약</h2>
			<div class="tm-right-inner-container">
				<h1 class="templatemo-header"><input type="text" name="content_main_title" value="${info.content_main_title}"></h1>
				<img src="${myctx}/resources/static/templates/template2/images/wooden-desk.jpg" alt="Wooden Desk" class="img-thumbnail">
				<a class="btn btn-secondary" href="#">예약하기</a>
				<article>
					<h2><input type="text" name="content1_title" value="${info.content1_title}"></h2>
					<p><textarea name="content1">${info.content1}</textarea></p>
				</article>
				<article>
					<h2><input type="text" name="content2_title" value="${info.content2_title}"></h2>
					<p><textarea name="content2">${info.content2}</textarea></p>
				</article>
				<article>
					<h2><input type="text" name="content3_title" value="${info.content3_title}"></h2>
					<p><textarea name="content3">${info.content2}</textarea></p>
				</article>
				
				<br><br>
				<div>
					<div>
						<h3>연락처</h3>
						<p>
						<input name="number1_1" value="${info.number1_1}">-
                        <input name="number1_2" value="${info.number1_2}">-
						<input name="number1_3" value="${info.number1_3}">
						</p>
					</div>
					<br>
					<div>	
						<h3>위치</h3>
						<p><textarea name="locate">${info.locate}</textarea></p>
						<a class="btn btn-secondary" href="#!">지도보기</a>
					</div>		
				</div>
				<!-- Call to Action-->
            	<div class="card text-white bg-secondary my-5 py-4 text-center">
                	<div class="card-body"><p class="text-white m-0">지금 바로 예약 플랫폼의 주인이 되어보세요! <a href="start.me">약속하기 바로가기</a></p></div>
            	</div>
				
				<footer>
					<p class="col-lg-6 col-md-6 col-sm-12 col-xs-12 templatemo-copyright">Copyright &copy; (주) 약속하는사람들 2021</p>
				</footer>
			</div>
		</div> <!-- right section -->
	</div>
	</form>
	</c:if>
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet" type="text/css">
	<link href="${myctx}/resources/static/templates/template2/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="${myctx}/resources/static/templates/template2/css/templatemo_style.css" rel="stylesheet" type="text/css">