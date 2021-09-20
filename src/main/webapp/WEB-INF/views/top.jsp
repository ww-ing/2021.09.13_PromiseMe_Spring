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
        <link rel="icon" type="image/x-icon" href="${myctx}/resources/static/common/assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${myctx}/resources/static/common/css/styles.css" rel="stylesheet" />
        <!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${myctx}/main "><b>약속해줘</b></a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    
                    <ul class="navbar-nav ms-auto my-2 my-lg-0">
                    <c:if test="${loginUser.userid ne 'admin'}">
	                    <c:if test="${loginUser eq null}">
	                        <li class="nav-item"><a class="nav-link" href="${myctx}/login">로그인</a></li>
	                        <li class="nav-item"><a class="nav-link" href="${myctx}/join">회원가입</a></li>
						</c:if>
						<c:if test="${loginUser ne null}">
	                        <li class="nav-item"><a class="nav-link" href="${myctx}/user/yaksok">약속관리</a></li>
	                        <li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
	                        <li class="nav-item"><a class="nav-link" href="${myctx}/user/myInfo">내정보</a></li>
	                        <li class="nav-item"><a class="nav-link" href="${myctx}/logout">로그아웃</a></li>
						</c:if>      
					</c:if>  
					
					<c:if test="${loginUser.userid eq 'admin'}">
						<li class="nav-item"><a class="nav-link" href="#">회원관리</a></li>
						<li class="nav-item"><a class="nav-link" href="#">약속관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${myctx}/logout">로그아웃</a></li>
					</c:if>
                    </ul>
                </div>
            </div>
        </nav>	