 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div>
	<c:if test="${edit ne 'edit'}">
	<button type="button" onclick="showTemplate('1','1')">수정</button>
	</c:if>
	
	<c:if test="${edit eq 'edit'}">
	<button type="button" onclick="saveTemplate()">저장</button>
	</c:if>
	</div>
	
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container px-5">
                <a class="navbar-brand" href="#">약속해줘 예약</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            </div>
        </nav>
        
        <!-- 기본 페이지------------------------------------ -->
        <c:if test="${edit ne 'edit'}">
        <!-- Page Content-->
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5 text-center">
                <div class="col-lg-12"><img class="img-fluid rounded mb-4 mb-lg-0" src="https://dummyimage.com/900x400/dee2e6/6c757d.jpg" alt="..." /></div>
                <div class="col-lg-12">
                    <h1 class="font-weight-light">${info.content_main_title}</h1>
                    <p>${info.content_main}</p>
                    <a class="btn btn-secondary" href="#">예약하기</a>
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
        </c:if>
        
        <!-- 수정 페이지------------------------------------ -->
        <c:if test="${edit eq 'edit'}">
        <!-- Page Content-->
        <form name="info" action="yaksokEdit" method="post">
        <input type="hidden" name="yidx" value="${info.yidx}">
        <input type="hidden" name="yaksokurl" value="${info.yaksokurl}">
        <input type="hidden" name="templates" value="1">
        
        <input type="hidden" name="image1" value="${info.image1}">
        <input type="hidden" name="image2" value="${info.image2}">
        <input type="hidden" name="image3" value="${info.image3}">
        <input type="hidden" name="image4" value="${info.image4}">
        <input type="hidden" name="image5" value="${info.image5}">
        <div class="container px-4 px-lg-5">
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5 text-center">
                <div class="col-lg-12"><img class="img-fluid rounded mb-4 mb-lg-0" src="https://dummyimage.com/900x400/dee2e6/6c757d.jpg" alt="..." /></div>
                <div class="col-lg-12">
                    <h1 class="font-weight-light"><input type="text" name="content_main_title" 
                    value="${info.content_main_title}"></h1>
                    <textarea name="content_main">${info.content_main}</textarea>
                    <a class="btn btn-secondary" href="#">예약하기</a>
                </div>
            </div>
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="https://dummyimage.com/900x400/dee2e6/6c757d.jpg" alt="..." /></div>
                <div class="col-lg-5">
                    <h4 class="font-weight-light"><input type="text" name="content1_title" 
                    value="${info.content1_title}"></h4>
                    <textarea name="content1">${info.content1}</textarea>
                </div>
            </div>
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="https://dummyimage.com/900x400/dee2e6/6c757d.jpg" alt="..." /></div>
                <div class="col-lg-5">
                    <h4 class="font-weight-light"><input type="text" name="content2_title" 
                    value="${info.content2_title}"></h4>
                    <textarea name="content2">${info.content2}</textarea>
                </div>
            </div>
            <!-- Heading Row-->
            <div class="row gx-4 gx-lg-5 align-items-center my-5">
                <div class="col-lg-7"><img class="img-fluid rounded mb-4 mb-lg-0" src="https://dummyimage.com/900x400/dee2e6/6c757d.jpg" alt="..." /></div>
                <div class="col-lg-5">
                    <h4 class="font-weight-light"><input type="text" name="content3_title" 
                    value="${info.content3_title}"></h4>
                    <textarea name="content3">${info.content3}</textarea>
                </div>
            </div>
            <!-- Call to Action-->
            <div class="card text-white bg-secondary my-5 py-4 text-center">
                <div class="card-body"><p class="text-white m-0">지금 바로 예약 플랫폼의 주인이 되어보세요! <a href="start.me">약속하기 바로가기</a></p></div>
            </div>
            <!-- Content Row-->
            <div class="row gx-4 gx-lg-5">
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h4 class="card-title">위치</h4>
                           	<textarea name="locate">${info.locate}</textarea>
                           	<a class="btn btn-secondary" href="#!">지도보기</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h4 class="card-title">연락처</h4>
                            	<div>
                           			<input name="number1_1" value="${info.number1_1}">-
                           			<input name="number1_2" value="${info.number1_2}">-
                           			<input name="number1_3" value="${info.number1_3}">
                           		</div>
                           		<br>
                           		<div>
                           			<input name="number2_1" value="${info.number2_1}">-
                           			<input name="number2_2" value="${info.number2_2}">-
                           			<input name="number2_3" value="${info.number2_3}">
                           		</div>	
                        </div>   	
                    </div>
                </div>
                <div class="col-md-4 mb-5">
                    <div class="card h-100">
                        <div class="card-body">
                            <h4 class="card-title">이메일</h4>
                           	<input name="email" value="wdestinw@gmail.com">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </form>
        </c:if>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-4 px-lg-5"><p class="m-0 text-center text-white">Copyright &copy; (주) 약속하는사람들 2021</p></div>
        </footer>   