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

    <!--swiper-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  
    <!-- Custom styles for this template -->
    <!--<link href="css/agency_1.css" rel="stylesheet">-->
    <link href="css/agency_new.css" rel="stylesheet">


    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <!--<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>-->
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Abril+Fatface' rel='stylesheet' type='text/css'>
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
               location.href="BGServlet.do?command=logout";
            }
         }
      });//로그아웃 confirm
      function loginChk(){
         var chk = "${logindto.user_id}";
         
        if(chk == ""){
           alert("로그인 후 이용해주세요!")
             
        }else{
           location.href="BoardServlet.do?command=writeBoardGo";
        }         
      }
      
    </script>

</head>
<body id="page-top">
  <!-- Navigation -->
 <jsp:include page="header.jsp"></jsp:include>

   <!-- Header -->
   <header class="masthead">
    <div class="container">
    
      <div class="intro-text">
        <div class="intro-heading">
          BankGap
        </div>
        
          <div class="intro-lead-in">
            Don't you want to get advice<br> on the right spending habits?<br>
            Get feedback on your spending habits.
          </div>
          
      </div>
    </div>
  </header>



  <!-- About -->
  <section class="bg-light page-section" id="about">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">About Bank Gap</h2>
          <h3 class="section-subheading text-muted">I will tell you about Bank Gap.</h3>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <ul class="timeline">
            <li>
              <div class="timeline-image">
                <img class="rounded-circle img-fluid" src="img/about/1_1.jpg" alt="">
              </div>
              <div class="timeline-panel">
                <div class="timeline-heading">
                  <h4>First thought.</h4>
                  <h4 class="subheading">Do you know...</h4>
                </div>
                <div class="timeline-body">
                  <p class="text-muted">Where your money is spent? Don't know where the money is being used, and want to spend it in vain?</p>
                </div>
              </div>
            </li>
            <li class="timeline-inverted">
              <div class="timeline-image">
                <img class="rounded-circle img-fluid" src="img/about/2_2.jpg" alt="">
              </div>
              <div class="timeline-panel">
                <div class="timeline-heading">
                  <h4>Second thought.</h4>
                  <h4 class="subheading">Do you know...</h4>
                </div>
                <div class="timeline-body">
                  <p class="text-muted"> How much money is spent? Aren't you surprised by the price of the card every month? </p>
                </div>
              </div>
            </li>
            <li>
              <div class="timeline-image">
                <img class="rounded-circle img-fluid" src="img/about/3_3.jpg" alt="">
              </div>
              <div class="timeline-panel">
                <div class="timeline-heading">
                  <h4>Last thought</h4>
                  <h4 class="subheading">Have you ever wanted...</h4>
                </div>
                <div class="timeline-body">
                  <p class="text-muted">To talk to someone about your consumption habits? Do you want to seriously consult someone professional and friendly?</p>
                </div>
              </div>
            </li>
            <li class="timeline-inverted">
              <div class="timeline-image">
                <h4>Solve your
                  <br>worries
                  <br>on this site!</h4>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </section>
  

  <!-- Tip -->
<section class="page-section" style="margin-left:150px; margin-right: 150px;">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center" data-aos="zoom-in">
        <h2 class="section-heading text-uppercase">Real-Time Expert Evaluation</h2>
        <h3 class="section-subheading text-muted">실시간 전문가 평가</h3>
      </div>
    </div>
  </div>
      <div class="swiper-container swiper-container_2">
          <div class="swiper-wrapper">
              <div class="swiper-slide" data-aos="fade-up">
                <div class="swiper-content">
                    <a class="tip-link" data-toggle="modal" href="#">
                      <div class="tip-hover">
                        <div class="tip-hover-content">
                          <i class="fa fa-check fa-3x"></i>
                        </div>
                      </div>
                      <img class="img-fluid" src="img/portfolio/01-thumbnail.jpg" alt="">
                    </a>
                    
                    <div class="tip-caption">
                      <h4>게시판1</h4>
                      <p class="text-muted">작성자</p>
                    </div>
                </div><!-- swiper-content end-->
            </div><!-- swiper-slide end-->

              <div class="swiper-slide" data-aos="fade-up">
                <div class="swiper-content">
                    <a class="tip-link" data-toggle="modal" href="#">
                      <div class="tip-hover">
                        <div class="tip-hover-content">
                          <i class="fa fa-check fa-3x"></i>
                        </div>
                      </div>
                      <img class="img-fluid" src="img/portfolio/02-thumbnail.jpg" alt="">
                    </a>
                    
                    <div class="tip-caption">
                      <h4>게시판2</h4>
                      <p class="text-muted">작성자</p>
                    </div>
                </div><!-- swiper-content end-->
              </div><!-- swiper-slide end-->
          
                <div class="swiper-slide" data-aos="fade-up">
                  <div class="swiper-content">
                      <a class="tip-link" data-toggle="modal" href="#">
                        <div class="tip-hover">
                          <div class="tip-hover-content">
                            <i class="fa fa-check fa-3x"></i>
                          </div>
                        </div>
                        <img class="img-fluid" src="img/portfolio/03-thumbnail.jpg" alt="">
                      </a>
                      
                      <div class="tip-caption">
                        <h4>게시판3</h4>
                        <p class="text-muted">작성자</p>
                      </div>
                  </div><!-- swiper-content end-->
              </div><!-- swiper-slide end-->

              <div class="swiper-slide" data-aos="fade-up">
                <div class="swiper-content">
                    <a class="tip-link" data-toggle="modal" h
                    ref="#">
                      <div class="tip-hover">
                        <div class="tip-hover-content">
                          <i class="fa fa-check fa-3x"></i>
                        </div>
                      </div>
                      <img class="img-fluid" src="img/portfolio/04-thumbnail.jpg" alt="">
                    </a>
                    
                    <div class="tip-caption">
                      <h4>게시판4</h4>
                      <p class="text-muted">작성자</p>
                    </div>
                </div><!-- swiper-content end-->
            </div><!-- swiper-slide end-->

              <div class="swiper-slide" data-aos="fade-up">
                <div class="swiper-content">
                    <a class="tip-link" data-toggle="modal" href="#">
                      <div class="tip-hover">
                        <div class="tip-hover-content">
                          <i class="fa fa-check fa-3x"></i>
                        </div>
                      </div>
                      <img class="img-fluid" src="img/portfolio/05-thumbnail.jpg" alt="">
                    </a>
                    
                    <div class="tip-caption">
                      <h4>게시판5</h4>
                      <p class="text-muted">작성자</p>
                    </div>
                </div><!-- swiper-content end-->
            </div><!-- swiper-slide end-->

              <div class="swiper-slide" data-aos="fade-up">
                <div class="swiper-content">
                    <a class="tip-link" data-toggle="modal" href="#">
                      <div class="tip-hover">
                        <div class="tip-hover-content">
                          <i class="fa fa-check fa-3x"></i>
                        </div>
                      </div>
                      <img class="img-fluid" src="img/portfolio/06-thumbnail.jpg" alt="">
                    </a>
                    
                    <div class="tip-caption">
                      <h4>게시판6</h4>
                      <p class="text-muted">작성자</p>
                    </div>
                </div><!-- swiper-content end-->
            </div><!-- swiper-slide end-->
          </div>
          <!-- 페이징 -->
          <div class="swiper-pagination"></div>
        </div>
  </section>

 <!-- Portfolio Grid -->
 <section class="bg-light page-section" id="portfolio">
  <div class="container">
    
    <div class="row">
      <div class="col-lg-12 text-center" data-aos="zoom-in">
        <h2 class="section-heading text-uppercase">Forum</h2>
        <h3 class="section-subheading text-muted">자유게시판</h3>
      </div>
    </div>

    <div class="row">
      <!--1. -->
      <div class="col-md-4 col-sm-6 portfolio-item " data-aos="fade-up">
        <a class="portfolio-link" data-toggle="modal" href="#">
          <div class="portfolio-hover">
            <div class="portfolio-hover-content">
              <i class="fas fa-window-restore fa-3x"></i>
            </div>
          </div>
          <img class="img-fluid" src="img/portfolio/01-thumbnail.jpg" alt="">
        </a>
        
        <div class="portfolio-caption">
          <h4>게시판1</h4>
          <p class="text-muted">작성자</p>
        </div>
      </div>
      
      <!--2. -->
      <div class="col-md-4 col-sm-6 portfolio-item" data-aos="fade-up">
        <a class="portfolio-link" data-toggle="modal" href="#">
          <div class="portfolio-hover">
            <div class="portfolio-hover-content">
              <i class="fas fa-window-restore fa-3x"></i>
            </div>
          </div>
          <img class="img-fluid" src="img/portfolio/02-thumbnail.jpg" alt="">
        </a>
        <div class="portfolio-caption">
          <h4>게시판2</h4>
          <p class="text-muted">작성자</p>
        </div>
      </div>
      <!--3. -->
      <div class="col-md-4 col-sm-6 portfolio-item" data-aos="fade-up">
        <a class="portfolio-link" data-toggle="modal" href="#">
          <div class="portfolio-hover">
            <div class="portfolio-hover-content">
              <i class="fas fa-window-restore fa-3x"></i>
            </div>
          </div>
          <img class="img-fluid" src="img/portfolio/03-thumbnail.jpg" alt="">
        </a>
        <div class="portfolio-caption">
          <h4>게시판3</h4>
          <p class="text-muted">작성자</p>
        </div>
      </div>

      <!--4. -->
      <div class="col-md-4 col-sm-6 portfolio-item" data-aos="fade-up">
        <a class="portfolio-link" data-toggle="modal" href="#">
          <div class="portfolio-hover">
            <div class="portfolio-hover-content">
              <i class="fas fa-window-restore fa-3x"></i>
            </div>
          </div>
          <img class="img-fluid" src="img/portfolio/04-thumbnail.jpg" alt="">
        </a>
        <div class="portfolio-caption">
          <h4>게시판4</h4>
          <p class="text-muted">작성자</p>
        </div>
      </div>

      <!--5. -->
      <div class="col-md-4 col-sm-6 portfolio-item" data-aos="fade-up">
        <a class="portfolio-link" data-toggle="modal" href="#">
          <div class="portfolio-hover">
            <div class="portfolio-hover-content">
              <i class="fas fa-window-restore fa-3x"></i>
            </div>
          </div>
          <img class="img-fluid" src="img/portfolio/05-thumbnail.jpg" alt="">
        </a>
        <div class="portfolio-caption">
          <h4>게시판5</h4>
          <p class="text-muted">작성자</p>
        </div>
      </div>

      <!--6. -->
      <div class="col-md-4 col-sm-6 portfolio-item" data-aos="fade-up">
        <a class="portfolio-link" data-toggle="modal" href="#">
          <div class="portfolio-hover">
            <div class="portfolio-hover-content">
              <i class="fas fa-window-restore fa-3x"></i>
            </div>
          </div>
          <img class="img-fluid" src="img/portfolio/06-thumbnail.jpg" alt="">
        </a>
        <div class="portfolio-caption">
          <h4>게시판6</h4>
          <p class="text-muted">작성자</p>
        </div>
      </div>
    </div>
  </div>
</section>

  <!-- Footer -->
  <jsp:include page="footer.jsp"></jsp:include>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
    <!-- Custom scripts for this template -->
    <script src="js/agency.js"></script>

</body>
</html>