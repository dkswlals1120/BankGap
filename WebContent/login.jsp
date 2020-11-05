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

    <!-- CSS -->
    <link href="css/login.css" rel="stylesheet">
</head>
<body id="page-top">

  <!-- Header(nav)태그 -->
  <jsp:include page="header.jsp"></jsp:include>

<header class="masthead" >
  <section class="page-section">
    <div class="container text-center">
 
      <div class="wrapper">
        <div id="formContent">
          <div class="mt-2">
            <h1 id="login_logo">Login</h1>
          </div>
          <hr>
          <!-- Login Form -->
          <form action="UserServlet.do?command=login" method="post">          	
            <input type="text" id="login"  name="login_id" placeholder="Your ID">
            <input type="password" id="password" name="login_pw" placeholder="Your Password">
            <input type="submit" value="Log In">
          </form>
          
          <!-- Remind Passowrd -->
          <div id="formFooter">
            Don't have account? <a href="signup.jsp">Sign up here</a>
            <small class="form-text text-muted">or</small>
            <a class="text-muted" href="#">Forgot Password?</a>
          </div>
      
        </div>
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