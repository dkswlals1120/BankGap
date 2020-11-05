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
    <link href="resource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
    <!-- Custom styles for this template -->
    <link href="resource/css/tip.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/pagebutton.css">
    <link href="resource/css/signup.css" rel="stylesheet">
   

    <!-- Custom fonts for this template -->
    <link href="http://fonts.googleapis.com/earlyaccess/hanna.css" rel='stylesheet' type='text/css'>
	<link href="http://fonts.googleapis.com/earlyaccess/jejuhallasan.css" rel='stylesheet' type='text/css'>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' >
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Abril+Fatface' rel='stylesheet' type='text/css'>
    <link href="css/login.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
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
    h4{
    	font-family: 'Jeju Hallasan', serif;
    	color:darkblue;
    }
    p{
    	font-family: 'Hanna', serif;
    }
    </style>
</head>
<body id="page-top">

  <!-- Header -->
  <jsp:include page="header.jsp"></jsp:include>
   <header class="masthead">
    <div class="container">
      <div class="intro-text">
        <div class="intro-lead-in" style="color: white;">Semi-Project!</div>
        <div class="intro-heading text-uppercase" style="font-size: 60px; color: white;">할인</div>
      </div>
    </div>
  </header>
<%    
    String search= (String)request.getAttribute("search");
%>
	
   <!-- Portfolio Grid -->
 <section class="bg-light page-section" id="portfolio">
  <div class="container">
  	<br>
    <div class="row">
    	<div class="col-lg-12 text-center" data-aos="zoom-in">
    	<h2 class="section-subheading text-muted" style="font-family: 'Hanna', serif;" >서울시 착한가격업소를 찾아라!</h2>
      	<br><br><hr><br>
    	</div>
    	<img src="${dto.sh_photo }" onerror="this.src='resource/img/kindimage.jpg'" width="400" height="400" />
    	<br>
    	<div>
    	<h4>업소명</h4>
    	<p>${dto.sh_name }</p>
   			
    	<h4>주소</h4>
    	<p>${dto.sh_addr }</p>
   			
    	<h4>찾아 오시는 길</h4>
    	<p>${dto.sh_way }</p>
    	
    	<h4>업소 정보</h4>
    	<p>${dto.sh_info }</p>
    	
    	<h4>자랑거리</h4>
    	<p>${dto.sh_pride }</p>
    	
    	<h4>전화번호</h4>
    	<p>${dto.sh_phone }</p>
    	
    	<input type="button" value="지도로 찾아보기" onclick="location.href='kindmap.jsp?sh_addr=${dto.sh_addr}'" style="font-family: 'Hanna', serif;">
    	<input type="button" value="목록으로" onclick="history.back(-1);" style="font-family: 'Hanna', serif;">
   			
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
  	<script>
	data = { datasets: [{ backgroundColor: ['#004c70','#0093d1','#f2635f', '#f4d00c', '#006495'],
	data: [10, 15, 25, 40, 10] }],
	// 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남 
	labels: ['생활비','식비','문화생활비','공과금','여가생활비'] };

	// 도넛형 차트
	var ctx2 = document.getElementById("myChart2");
	var myDoughnutChart = new Chart(ctx2, {
		type: 'doughnut',
		data: data,
		options: {}
	});
	</script>


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