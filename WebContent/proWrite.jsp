<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Semi-Project</title>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    <link href="css/mypage.css" rel="stylesheet">
    
    <!-- JQuery-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$("select option[value='E']").attr("selected", true);
	
	})
	
	
	function idChk(){
			var doc = document.getElementsByName("id")[0];
			if(doc.value.trim()=="" || doc.value==null){
				alert("아이디를 입력해 주세요.");
			}else{
				
			}
		}
		
		function chkBoardType(){
			var val = $("#baordCategory option:selected").val();
			
			if(val != -1){
				return true;
			}else{
				alert("게시판 카테고리를 선택해 주세요!!");
				return false;
			}
		}
		
		function contentChk(){
		
		}
		
		
		
		
	</script>
    <!-- CSS -->
    <link href="css/writeBoard.css" rel="stylesheet">
</head>
<body id="page-top">
<!-- Header(nav) -->
<jsp:include page="header.jsp"></jsp:include>

	<header class="mastheadWriteBoard">
		<section class="page-section">
			<div class="container text-center" id="formContent" style="width: 50%">
				<h4>게시판 작성</h4>
				<hr>
				<div style="margin-left: 10px;">
				<!--<form action="BoardServlet.do?command=writeBoard" method="post" onsubmit="return contentChk()" enctype="multipart/form-data" id="form1">
				<input type="hidden" name="writer" value="${logindto.user_id }">
				<input type="hidden" name="userno" value="${logindto.user_no }"> -->
				<ul style="margin-bottom: -5px;">
					<li>
						<div class="li_div">
							<label class="item" for="boardCategory"><b>게시판</b></label>
							<select name="menuid" class="step01" id="baordCategory" onchange="">
								<option value="-1" disabled="disabled">게시판선택</option>
								<option value="E">전문가 피드백</option>
								<option value="T" disabled="disabled">Tip</option>
								<option value="F" disabled="disabled">자유 게시판</option>
							</select>
						</div>
					</li>
					
					
				</ul>
				
				<table>
					<tr>
						<td>
							<div style="margin-left: 13px; margin-top: 0" >
							<span class="family"><img src="https://cafe.pstatic.net/editor/btn_n_font.gif" alt="글꼴" width="47" height="21" title="글꼴" nhn:command="fontname" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;"></span> 
							<span class="size"><img src="https://cafe.pstatic.net/editor/btn_n_size.gif" alt="글자크기" width="47" height="21" title="글자크기" nhn:command="fontsize" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;"></span> 
							<span class="make01"><img src="https://cafe.pstatic.net/editor/btn_n_bold.gif" alt="굵게(Ctrl+B)" width="22" height="21" title="굵게(Ctrl+B)" nhn:command="bold" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_underline.gif" alt="밑줄(Ctrl+U)" width="21" height="21" title="밑줄(Ctrl+U)" nhn:command="underline" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_Italic.gif" alt="기울게(Ctrl+I)" width="21" height="21" title="기울게(Ctrl+I)" nhn:command="italic" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_strike2.gif" alt="취소선" width="21" height="21" title="취소선" nhn:command="strikethrough" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_color2.gif" alt="글자색상" width="21" height="21" title="글자색상" nhn:command="fontcolor" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_bgcolor.gif" alt="배경색상" width="21" height="21" title="배경색상" nhn:command="fontbackgroundcolor" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;"></span> 
							<span class="make02"><img src="https://cafe.pstatic.net/editor/btn_n_alignleft.gif" alt="왼쪽 정렬" width="22" height="21" title="왼쪽 정렬" nhn:command="justifyleft" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_aligncenter.gif" alt="중간 정렬" width="21" height="21" title="중간 정렬" nhn:command="justifycenter" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_alignright.gif" alt="오른쪽 정렬" width="21" height="21" title="오른쪽 정렬" nhn:command="justifyright" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_alignjustify.gif" alt="양쪽 정렬" width="21" height="21" title="양쪽 정렬" nhn:command="justifyfull" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_numberset.gif" width="20" height="21" alt="숫자목록" title="숫자목록" nhn:command="insertorderedlist" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_markset.gif" width="20" height="21" alt="기호목록" title="기호목록" nhn:command="insertunorderedlist" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_outdent.gif" width="21" height="21" alt="내어쓰기" title="내어쓰기" nhn:command="outdent" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_indent.gif" width="21" height="21" alt="들여쓰기" title="들여쓰기" nhn:command="indent" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;"></span> 
							<span class="make03"><img src="https://cafe.pstatic.net/editor/btn_n_quotation.gif" alt="인용구 설정/해제" width="21" height="21" title="인용구 설정/해제" nhn:command="quote" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_lineheight.gif" alt="줄간격" width="20" height="21" title="줄간격" nhn:command="lineheight" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;"></span> 
							<span class="make03"><img src="https://cafe.pstatic.net/editor/btn_n_url.gif" alt="링크" width="28" height="21" title="링크" nhn:command="hyperlink" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_emoticon.gif" width="20" height="21" alt="이모티콘" title="이모티콘" nhn:command="emoticoninsertion" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_table.gif" width="22" height="21" alt="표 삽입" title="표 삽입" nhn:command="inserttable" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_sign.gif" width="20" height="21" alt="특수기호 삽입" title="특수기호 삽입" nhn:command="scharinsertion" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							<img src="https://cafe.pstatic.net/editor/btn_n_enlarged.gif" width="19" height="21" alt="찾기/바꾸기" title="찾기/바꾸기" nhn:command="searchkeyword" nhn:argument="undefined" nhn:state="normal" style="cursor: pointer;">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="item" class="divVal" contenteditable="true" style="border: 1px solid black;">
			<table class="table2">
            <thead>
              <tr>
                  <th class="thN">번호</th>
                  <th class="thC">카테고리</th>
                  <th class="thT">사용처</th>
                  <th class="thCa">금액</th>
                  <th class="thD">날짜</th>
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
								
								<!-- <td><input type="submit" name="delete" value="삭제" onclick="location.href='MyPageController.do?command=delete&payno=${dto.payno}'"></td>-->
							</tr>
						</c:forEach>
					</c:otherwise>
            </c:choose>
            </tbody>
        </table>	
        		<br>
        		지출 내역을 피드백 합니다.
							</div>
							
						</td>
					</tr>
				</table>
				
				<input type="button" value="등록" class="btn" onclick="location.href='BoardServlet.do?command=proWrite&userid=${user_id}&userno=${user_no }'"/>
				<input type="button" value="취소" class="btn"/>				
			</form>
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
