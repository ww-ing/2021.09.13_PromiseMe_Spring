<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 
<c:import url="/top"/>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

	<h1 class="text-center">약속관리</h1>
	 <div class="col-12 m-3"> 
	 <button class="text-right">
	 <!-- <a href="yaksokAddForm.me">NEW</a> -->
	 <a class="btn btn-secondary " href="#yaksokAddModal" data-toggle="modal">New</a>
	 </button></div>
	 
	<table class="table table-striped">
		<tr>
		   <th>번호</th>
		   <th>약속명</th>
		   <th>등록일</th>
		   <th>미확인</th>
		   <th>관리</th>
		</tr>
		
		<c:forEach var="yaksok" items="${yaksokList}">
		<tr>
		   <th>${yaksok.yidx}</th>
		   <th>${yaksok.yaksokname}</th>
		   <th>${yaksok.indate}</th>
		   <th class="text text-danger">0</th>
		   
		   <td>   
		    <form class="form-inline" action="yaksokMenu.me" method="post">
		   		<input type="hidden" name="yidx" value="${yaksok.yidx}">
				<button>관리</button>
			</form>
		   </td>
		   
		</tr>
		</c:forEach>
	</table>
<%@ include file="../yaksok/modal/yaksokAddModal.jsp"%>
<c:import url="/foot"/>