<!-- nav태그를 가지고있는 header.jsp 바디 맨위에 include해주면 사용가능. -->
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
	<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel='stylesheet' type='text/css'>
	<link href="http://fonts.googleapis.com/earlyaccess/jejuhallasan.css" rel='stylesheet' type='text/css'>
	
	<style type="text/css">
	.navfont {
		font-family: 'Hanna', serif;
	}
	
	#mainNav .navbar-nav .nav-item .nav-link{
		font-family: 'Hanna', serif;
	}
	</style>
</head>
<body>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="index.jsp"><span style="color: #0f4c81;">B</span>ank <sapn style="color: #0f4c81;">G</sapn>ap</a>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item">
            <a class="nav-link navfont" href="index.jsp">홈</a>
          </li>
          <li class="dropdown nav-item">
            <a class="dropdown-toggle nav-link navfont" data-toggle="dropdown" style="cursor: pointer;">전문가</a>
             <ul class="dropdown-menu">
                <li><a href="BoardServlet.do?command=proboard" class="navfont">전문가 평가 게시판</a></li>
                <li><a href="proInfo.jsp" class="navfont">전문가 정보</a></li>
              </ul>
          </li>
          <li class="dropdown nav-item">
            <a class="dropdown-toggle nav-link navfont" data-toggle="dropdown" style="cursor: pointer;">TIP 정보</a>
            	<ul class="dropdown-menu">
            		<li><a href="BoardServlet.do?command=tipboard" class="navfont">TIP 게시판</a></li>
            		<li><a href="market.jsp" class="navfont">전통 시장</a></li>
            		<li><a href="seoulkind.jsp" class="navfont">착한가격 업소</a></li>
            	</ul>
          </li>
          <li class="nav-item">
            <a class="nav-link navfont" href="forumController.do?command=forumlist">자유게시판</a>
          </li>
          <li class="nav-item">
            <a class="nav-link navfont" href="UserServlet.do?command=mypage&user_grade=${logindto.user_grade }">마이페이지</a>
          </li>
            <c:choose>
	          <c:when test="${empty logindto }">
	          	<li class="nav-item">
	          		<a class="nav-link navfont" href="login.jsp">로그인</a>	
	          	</li>
	          </c:when>
	          <c:otherwise>
	          	<li class="nav-item" id="logout">
	            	<a class="nav-link navfont" href="#">로그아웃</a>
	          	</li>
	          </c:otherwise>
          </c:choose>
        </ul>
      </div>
    </div>
  </nav>
</body>
</html>