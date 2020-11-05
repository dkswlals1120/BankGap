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
    <link href="css/agency_new.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Abril+Fatface' rel='stylesheet' type='text/css'>
    
    <!-- 차트 링크 -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

    <!-- CSS -->
    <link href="css/mypage.css" rel="stylesheet">
    
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
      
      function fncSubmit(payno,user_no){
    	 
    	  $("input[name='payno']").val(payno);
    	  $("input[name='user_no']").val(user_no);
    	  
    	  $("#deleteForm").submit();
    	
    	 }
      
     function grSubmit(user_no){
    	 $("input[name='user_no']").val(user_no);
    	 
    	 $("#graphForm").submit();
     
     }
     
     function inputChk(){
			var no = "${list[0].payno}";
			
			if(no < 5){
				alert("지출 내역을 전부 입력해주세요~")
			
			}else{
				location.href='MyPageController.do?command=selectOne&userno=${logindto.user_no}'
			}
     }
      
      
    </script>
</head>
<body id="page-top">

  <!-- Navigation -->
 <jsp:include page="header.jsp"></jsp:include>
  
  <!-- Header -->
<header class="masthead" >
  <section class="page-section">
    <div class="mp1">
      <span>MYPAGE</span>
      <br>
      <br>
      <div class="mp2">
	      <span class="mp2_p"><h5>${logindto.user_name }</h5> 님 환영합니다.</span>
	      <span class="mp2_g">※ ${logindto.user_name } 님의 등급은 <H5> ${logindto.user_grade }</H5>입니다.</span>
	      <input type="button"  name="myinfo" value="내 정보 보기" onclick="location.href='UserServlet.do?command=myinfo&user_no=${logindto.user_no}'" class="mp_i">
	      <input type="button" onclick="inputChk()" value="전문가평가받기" style="margin-right:20px;">
      </div>
    </div>

    <div class="container1_1">
        <div class="title1"><span>지출 그래프</span></div>
        <div class="dnct">
	        <form action="MyPageServlet.do" method="post" id="graphForm">
	        <input type="hidden" value="graph" onclick="location.href='MyPageServlet.do?command=graph&user_no=${ logindto.user_no }'" name="user_no">
	        <!-- <input type="hidden" value="graph" onclick="grSubmit(${sum_dto.user_no });"> -->
	            <div class="card">
	                <div class="card-body">
	                    <canvas id="myChart2"></canvas>
	                </div>
	            </div>
	        </form>
        </div>
    </div>
    <div class="container1_2">
        <div class="title1"><span>지출 내역</span></div>
        <div class="inputgp">
	        <form action="MyPageController.do" method="post">
	        	<input type="hidden" name="command" value="insert">
	        	
	            <select class="st1" name="category">
	                <option value="공과금">공과금</option>
	                <option value="교통비">교통비</option>
	                <option value="문화생활비">문화생활비</option>
	                <option value="식비">식비</option>
	                <option value="유흥비">유흥비</option>
	            </select>
	            <input type="text" placeholder="사용처를 입력해 주세요" name="place" class="ip1">
	            <input type="text" placeholder="사용금액" name="amount" class="ip2">
	            <input type="date" name="usedate" class="ip3">
	            <input type="submit" value="입력" class="ip4">
	         </form>
        </div>
        <form action="MyPageController.do?command=delete" method="post" id="deleteForm">
        <input type="hidden" name="payno" value="">
        <input type="hidden" name="user_no" value="">
        <table class="table2">
            <thead>
              <tr>
                  <th class="thN">번호</th>
                  <th class="thC">카테고리</th>
                  <th class="thT">사용처</th>
                  <th class="thCa">금액</th>
                  <th class="thD">날짜</th>
                  <th class="thDe">삭제</th>
              </tr>
            </thead>
            <tbody>
            <c:choose>
            	<c:when test="${empty list }" >
					<tr>
						<td colspan="6" >----작성된 글이 존재하지 않습니다----</td>
					</tr>
				</c:when>
					<c:otherwise>
				
						<c:forEach var="dto" items="${list }" >
							<tr>
								<td>${dto.payno }</td>
								<td>${dto.category }</td>
								<td>${dto.place }</td>
								<td>${dto.amount }</td>
								<td>${dto.usedate }</td>
								
								 <td><input type="button" name="delete" value="삭제" onclick="fncSubmit(${dto.payno},${logindto.user_no });"></td>
								<!-- <td><input type="submit" name="delete" value="삭제" onclick="location.href='MyPageController.do?command=delete&payno=${dto.payno}'"></td>-->
							</tr>
						</c:forEach>
					</c:otherwise>
            </c:choose>
            </tbody>
        </table>
         </form>
    </div>
  </section>
</header>


<!-- 차트 -->
<script>
var ut = ${ut.sum_amount};
var tr = ${tr.sum_amount};
var ct = ${ct.sum_amount};
var fd = ${fd.sum_amount};
var ps = ${ps.sum_amount};

data = { datasets: [{ backgroundColor: ['#004c70','#0093d1','#f2635f', '#f4d00c', '#006495'],
        data: [ut, tr , ct, fd, ps] }],
        // 라벨의 이름이 툴팁처럼 마우스가 근처에 오면 나타남 
        labels: ['공과금','교통비','문화생활비','식비','유흥비'] 
};

// DATA를 하나씩 배열에 담는다



// 도넛형 차트
var ctx2 = document.getElementById("myChart2");
var myDoughnutChart = new Chart(ctx2, {
  type: 'doughnut',
  data: data,
  options: {maintainAspectRatio: false}
});
</script>
  
  
    <!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
    <!-- Custom scripts for this template -->
    <script src="js/agency.js"></script>

</body>
</html>