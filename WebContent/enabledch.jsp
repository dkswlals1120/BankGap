<!-- 회원 등급 변경 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Semi-Project</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
    <!-- Custom styles for this template -->
    <link href="css/tip.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/pagebutton.css">
    <link href="css/signup.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Abril+Fatface' rel='stylesheet' type='text/css'>
    <link href="css/login.css" rel="stylesheet">

    <!-- JQuery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
  	  
      //로딩시 스크롤 효과 넣기.
      window.onload=function(){AOS.init();} 
      
      //로그아웃 confirm
      $(document).ready(function(){
    	  document.getElementById("logout").onclick = function(){
    		  if(confirm("로그아웃하시겠습니까?")==true){
    			  location.href="UserServlet.do?command=logout";
    		  }
    	  }
      });
      
      //등급변경 popup창
      function popup(user_no){
    	   window.open("UserServlet.do?command=selectonech&user_no="+user_no, "a", "width=250, height=250, left=50, top=30");
      }
     
    </script>
</head>
<body id="page-top">

  <!-- Header(nav)태그 -->
  <jsp:include page="header.jsp"></jsp:include>

  
   <header class="masthead">
    <div class="container">
      <div class="intro-text">
        <div class="intro-lead-in" style="color: white;">Semi-Project!</div>
        <div class="intro-heading text-uppercase" style="font-size: 72px; color: white;">MyPage</div>
      </div>
    </div>
  </header>

  <!--
  <div class="sc">
    <form>
      <fieldset id="sc">
        <input type="search" class="scb" /><button type="submit" class="scbb"><i class="fa fa-search"></i></button>
      </fieldset>
    </form>
  </div>
-->

   <!-- Portfolio Grid -->
 <section class="bg-light page-section" id="portfolio">
  
    <div class="row">
      <div class="col-lg-12 text-center" data-aos="zoom-in">
        <br>
        <h3 class="section-subheading text-muted">회원 등급 변경</h3>
        
      </div>
    </div>

	<form action="UserServlet.do" method="post">
	<input type="hidden" name="command" value="enabledchform" >
		
		
  <div>
  <table border="3" class="container" style="text-align:center;">
  	<col width="50"><col width="50">
  	<col width="50"><col width="50">
  	<col width="50"><col width="50">
  	<tr>
  		<th>NO</th>
  		<th>ID</th>
  		<th>NAME</th>
  		<th>GRADE</th>
  		<th>ENABLED</th>
  	</tr>
  	
  	<c:choose>
  		<c:when test="${empty enabledchdto}">
  			<tr>
  				<td colspan="7">회원 아무도 없음 ㄷㄷ</td>
  			</tr>
  		</c:when>
  		<c:otherwise>
  			<c:forEach var="enabledchdto" items="${enabledchdto}">
  				<tr>
  					<td>${enabledchdto.user_no }</td>
  					<td>${enabledchdto.user_id }</td>
  					<td>${enabledchdto.user_name }</td>
  					<td style="font-weight:bold; font-size:25px;">${enabledchdto.user_grade }
  						<input type="button" value="변경" onclick="popup(${enabledchdto.user_no});"></td>
  					<td>${enabledchdto.user_enabled }</td>
  				</tr>
  			</c:forEach>
  		</c:otherwise>
  	</c:choose>
  	
  </table>
  </div>
  
  <br><br>
<div class="container" >
	
  	<input type="button" value="목록" onclick="location.href='adminpage.jsp'">
  	
  </div>
  </form>
   <div class="page2">
    <ul class="pagination2 modal2">
      <li><a href="#" class="first2">처음 페이지</a></li>
      <li><a href="#" class="arrow2 left2"><<</a></li>
      <li><a href="#" class="active2 num2">1</a></li>
      <li><a href="#" class="num2">2</a></li>
      <li><a href="#" class="num2">3</a></li>
      <li><a href="#" class="num2">4</a></li>
      <li><a href="#" class="num2">5</a></li>
      <li><a href="#" class="num2">6</a></li>
      <li><a href="#" class="num2">7</a></li>
      <li><a href="#" class="num2">8</a></li>
      <li><a href="#" class="num2">9</a></li>
      <li><a href="#" class="num2">10</a></li>
      <li><a href="#" class="arrow2 right2">>></a></li>
      <li><a href="#" class="last2">끝 페이지</a></li>
    </ul>
  </div>
</section>
<br>
<br>
<br>
  


    <!-------------------------editing CODE------------------------->

  <!-- Footer -->
  <jsp:include page="footer.jsp"></jsp:include>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
    <!-- Custom scripts for this template -->
    <script src="js/agency.js"></script>

</body>
</html>