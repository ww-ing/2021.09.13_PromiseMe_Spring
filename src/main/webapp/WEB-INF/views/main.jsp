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
        <link rel="icon" type="image/x-icon" href="resources/static/common/assets/favicon.ico" />
        <!-- Bootstrap Icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- SimpleLightbox plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/static/common/css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main"><b>약속해줘</b></a>
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
						<li class="nav-item"><a class="nav-link" href="${myctx}/admin/listAdmin">회원관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${myctx}/admin/yaksokAdmin">약속관리</a></li>
						<li class="nav-item"><a class="nav-link" href="${myctx}/admin/CustomerServiceAdmin">고객센터</a></li>
						<li class="nav-item"><a class="nav-link" href="${myctx}/logout">로그아웃</a></li>
					</c:if>
                    </ul>
                </div>
            </div>
        </nav>	

        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container px-4 px-lg-5">
                <h2 class="text-center mt-0">약속해줘 만의 특별함</h2>
                <hr class="divider" />
                <div class="row gx-4 gx-lg-5">
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-gem fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">TIS 소속 전액 무료</h3>
                            <p class="text-muted mb-0">오직 TIS 학생분들 에게만 제공되는 <br>전액 무료 혜택</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-laptop fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">통계 관리</h3>
                            <p class="text-muted mb-0">예약된 데이터를 한눈에 알아보고 <br>관리 할 수 있도록 통계를 제공합니다</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-globe fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">글로벌 고객</h3>
                            <p class="text-muted mb-0">글로벌 고객을 위한 <br>자동번역 기능을 준비중입니다</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 text-center">
                        <div class="mt-5">
                            <div class="mb-2"><i class="bi-heart fs-1 text-primary"></i></div>
                            <h3 class="h4 mb-2">고객님만 생각합니다</h3>
                            <p class="text-muted mb-0">고객님을 사랑하지 않는다면 <br>이 모든 걸 무료서비스 할까요?</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Portfolio-->
        <div id="portfolio">
            <div class="container-fluid p-0">
                <div class="row g-0">
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/static/common/assets/img/portfolio/fullsize/1.jpg" title="Project Name">
                            <img class="img-fluid" src="resources/static/common/assets/img/portfolio/thumbnails/1.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/static/common/assets/img/portfolio/fullsize/2.jpg" title="Project Name">
                            <img class="img-fluid" src="resources/static/common/assets/img/portfolio/thumbnails/2.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/static/common/assets/img/portfolio/fullsize/3.jpg" title="Project Name">
                            <img class="img-fluid" src="resources/static/common/assets/img/portfolio/thumbnails/3.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/static/common/assets/img/portfolio/fullsize/4.jpg" title="Project Name">
                            <img class="img-fluid" src="resources/static/common/assets/img/portfolio/thumbnails/4.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/static/common/assets/img/portfolio/fullsize/5.jpg" title="Project Name">
                            <img class="img-fluid" src="resources/static/common/assets/img/portfolio/thumbnails/5.jpg" alt="..." />
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="resources/static/common/assets/img/portfolio/fullsize/6.jpg" title="Project Name">
                            <img class="img-fluid" src="resources/static/common/assets/img/portfolio/thumbnails/6.jpg" alt="..." />
                            <div class="portfolio-box-caption p-3">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Project Name</div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
		<!-- Footer-->
        <footer class="bg-light py-5">
            <div class="container px-4 px-lg-5"><div class="small text-center text-muted">Copyright &copy; 2021 - (주)약속하는사람들</div></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
        <!-- SimpleLightbox plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/static/common/js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    </body>
</html>
