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

    <!-- JQuery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <!-- CSS -->
    <link href="css/login.css" rel="stylesheet">
    <link href="css/myinfo3.css" rel="stylesheet">

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
     
     function button(user_no){
    	 if(confirm("탈퇴하시겠습니까? 모든 정보가 사라집니다.") == true){
    		 location.href="UserServlet.do?command=secession&user_no="+user_no;
    	 }
     }//탈퇴 확인 여부 confirm
     
    </script>
</head>
<body id="page-top">

<jsp:include page="header.jsp"></jsp:include>

<header class="masthead" >
  <section class="page-section">
    <div class="container text-center">
    
	    <div class="col-lg-12 text-center aaa" data-aos="zoom-in">
	        <h2 class="section-heading text-uppercase">MyPage</h2>
	        <h3 class="section-subheading text-muted">MyInfo</h3>
	    </div>
	    
	    <div class="container">
    		<div class="row">
			    <table>
			    	<tr>
			    		<th><h5 class="section-subheading text-muted">아이디</h5></th>
			    		<td><input type="text" value="${logindto.user_id }" readonly="readonly" class="inputbox"></td>
			    	</tr>
			    	
			    	<tr>
			    		<th><h5 class="section-subheading text-muted">등급</h5></th>
			    		<td><input type="text" value="${logindto.user_grade }" readonly="readonly" class="inputbox"></td>
			    	</tr>
			    	
			    	<tr>
			    		<th><h5 class="section-subheading text-muted">이름</h5></th>
			    		<td><input type="text" value="${logindto.user_name }" readonly="readonly" class="inputbox"></td>
			    	</tr>
			    	
			    	<tr>
			    		<th><h5 class="section-subheading text-muted">휴대폰</h5></th>
			    		<td><input type="text" value="${logindto.user_phone }" readonly="readonly" class="inputbox"></td>
			    	</tr>
			    	
			    	<tr>
			    		<th><h5 class="section-subheading text-muted">이메일</h5></th>
			    		<td><input type="text" value="${logindto.user_email }" readonly="readonly" class="inputbox"></td>
			    	</tr>
			    </table>
			   </div>
			  </div>
	  </div>
	  <br>
	  <div class="container">
	  	<div class="btdiv">
		  	<input type="button" value="목록" onclick="location.href='UserServlet.do?command=mypage&user_grade=${logindto.user_grade}'">
		  	<div class="btdiv_r">
			  	<input type="button" value="내정보 수정" onclick="location.href='UserServlet.do?command=updatemyinfo&user_no=${logindto.user_no}'">
			  	<input type="button"  value="탈퇴" id="secession" onclick="button(${logindto.user_no});" >
		  	</div>
		</div>
	  </div>
	</section>
	</header>
    <!-------------------------editing CODE------------------------->

  <!-- Footer -->
  <jsp:include page="footer.jsp"></jsp:include>

    <!-- Bootstrap core JavaScript -->
    <script src="resource/vendor/jquery/jquery.min.js"></script>
    <script src="resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
    <!-- Custom scripts for this template -->
    <script src="resource/js/agency.js"></script>

</body>
</html>