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
    <link href="css/agency_new2.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/pagebutton.css">
    <link rel="stylesheet" type="text/css" href="css/profile.css">

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
</head>
<body id="page-top">

  <!-- Header(nav)태그 -->
  <jsp:include page="header.jsp"></jsp:include>

   <header class="masthead">
    <div class="container">
      <div class="intro-text">
        <div class="intro-lead-in" style="color: #0f4c81;">Semi-Project!</div>
        <div class="intro-heading text-uppercase" style="font-size: 72px; color:#2a2c2d;">expert information</div>
      </div>
    </div>
  </header>

  <!-- Portfolio Grid -->
 <section class="bg-light page-section" id="portfolio">
  <div class="container">
    
    <div class="row">
      <div class="col-lg-12 text-center" data-aos="zoom-in">
        <h2 class="section-heading text-uppercase">expert information</h2>
        <h3 class="section-subheading text-muted">Bank Gap의 전문가 정보입니다.</h3>
      </div>
    </div>

    <div class="row">
        <div class="pro">
            <img src="img/proinfo/pro1.jpg">

            <ul>
                <li class="pro_ti"><span class="pro_name">김원중</span><span class="pro_po">펀드매니저</span></li>
                <li class="pro_content">
                    <p>1980.03 KH대학교 경제학과 졸업<br>
                   		 1980.05 KH투자대회 대상<br>
                      	1980.06 ~ 1990.06 KH금융 펀드매니저<br>
                      	1990.06 ~ 2005.08 KH증권사 주식운용부<br>
                      	2005.09 ~ 2019.12 한국투자증권 펀드매니저<br>
                      	2020.01 ~ BANK-GAP 펀드매니저
                    </p>
                </li>
                <li class="pro_ex">
                    <span>email : kimwj@bg.ko</span>
                    <span>tell : 010-1234-5678</span>
                </li>
            </ul>
        </div>
        <div class="pro">
            <img src="img/proinfo/pro2.jpg">

            <ul>
                <li class="pro_ti"><span class="pro_name">권민석</span><span class="pro_po">투자분석가</span></li>
                <li class="pro_content">
                    <p>1995.03 KH대학교 경제학과 졸업<br>
                      	1995.06 ~ 2005.06 KH보험 투자분석가<br>
                      	2005.07 ~ 2015.07 KH증권사 애널리스트<br>
                      	2015.09 ~ 2018.12 KH신용평가원 투자분석가<br>
                      	2019.01 ~ 2019.12 KH방송 '투자투자' 투자상담사<br>
                      	2020.01 ~ BANK-GAP 펀드매니저
                    </p>
                </li>
                <li class="pro_ex">
                    <span>email : kwonms@bg.ko</span>
                    <span>tell : 010-2345-6789</span>
                </li>
            </ul>
        </div>
        <div class="pro">
            <img src="img/proinfo/pro3.jpg">

            <ul>
                <li class="pro_ti"><span class="pro_name">성경수</span><span class="pro_po">회계사</span></li>
                <li class="pro_content">
                    <p>1994 공인회계사 합격<br>
                    	1995.03 KH대학교 회계학과 졸업<br>
                      	1995.06 ~ 2000.06 KH기업 회계팀<br>
                      	2000.08 ~ 2010.10 KH금융 회계사<br>
                      	2010.12 ~ 2019.12 금융감독원 감리국<br>
                      	2020.01 ~ BANK-GAP 회계사
                    </p>
                </li>
                <li class="pro_ex">
                    <span>email : sungks@bg.ko</span>
                    <span>tell : 010-3456-7890</span>
                </li>
            </ul>
        </div>

        <div class="pro">
          <img src="img/proinfo/pro4.jpg">

          <ul>
              <li class="pro_ti"><span class="pro_name">안지민</span><span class="pro_po">은행출납사무원</span></li>
              <li class="pro_content">
                  <p>1998.03 KH대학교 회계학과 졸업<br>
                      	1998.07 ~ 2003.08 HK은행 차장<br>
                      	2003.09 ~ 2010.10 KH은행 전무<br>
                      	2010.10 ~ 2019.12 KH은행 부지점장<br>
                      	2020.04 ~ BANK-GAP 채권투자분석가
                  </p>
              </li>
              <li class="pro_ex">
                  <span>email : anjm@bg.ko</span>
                  <span>tell : 010-4567-8901</span>
              </li>
          </ul>
        </div>
        
        <div class="pro">
          <img src="img/proinfo/pro5.jpg">

          <ul>
              <li class="pro_ti"><span class="pro_name">전은지</span><span class="pro_po">신용분석가</span></li>
              <li class="pro_content">
                  <p>2005 CRA 취득<br>
                	  	2006.03 KH대학교 경영학과 졸업<br>
                      	2006.06 ~ 2011.06 KH금융 금융원 <br>
                      	20011 신용분석사 취득<br>
                      	2011.01 ~ 2016.02 KH금융 신용분석가<br>
                      	2016.03 ~ 2020.04 금융감독원 신용분석가<br>
                      	2020.05 ~ BANK-GAP 회계사
                  </p>
              </li>
              <li class="pro_ex">
                  <span>email : jeonej@bg.ko</span>
                  <span>tell : 010-5678-9012</span>
              </li>
          </ul>
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