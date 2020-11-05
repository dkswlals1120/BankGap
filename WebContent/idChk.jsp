<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

<script type="text/javascript">
	onload=function(){
		var id = opener.document.getElementsByName("user_id")[0].value;
		
		document.getElementsByName("id")[0].value=id;
	}
	function confirm(bool){
		if(bool =="true"){
			opener.document.getElementsByName("user_pw")[0].focus();
			opener.document.getElementsByName("user_id")[0].title="Y";
		}else{
			opener.document.getElementsByName("user_id")[0].focus();
			opener.document.getElementsByName("user_id")[0].title="N";
		}
		
		self.close();
	}
</script>

	<link href="css/idChk.css" rel="stylesheet">
	
</head>
<body>
<%
	String idnotused = request.getParameter("idnotused");
%>
	<table class="table_ch">
		<tr>
			<td><input type="text" name="id" readonly="readonly"></td>
		</tr>
		<tr class="table_bottom">
			<td><%=idnotused.equals("true")?"아이디 생성 가능":"중복 아이디 존재" %></td>
		</tr>
		<tr>
			<td>
				<input type="button" value="확인" onclick="confirm('<%=idnotused %>');" class="btn">
			</td>
		</tr>
	</table>
</body>
</html>