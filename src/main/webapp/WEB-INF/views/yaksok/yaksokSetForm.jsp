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
        
		<script>
			$(function(){
				showTemplate(${info.templates},'0');
			})
			
			function showTemplate(templates,editNum){
				$.ajax({
					type:'get',
					url:'yaksokSet?yidx='+${info.yidx}+'&&templates='+templates+'&&editNum='+editNum,
					cache:false,
					dataType:'html'
					
				}).done(function(res){
					$('#template').html(res);
				})
				.fail(function(err){
					alert('error: '+err.status);
				})
			}
			
		    function submit() {
		        document.forms["info"].submit();
		    }
		
		</script>        
    </head>
    <body>

		<div class="text-center bg-white">
			<button type="button" onclick="showTemplate('1','0')">템플릿1</button>
			<button type="button" onclick="showTemplate('2','0')">템플릿2</button>
			<button type="button" onclick="showTemplate('3','0')">템플릿3</button>
			<!-- <button type="button" onclick="showTemplate('4','0')">템플릿4</button> -->
			<!-- <button type="button" onclick="showTemplate('5','0')">템플릿5</button> -->
		</div>				
	<div id="template" class="pt-3"></div>
    </body>
</html>  