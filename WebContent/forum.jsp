<!-- 자유게시판 페이지 -->
<%@page import="com.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<BoardDto> list = (List<BoardDto>)request.getAttribute("list");
	String pageBar = (String)request.getAttribute("pageBar");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Semi-Project</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
    <!-- Custom styles for this template -->
    <link href="css/agency_new2.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/pagebutton.css">
    <link href="css/forum.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

    <!-- JQuery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

    <!-- scroll effect_AOS -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <script type="text/javascript">
      window.onload=function(){AOS.init();} //로딩시 스크롤 효과 넣기.
      
      $(document).ready(function(){
    	  document.getElementById("logout").onclick = function(){
    		  if(confirm("로그아웃하시겠습니까?")==true){
    			  location.href="UserServlet.do?command=logout";
    		  }
    	  }
      });//로그아웃 confirm
      
      function writeChk() {
			var user = "${logindto.user_id}";
			
			if(user != ""){
				location.href="forumController.do?command=writeform";
			
			}else{
				alert("로그인 후 이용해주세요");
			}
    }
    </script>
</head>
<body id="page-top">

<!-- Header(nav) -->
<jsp:include page="header.jsp"></jsp:include>
  
   <header class="masthead">
    <div class="container">
      <div class="intro-text">
        <div class="intro-lead-in" style="color: #0f4c81;">Semi-Project!</div>
        <div class="intro-heading text-uppercase" style="font-size: 72px; color: #2a2c2d;">forum</div>
      </div>
    </div>
  </header>

   <!-- Portfolio Grid -->
 <section class="bg-light page-section" id="portfolio">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center" data-aos="zoom-in">
        <h2 class="section-heading text-uppercase">Forum</h2>
        <h3 class="section-subheading text-muted">자유 게시판입니다</h3>
      </div>
    </div>

    <div class="row">
        <div class="sc">
            <form>
              <fieldset id="sc">
                <input type="search" class="scb" style="z-index: 200;" /><button type="submit" class="scbb"><i class="fa fa-search"></i></button>
              </fieldset>
            </form>
          </div>
      <table class="table">
        <col width="50"><col width="100">
		<col width="300"><col width="100">
		<tr>
			<th>NO</th>
			<th>WRITER</th>
			<th>TITLE</th>
			<th>DATE</th>
		</tr>
		<c:choose>
			<c:when test="${empty forumlist }">
				<tr>
					<td colspan="4">----작성된 글이 존재하지 않습니다----</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="forumlist" items="${forumlist }">
					<tr>
						<td>${forumlist.seq }</td> 
						<td>${forumlist.writer }</td>
						<td><a href="forumController.do?command=forumdetail&seq=${forumlist.seq }">${forumlist.title }</a></td>
						<td>${forumlist.regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
      </table>
    </div>
  </div>

 <div id='pageBar'><%=pageBar %></div>
  <div class="btbt">
      <input type="button" name="write" value="글쓰기" class="wbtn" onclick="writeChk()">
  </div>
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