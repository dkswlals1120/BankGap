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
 <section class="bg-light page-section" id="portfolio" style="padding:60px 0;">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center" data-aos="zoom-in">
        <h2 class="section-subheading text-muted">전통 시장</h2>
        <br>
        <hr>
        <form action="apicontroller.do" method="post">
        	<input type="hidden" name="command" value="searchlist">
	        <div style="margin: 50px;">
	        	<input type="text" style="margin-bottom: 20px;" name="search" placeholder="서울 지역명&전통 시장 이름을 검색하세요" autofocus>
	        	<input type="submit" value="검색">
	        </div>
        </form>
        
      </div>
      	<div>
	      	<h1>전통시장에 대해서....</h1><br>
	     	<p> 대형마트가 많아지면서 전통시장 문화가 많이 사라지고 있어요</p>
			<p>하지만 중소벤처기업부 ,소상공인시장진흥공단이 힘을 모아 활기찬 시장을 만들기 위해 많은 노력을 기울이고 있답니다.</p>
		</div>
		<hr>
		<div>
			<h4>먼 옛날에는 사람들이 북적거리는 곳에 시장이 생겼어요</h4><br>
			<p>하지만 현대사회에서는 교통과 통신이 발달하면서 사람들이 북적북적 모여 드는 도심의 재래시장은 점점 없어지고 대형마트가 늘어나게 되었어요.</p>
			<p>많은 것이 갖춰진 대형마트에 비해 전통시장이 부족한 부분은 분명 있지만, 전통시장만의 훈훈한 정과 그에 따른 매력들을 따라올 수는 없을 것 같아요.</p>
			<img src="img/traditional_market.gif"><br>
			<hr>
			<br>
		</div>
		<div>
			<h4>품질도 좋고 가격도 저렴해요!</h4>
			<p>
			전통시장의 좋은 점은 품질 좋은 제품을 저렴하게 구입할 수 있다는 것이에요.<br>
			전통시장에 있는 대부분의 물건들이 산지에서 직접 거래하여 중간의 거래과정이 줄어들기 때문이죠.<br>
			</p>
			특히 요즘 채소와 과일 가격이 올라가면서 대형마트보다 저렴한 전통시장에 대한 관심이 높아지고 있는데,<br>
			 그래서 인지 대형마트와 전통시장의 물건들을 꼼꼼히 비교해보고 장을 보는 사람들이 늘어나고 있어요.<br>
			 <img src="img/traditional_market2.gif"><br>
			 <img src="img/traditional_market3.gif"><br>
		</div><hr><br>
		<div>
			<h4>다양한 즐길거리가 가득해요</h4>
			<p>시장길에 길게 늘어선 과일, 채소, 생선들은 재미있는 눈요기 거리이고,<br>
			 대형마트의 시식코너 부럽지 않은 떡볶이, 튀김, 닭강정 등 다양한 먹거리들은 장을 보면서 만날 수 있는 즐거움 중 하나이죠.</p>
			<p>또한 요즘은 전통시장에서 시민노래자랑, 경품행사 같은 다양한 이벤트들도 만나 볼 수 있어요.</p>
		</div><hr><br>
		<div>
			<h4>대형마트 못지않게 편안해요</h4>
			<p>전통시장의 단점은 ‘불편하다’ 라고 생각하는 사람이 많아요. 가격은 저렴하지만 주차시설, 편의시설이 없어 이용하기 힘들다는 인식이 많죠<br>
			하지만 요즘은 불편하다는 이미지에서 벗어나 현대식으로 편리하게 변화하고 있답니다. </p>
			<p>현재 대부분의 전통시장에는 하늘을 향한 위쪽에 지붕을 설치하여 눈, 비가 내려도 <br>
			편하게 장을 볼 수 있고 주차장이 따로 마련되어 있어서 편리한 주차시설도 만나볼 수 있어요.</p><br>
			<img src="img/traditional_market4.gif"><br>
		</div><hr><br>
		<div>
		<h4>지금까지 전통시장에 대해 알아보았어요</h4>
		<p>최근 전통시장 뿐만 아니라 동네슈퍼마켓 또한 많은 어려움을 겪고 있어요.</p>
		<p>앞으로는 “정이 있어 내 집같이 편하고, 나들이하는 마음으로 가고 싶은 우리동네 가게” 나들가게를 많이 방문해 주세요.</p>
		</div>
		
		
	    </div>
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