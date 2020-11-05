<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html

>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Semi-Project</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
    <!-- Custom styles for this template -->
    <link href="css/agency_new2.css" rel="stylesheet">   <!-- -------- 이 부분이 서브네비 디자인도 변경이 될 거에요 지금 주석 해놔서 네비 디자인 통합이 안되어있는거라-->
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
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<!-- font 추가 -->
	<link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel='stylesheet' type='text/css'>
	<link href="http://fonts.googleapis.com/earlyaccess/jejuhallasan.css" rel='stylesheet' type='text/css'>
	
	<!-- 차트 링크 -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

    <!-- JQuery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
    <script type="text/javascript">
      window.onload=function(){AOS.init();} //로딩시 스크롤 효과 넣기.
      
      $(document).ready(function(){
    	  document.getElementById("logout").onclick = function(){
    		  if(confirm("로그아웃하시겠습니까?")==true){
    			  location.href="controller.do?command=logout";
    		  }
    	  }
      });//로그아웃 confirm
      
    </script>
    
    <style type="text/css">
		@media (min-width: 768px){
			header.masthead .intro-text {
			    padding-top: 200px;
			    padding-bottom: 50px;
			}
		}
		
		header.masthead {
			background-image: none;
			background-color: #3691e2;
		}
		
		h1, h4{
			font-family: 'Jeju Hallasan', serif;
			color: darkblue;
		}
		
		h2, p{
			font-family: 'Hanna', serif;
		}
		th,td{
    	font-family: 'Hanna', serif;
    }
    </style>
</head>
<body id="page-top">

	<jsp:include page="header.jsp"></jsp:include>

  <!-- Header -->
   <header class="masthead">
    <div class="container">
      <div class="intro-text">
        <div class="intro-lead-in" style="color: white;">Semi-Project!</div>
        <div class="intro-heading text-uppercase" style="font-size: 60px; color: white;">이모 저모</div>
      </div>
    </div>
  </header>

   <!-- Portfolio Grid -->
 <section class="bg-light page-section" id="portfolio">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center" data-aos="zoom-in">
        <h2 class="section-subheading text-muted">전통 시장</h2>
        <br>
        <hr>
        <form action="apicontroller.do" method="post">
        	<input type="hidden" name="command" value="searchlist">
	        <div>
	        	<input type="text" name="search" placeholder="서울 지역명&전통 시장 이름을 검색하세요"autofocus >
	        	<input type="submit" value="검색">
	        	
	        </div>
	        
	<table border="3" class="container">
  	<col width="100"><col width="50">
  	<col width="50"><col width="100">
  	<col width="70"><col width="70">
  	<tr>
  		<th>시장명</th>
  		<th>시장번호</th>
  		<th>자치구</th>
  		<th>상세 주소</th>
  		<th>경도</th>
  		<th>위도</th>
  	</tr>
  	
  	<c:choose>
  		<c:when test="${empty dto}">
  			<tr>
  				<td colspan="6">검색 목록이 없습니다.</td>
  			</tr>
  		</c:when>
  		<c:otherwise>
  			<c:forEach var="dto" items="${dto }">
  				<tr>
  					<td><a href="map.jsp?mname=${dto.m_name }">${dto.m_name }</a></td>
  					<td>${dto.m_code }</td>
  					<td>${dto.guname }</td>
  					<td>${dto.m_addr }</td>
  					<td>${dto.lng }</td>
  					<td>${dto.lat }</td>	
  				</tr>
  			</c:forEach>
  		</c:otherwise>
  	</c:choose>
  	
  </table>
        </form>
        </div>
    </div>
    </div>
    <br>
    <br>
   
	<!-- button 고쳐야됨 -->
 
</section>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


    <!-------------------------editing CODE------------------------->

  <!-- Footer -->
  
  <jsp:include page="footer.jsp"></jsp:include>

    <!-- Bootstrap core JavaScript -->
    <script src="resource/vendor/jquery/jquery.min.js"></script>
    <script src="resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
    <!-- Custom scripts for this template -->
    <script src="js/agency.js"></script>
    

</body>
</html>