<!-- 자유게시판 글 하나 페이지 -->
<%@page import="com.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" isELIgnored="false"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
    <!-- Custom styles for this template -->
    <!-- <link href="css/gong_gu.css" rel="stylesheet"> -->
    <link href="css/agency_new.css" rel="stylesheet">
    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
 	
	<link href="css/signup.css" rel="stylesheet">
	
	<!-- JQuery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <!-- scroll effect_AOS -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <script>
      window.onload=function(){AOS.init();} //로딩시 스크롤 효과 넣기.
      
      $(document).ready(function(){
    	  document.getElementById("logout").onclick = function(){
    		  if(confirm("로그아웃하시겠습니까?")==true){
    			  location.href="UserServlet.do?command=logout";
    		  }
    	  }
      });//로그아웃 confirm
    </script>
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

	<style type="text/css">
		.detailform{
			float: left;
		}	
		
		.board-pan{
			width:100%;
			height:300pt;
			border: 1px solid silver;
			border-radius: 10px;
		}
		table{
			width:100%;
			
		}
		.comm1{
			float:right;
			margin-right: 3pt;
		}	
		
		.comm2{
			float:right;
			cursor: pointer;
		}
		#del1{
			float:right;
			margin-right: 3pt;
		}
		#del2{
			margin-right:70pt;
			float:right;
			cursor: pointer;
		}
		
	</style>

	<script type="text/javascript">
		$(function(){
			//getCommList();
		});
		
		function deleteConfirm(){
			if(confirm("삭제 하시겠습니까?")){
				location.href="BoardServlet.do?command=boardDelete&seq=${boarddto.seq }&userNo=${logindto.user_no}&type=${boarddto.type}"
			}
		}
		
		function updatePopup(comm_no){
			var boardno = "${boarddto.seq}";
			var target = "BoardServlet.do?command=commUpdateForm&commno="+comm_no+"&boardno="+boardno;
			
			open(target,"","width=570, height=350");
		}
	</script>
</head>
<body>
	<!-- Header(nav) -->
	<jsp:include page="header.jsp"></jsp:include>
	
<header class="mastead">
    <section class="page-section">
      <div class="container text-center" style="width: 50%;" id="formContent">
      		 <div class="tip-title" style="float:left"> 
      		 	<h2 class ="section-heading text-uppercase" id="login_logo" style="font-size:15pt">Forum!</h2>
      		 	<h3 class="section-subheading text-muted">자유 게시판 게시글입니다</h3>
      		 </div>
      		 <br>
      		 <br>
         	<table style="border-radius:10px">
         		<tr align="left">
         			<td colspan="3">
         			<b>${boarddto.writer}</b> 
         			<div style="font-size:10pt">${boarddto.regdate }</div>
         			<span><i class="fas fa-comment"></i> ${commCnt }</span>&nbsp;&nbsp;       			
         			<span><i class="fas fa-eye"></i> ${boarddto.view }</span>&nbsp;&nbsp;
         			</td>
         		</tr>
         		
         		<tr align="left" style="border: 1">
         			<td colspan="3">
         			<b id="Btitle" style="font-size:20pt">${boarddto.title }</b>
         			<c:if test="${boarddto.writer eq logindto.user_id }">
         			<a onclick="deleteConfirm()" id="del2" class="del">삭제</a>
         			<a href="BoardServlet.do?command=boardUpdateForm&seq=${boarddto.seq }&userNo=${logindto.user_no}" id="del1" class="del">수정</a>
         			</c:if>
         			</td>
         		</tr>
         		
         		<tr>
         			<td><hr align="left"></td>
         		</tr>
         		<tr align="left">
         		
         			<td colspan="2">${boarddto.content }</td>
         		</tr>
         	</table>
         	<br>
         	<br>
         	
         	
         	<table>
				<c:choose>	
				<c:when test="${empty comm }">
					  <h2>등록된 댓글이 없습니다.</h2>
				</c:when>
						 
				<c:otherwise>
				<tr align="left">
         			<td>
         				<span style="border:solid 1px black; border-radius: 5px"> ${commCnt } Comments</span>
         			</td>
         		</tr>
					<c:forEach var="comm" items="${comm }">
					
				<tr align="left">
         			<td> 
					  <div class="commwriter">
					  ${comm.comm_writer }
					  <c:if test="${comm.comm_writer eq logindto.user_id }">
					 <a href="BoardServlet.do?command=commDelete&commno=${comm.comm_no }&seq=${boarddto.seq}&type=${boarddto.type}" style="font-size:10pt" class="comm2">삭제</a>
					  <a onclick="updatePopup(${comm.comm_no})" style="font-size:10pt" class="comm1">수정</a>
					  </c:if>
					  </div>
					  <div style="font-size:10pt">${comm.comm_regdate } 작성</div>
					  <div class="commcontent"><b>
						   ${comm.comm_content }
						   </b>					  
					  </div>     
					  <hr style="width:100%">      			
         			</td>
         		</tr>	
					</c:forEach>
				</c:otherwise>        		
         		</c:choose>	
		 	 
		 	 
		 	 <form action="BoardServlet.do" method="post">
		 	 	<input type="hidden" name="command" value="commInsert">
		 	 	<input type="hidden" name="boardno" value="${boarddto.seq }">
		 	 	<input type="hidden" name="userno" value="${logindto.user_no }">
		 	 	<input type="hidden" name="userid" value="${logindto.user_id }">
		 	 	<input type="hidden" name="boardtype" value="F">
		 	  
		 	  <c:choose>
		 	   <c:when test="${empty logindto.user_id }">
		 	   <tr>
		 	   	<td><textarea cols="100" rows="4" style="resize:none" name="commText" placeholder="로그인 후 이용해 주세요" readonly="readonly"></textarea>
					<span><input type="submit" value="댓글등록"/></span>
		 	  	</td>
		 	  	</tr>
		 	   </c:when>
		 	  <c:otherwise>
		 	  <tr>
		 	  	<td><textarea cols="100" rows="4" style="resize:none" name="commText"></textarea>
					<span><input type="submit" value="댓글등록"/></span>
		 	  	</td>
		 	  </tr>
		 	  </c:otherwise>
		 	  </c:choose>
		 	 </form>           		
         	</table> 
         	
            </div>
    </section>
</header>
 
 <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>	
</body>
</html>