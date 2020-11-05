<!-- 댓글 수정 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style type="text/css">
        #wrap {
            width: 550px;
            margin: 0 auto 0 auto;
            text-align :center;
        }
    
        #commentUpdateForm{
            text-align :center;
        }
    </style>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
	<script type="text/javascript">
	
		function checkValue(){
			
			if(opener != null){
				window.opener.document.location.reload();
				window.close();
			}
		}
		
		function checkFunc(){
			alert("ear");
			/*window.opener.document.location.reload();
			window.close();*/
		}
	</script>
</head>
<body>

<div id="wrap">
    <br>
    <b><font size="5" color="gray">댓글수정</font></b>
    <hr size="1" width="550">
    <br>
 
    <div id="commentUpdateForm"> 
    	<form action="BoardServlet.do" method="get">
    	  <input type="hidden" name = "command" value="commUpdate">
    	  <input type="hidden" name = "commno" value="${commone.comm_no }">
            <textarea rows="7" cols="70" name="comm_content" style="resize:none">${commone.comm_content}</textarea>
            <br><br>
            <input type="submit" value="수정" onclick="checkValue();">
            <input type="button" value="닫기" onclick="window.close()">
         </form>
    </div>
</div>   
 
</body>
</html>