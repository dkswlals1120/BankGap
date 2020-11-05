<!-- 회원 등급 페이지 팝업창 형식 -->
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
<script type="text/javascript">
	function button(){
		self.close();
	}//취소누르면 close

</script>
</head>
<body>
	<h4 style="text-align:center; font-weight:bold; font-size:20px;">정보 수정</h4>
	<form action="UserServlet.do" method="post">
	<input type="hidden" name="command" value="enabledchform">
	<input type="hidden" name="user_no" value="${onechdto.user_no }">
	<table border="2">
		<tr>
			<th width="110px" height="30px">유저번호</th>
			<td width="110px"  >${onechdto.user_no }</td>
		</tr>
		<tr>
			<th height="30px">현재 등급</th>
			<td>${onechdto.user_grade }</td>
		</tr>
		<tr>
			<td height="30px">
				&nbsp;&nbsp;
				<select name="user_grade">
							
	  						<option value="관리자">관리자</option>
	  						<option value="사용자">사용자</option>
	  						<option value="전문가">전문가</option>
	  			</select>
	  			</td>
	  			<td>
	  			&nbsp;
	  			<input type="submit" value="변경">
	  			<input type="button" value="취소" onclick="button();">
	  			</td>	  		
		</tr>
	</table>
	</form>
	
</body>
</html>