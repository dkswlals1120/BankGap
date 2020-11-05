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
    <!-- <link href="css/gong_gu.css" rel="stylesheet"> -->
    <link href="css/agency_new2.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/writeview.css">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

    <!-- JQuery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
      window.onload=function(){AOS.init();} //로딩시 스크롤 효과 넣기.
      
      $(document).ready(function(){
    	  document.getElementById("logout").onclick = function(){
    		  if(confirm("로그아웃하시겠습니까?")==true){
    			  location.href="BGServlet.do?command=logout";
    		  }
    	  }
      });//로그아웃 confirm
      
      function popup(user_no){
    	   window.open("BGServlet.do?command=selectonech&user_no="+user_no, "a", "width=250, height=250, left=50, top=30");
      }//등급변경 popup창

    </script>
    
</head>
<body id="page-top">
  <!-- Header -->
  <jsp:include page="header.jsp"></jsp:include>
  
   <header class="masthead">
    <div class="container">
      <div class="intro-text">
        <div class="intro-lead-in" style="color:#0f4c81;">Semi-Project!</div>
        <div class="intro-heading text-uppercase" style="font-size: 72px; color: #2a2c2d;">expert evaluation</div>
      </div>
    </div>
  </header>

   <!-- Portfolio Grid -->
 <section class="bg-light page-section" id="portfolio">
  <div class="container">
    
    <div class="row">
      <div class="col-lg-12 text-center" data-aos="zoom-in">
        <h2 class="section-heading text-uppercase">Forum</h2>
        <h3 class="section-subheading text-muted">자유 게시판 게시글입니다</h3>
      </div>
    </div>
	<form action="forumController.do" method="post">
		<input type="hidden" name="command" value="boardupdate">
		<input type="hidden" name=seq value="${dto.seq }">
    <div class="row">
    	<div class="table">
    	<jsp:useBean id="dto" class="com.forum.dto.forumDto" scope="request"></jsp:useBean>
    		<table class="wrtable" border="1">
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="${dto.title }"></td>
				</tr>
				<tr>
    				<th>작성자</th>
    				<td><jsp:getProperty property="writer" name="dto" /></td>
    			</tr>
				<tr>
					<th>날짜</th>
				 	<td><jsp:getProperty property="regdate" name="dto" /></td>
				</tr>
				<tr>
					<th>조회수</th>
					<td><jsp:getProperty property="view" name="dto"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>	
					<textarea rows="10" cols="100" name="content">${dto.content }</textarea>	
					</td>
				</tr>
    		</table>
    		
    	</div>
     </div>
  <div class="row clear">
  	<div class="writer">
  		<input type="submit" name="update_wr" value="수정" />
		<input type="button" name="delete_wr" value="취소" onclick="location.href='forumController.do?command=delete&seq=<jsp:getProperty property="seq" name="dto"/>'">
  	</div>
  </div>
  </form>
</section>


  


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