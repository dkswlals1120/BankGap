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
    
    <!-- JQuery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		//회원가입 유효성 검사
		$(document).ready(function(){
			$("#idChk").change(function(){				
				if($("#idChk").prop("checked") == true){
					var target = "UserServlet.do?command=idChk&user_id="+$("#user_id").val().trim();
					open(target,"","resizable=no, scrollbars=no, width=400, height=260");
				}
			});
		});
		
		function validate(){
			function chk(re, e, msg){
	            if(re.test(e.value)){
	                return true;
	            }else{
	                alert(msg);
	                e.value = "";
	                e.focus();
	                return false;
	            }
	        }
			
			var id = document.getElementById("user_id");
			var pw = document.getElementById("user_pw");
			var pwChk = document.getElementById("user_pw_chk");
			var name = document.getElementById("user_name");
			var phone = document.getElementById("user_phone");
			var gender = document.getElementById("user_gender");
			var email = document.getElementById("user_email");
			var birth = document.getElementById("user_birth");
			var pwChkText = document.getElementById("pwChkText");
			
			//아이디 입력여부 검사
			if(id.value==null || id.value==""){
				alert("아이디 입력바람");
				id.focus();
				return false;	
			}
			
			//아이디 유효성 검사
			if(!chk(/^[a-z][a-z\d]{3,11}$/, id, "아이디 첫글자는 영문소문자, 4~12자리 입력")){
				return false;
			}
			
			//비밀번호 입력여부 검사
			if(pw.value==null || pw.value==""){
				alert("비밀번호 입력바람");
				pw.focus();
				return false;
				
			}
			//비밀번호 유효성 검사
			if(!chk(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,16}$/, pw, "비밀번호는 영문 대문자와 소문자, 숫자, 특수문자를 하나 이상 포함하여 8~16자리 입력")){
				return false;
			}
			
			if(pwChk.value==null || pwChk.value==""){
				alert("비밀번호 확인 입력바람");
				pwChk.focus();
				return false;
			}
			
			if(pw.value==pwChk.value){
				pwChkText.innerHTML='Pw match';
				pwChkText.style.color='blue';
			}else{
				pwChkText.innerHTML='Pw mismatch';
				pwChkText.style.color='red';
				alert("비밀번호 체크 재확인바람");
				return false;
			}
			
			//이름 입력여부 검사
			if($("#user_name").val()==null || $("#user_name").val()==""){
				alert("이름 입력바람");
				$("#user_name").focus();
				return false;
			}
			
			//전화번호 입력여부 검사
			if($("#user_phone").val()==null || $("#user_phone").val()==""){
				alert("전화번호 입력바람");
				$("#user_phone").focus();
				return false;
			}
			
			//전화번호 유효성 검사
			if(!chk(/^01[0179][0-9]{7,8}$/, phone, "유효하지 않은 핸드폰 번호, - 제외하고 입력")){
				return false;
			}
			
			//이메일 입력여부 검사
			if($("#user_email").val()==null || $("#user_email").val()==""){
				alert("이메일 입력바람");
				$("#user_email").focus();
				return false;
			}
			
			//이메일 유효성 검사
			if(!chk(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/, email, "유효하지 않은 이메일")){
				return false;
			}
			
			//생년월일 입력여부 검사
			if($("#user_birth").val()==null || $("#user_birth").val()==""){
				alert("생년월일 입력바람");
				$("#user_birth").focus();
				return false;
			}
		}
	</script>
	
    <!-- CSS -->
    <link href="css/signup.css" rel="stylesheet">
</head>
<body id="page-top">

   <!-- Header -->
   <jsp:include page="header.jsp"></jsp:include>
   
<header class="masthead">
    <section class="page-section">
      <div class="container text-center" style="width: 50%;" id="formContent">
            <div class="mt-2 mb-5">
              <h1 id="login_logo"><span style="color: #0f4c81;">R</span>egister <span style="color: #0f4c81;">N</span>ew <span style="color: #0f4c81;">A</span>ccount</h1>
            </div>
            <hr>
              <form class="form text-center signup-form" action="UserServlet.do?command=signup" method="post" onsubmit="return validate()">
              <input type="hidden" name="command" value="insertuser">
              <input type="hidden" name="user_grade" value="사용자"/>
                <div class="form-group row">
                  <label for="user_id" class="col-sm-2 col-form-label">아이디</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" id="user_id" title="N" required="required" placeholder="사용할 아이디를 입력해 주세요" name="user_id">
                  </div>
                  <div class="form-check idChk col-sm-1">
                    <input class="form-check-input" type="checkbox" value="idChk" id="idChk" name="idChk" onclick="idChk();">
                    <label class="form-check-label form-label2" for="idChk" >아이디 확인</label>
                  </div>
                  <small id="idHelpInline" class="text-muted" style="margin: 0px auto;">
                  	아이디를 확인해 주세요
                  </small>
                </div>

                <div class="form-group row">
                  <label for="user_pw" class="col-sm-2 col-form-label">비밀번호</label>
                  <div class="col-sm-8">
                    <input type="password" class="form-control" id="user_pw" name="user_pw" 
                    placeholder="사용할 비밀번호를 입력해 주세요" aria-describedby="passwordHelpInline">
                  </div>                 
                </div>
                
                <div class="form-group row">
                  <label for="user_pw_check" class="col-sm-2 col-form-label">비밀번호 확인</label>
                  <div class="col-sm-8">
                    <input type="password" class="form-control" id="user_pw_chk" 
                    placeholder="사용할 비밀번호가 맞는지 확인해 주세요" aria-describedby="passwordHelpInline">
                  </div>
                  <div class="form-check pwChk col-sm-1">
                    <label id="pwChkText" class="form-check-label form-label2" for="pwChk">
                    	비밀번호 확인
                    </label>
                  </div>
                </div>

                <div class="form-group row">
                  <label for="user_name" class="col-sm-2 col-form-label">이름</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" id="user_name" placeholder="이름을 입력해 주세요" name="user_name">
                  </div>
                </div>

                <div class="form-group row">
                  <label for="user_phone" class="col-sm-2 col-form-label">휴대폰 번호</label>
                  <div class="col-sm-8">
                    <input type="tel" class="form-control" id="user_phone" placeholder="휴대폰 번호를 입력해 주세요" name="user_phone">
                  </div>
                </div>
                
                <div class="form-group row">
                  <label for="user_gender" class="col-sm-2 col-form-label">성별</label>
                  <div class="col-sm-8  gender_div">
                    <input type="radio" id="user_gender" name="user_gender" value="남" checked="checked"/>&nbsp;&nbsp;남
                    &nbsp;&nbsp;&nbsp;
                    <input type="radio" id="user_gender" name="user_gender" value="여"/>&nbsp;&nbsp;여 
                  </div>
                </div>
                    
                <div class="form-group row">
                  <label for="user_email" class="col-sm-2 col-form-label">이메일</label>
                  <div class="col-sm-8">
                    <input type="text" class="form-control" id="user_email" name="user_email" placeholder="사용하고 계신 이메일을 입력해 주세요">
                  </div>
                </div>
                
                <div class="form-group row">
                  <label for="user_birth" class="col-sm-2 col-form-label">생일</label>
                  <div class="col-sm-8">
                    <input type="date" class="form-control" id="user_birth" name="user_birth">
                  </div>
                </div>

                <input type="submit" class="btn" value="가입하기">
              </form>
        <div id="formFooter">
        </div>
      </div>
      
    </section>
</header>
  <!-- Footer -->
  <jsp:include page="footer.jsp"></jsp:include>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
    <!-- Custom scripts for this template -->
    <script src="js/agency.js"></script>

</body>
</html>