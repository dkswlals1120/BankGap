<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Semi-Project</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/agency_new.css" rel="stylesheet">


    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Abril+Fatface' rel='stylesheet' type='text/css'>
    
    <!-- 차트 링크 -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

    <!-- CSS -->
    <link href="css/mypage.css" rel="stylesheet">
    <link href="css/exmypage.css" rel="stylesheet">
    
    <!-- JQuery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
      window.onload=function(){AOS.init();} //로딩시 스크롤 효과 넣기.
      
      $(document).ready(function(){
    	  document.getElementById("logout").onclick = function(){
    		  if(confirm("로그아웃하시겠습니까?")==true){
    			  location.href="UserServlet.do?command=logout";
    		  }
    	  }
      });//로그아웃 confirm

    </script>
</head>
<body id="page-top">
<!-- Header -->
<jsp:include page="header.jsp"></jsp:include>

<header class="masthead" >
  <section class="page-section">
    <div class="mp1">
      <span>MYPAGE</span>
      <br>
      <br>
      <div class="mp2">
	      <span class="mp2_p"><h5>${logindto.user_name }</h5> 님 환영합니다.</span>
	      <span class="mp2_g">※ ${logindto.user_name } 님의 등급은 <H5> ${logindto.user_grade }</H5>입니다.</span>
	      <input type="button"  name="myinfo" value="내 정보 보기" onclick="location.href='UserServlet.do?command=myinfo&user_no=${logindto.user_no}'" class="mp_i">
      </div>
    </div>
    
    <div class="container" >
    
    <div class="hisTable">
    	<!-- <form action="BGServlet.do?" method="post">
    		<input type="hidden" name="command" value="ProInsert">
    		<div class="hisp">
    			<h3>경력 추가</h3>
    			<input type="text" placeholder="경력 기간을 입력해주세요" name="history_date">
    			<input type="text" placeholder="경력 내용을 입력해 주세요" name="history">
    			<input type="submit" name="ProInsert" value="추가">
    			<hr>
    		</div>
    		</form>
    		 -->
    		<form action="BGServlet.do?command=proInfo" method="post" id="selectAll">
    		<input type="hidden" name ="user_no" value="">
	        <table class="table2">
	            <thead>
	              <tr>
	                  <th class="thNu">번호</th>
	                  <th class="thDa">경력기간</th>
	                  <th class="thCo">경력내용</th>
	              </tr>
	            </thead>
	            <tbody>
	            <c:choose>
	            	<c:when test="${empty list }" >
						<tr>
							<td colspan="6" >----작성된 글이 존재하지 않습니다----</td>
						</tr>
					</c:when>
						<c:otherwise>
					
							<c:forEach var="dto" items="${list }" >
								<tr>
									<td>${dto.seq }</td>
									<td>${dto.history_date }</td>
									<td>${dto.history }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
	            </c:choose>
	            </tbody>
	        </table>
         </form>
    </div>
    <!-- 
    	<div class="ipdiv">
	    	<span>경력을 등록하시겠습니까?</span>
		  	<input type="button" value= "경력등록" onclick="location.href='BGServlet.do?command=selectall'" class="ipbtn">
	  	</div>
	  	<div class="ipdiv">
	    	<span>작성한 글을 보시겠습니까?</span>
	  		<input type="button" value="작성글보기" onclick="location.href='BGServlet.do?command=enabledch'" class="ipbtn">
	  	</div>
	  	
	-->
  	</div>
  </section>
</header>
  
  
  
    <!-- Footer -->
  <jsp:include page="footer.jsp"></jsp:include>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
    <!-- Custom scripts for this template -->
    <script src="js/agency.js"></script>

</body>
</html>