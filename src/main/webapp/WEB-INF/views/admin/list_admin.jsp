<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:import url="/top"/>
	<style type="text/css">
	#listTr:hover{
		background:#E2E2E2;
	}
</style>
<script>
	
	/* userInfoModal_admin.jsp의 모달 보여주기 */
	function userInfoModal_adminShow(){
		$('#userInfoModal_admin').modal('show')
	}
	
	/* userInfoModal_admin.jsp의 모달 숨기기 */
	function userInfoModal_adminHide(){
		$('#userInfoModal_admin').modal('hide')
	}
	
	/* userInfoModal_admin.jsp의 모달에 데이터 전달하고 보여주기*/
	function userInfoModal_admin(idx){
		
		$.ajax({
			type:'post',
			url:'userInfoModal_admin?idx='+idx,
			cache:false,
			dataType:'html'
			
		}).done(function(res){
			$('#userInfoModal_admin').html(res)
			userInfoModal_adminShow();
			
		})
		.fail(function(err){
			alert('error: '+err.status);
		})
		
	}
</script>

				
    			<!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <br>
                    <h1 class="h3 mb-2 text-gray-800">[관리자] 회원관리</h1><br>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            <h3 class="text-center">총 회원 : ${userCount}</h3>
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>아이디</th>
                                            <th>전화번호</th>
                                            <th>등록일</th>
                                            <th>회원상태</th>
                                        </tr>
                                     </thead>
                                     <tbody>   
                                        <c:if test="${userList eq null or empty userList}">
                                        <tr>
                                            <td colspan="12" class="text-center">등록된 예약이 없습니다.</td>
                                        </tr>
                                        </c:if>
                                        
                                        <c:if test="${userList ne null and not empty userList}">
                                        <c:forEach var="list" items="${userList}">
                                        
                                        <!-- 관리자를 제외한 회원의 리스트만 -->
                                        <c:if test="${list.userid ne 'admin'}">
                                        <tr id="listTr" onclick="userInfoModal_admin(${list.idx})">
                                        	
                                            <td>${list.username}</td>
                                            <td>${list.userid}</td>
                                            <td>${list.hp1}-${list.hp2}-****</td>
                                            <td>${list.indate}</td>
                                            <c:if test="${list.mstate eq '0' }">
                                            <td class="text-primary">활동회원</td>
                                            </c:if>
                                            <c:if test="${list.mstate eq '1' }">
                                            <td class="text-success">정지회원</td>
                                            </c:if>
                                            <c:if test="${list.mstate eq '-1' }">
                                            <td class="text-danger">탈퇴회원</td>
                                            </c:if>
                                            
                                        </tr>
                                        </c:if><!-- 관리자 예외처리 -->
                                        </c:forEach>
                                        </c:if><!-- null 예외처리 -->
                                    </tbody>
                                    <tfoot>
										<tr>
											<td colspan="12">
												<ul class="pagination justify-content-center">
													<c:forEach var="i" begin="1" end="${pageCount}">
														<li class="page-item <c:if test="${cpage eq i}">active</c:if>">
															<a class="page-link" 
															href="listAdmin?cpage=${i}">${i}</a>
														</li>
													</c:forEach>
												</ul>
											</td>
										</tr>
									</tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
        <!-- yaksokReserveListUserInfoModal.jsp의 데이터를 담을 div -->
    	<div class="modal" id="userInfoModal_admin">
    	</div>
	
<c:import url="/foot"/>