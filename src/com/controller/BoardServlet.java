package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import com.dao.BoardDao;
import com.dao.CommentDao;
import com.dao.MyPageDao;
import com.dto.UserDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.model.service.BoardService;

import com.dto.BoardDto;
import com.dto.CommentDto;
import com.dto.MyPageDto;

@WebServlet("/BoardServlet.do")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService boardService = new BoardService();
       
    public BoardServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command=request.getParameter("command");
		System.out.println(command);
		
		HttpSession session = request.getSession();
		MyPageDao mypage = new MyPageDao();
		BoardDao dao = new BoardDao();
		CommentDao commdao = new CommentDao();

		if(command.equals("tipboard")) {
			//1.파라미터핸들링
			final int numPerPage = 5;//한페이지당 수
			int cPage = 1;//요청페이지
			try{
				cPage = Integer.parseInt(request.getParameter("cPage"));
			} catch(NumberFormatException e){
			
			}
			//2.업무로직
//			List<Board> list = boardService.selectBoardList();
			List<BoardDto> list = boardService.selectBoardList(cPage, numPerPage);
			System.out.println("list@servlet="+list);
			
			final int totalBoardCount = new BoardService().selectBoardCount();
			final int totalPage = (int)Math.ceil((double)totalBoardCount/numPerPage);
			
			String pageBar = "";	
			final int pageBarSize = 5;
			int pageStart = ((cPage - 1)/pageBarSize) * pageBarSize +1;
			int pageEnd = pageStart+pageBarSize-1;
			int pageNo = pageStart;
			System.out.println("pageNo: "+pageNo);
			//[이전] section
			if(pageNo == 1 ){
				pageBar += "<span>[이전]</span>"; 
			}
			else {
				pageBar += "<a href='BoardServlet?command=tipboard&cPage="+(pageNo-1)+"'>[이전]</a> ";
			}
				
			// pageNo section
			while(!(pageNo>pageEnd || pageNo > totalPage)){
				
				if(cPage == pageNo ){
					pageBar += "<span class='cPage'>"+pageNo+"</span> ";
				} 
				else {
					pageBar += "<a href='BoardServlet.do?command=tipboard&cPage="+pageNo+"'>"+pageNo+"</a> ";
				}
				pageNo++;
			}
			
			//[다음] section
			if(pageNo > totalPage){
				pageBar += "<span>[다음]</span>";
			} else {
				pageBar += "<a href='BoardServlet?command=tipboard&cPage="+pageNo+"'>[다음]</a>";
			}

			//3.뷰모델 처리
			request.setAttribute("selectlist", list);
			request.setAttribute("pageBar", pageBar);
			dispatch("tip_board.jsp", request, response);
			
		}else if(command.equals("proboard")) {
			//1.파라미터핸들링
			final int numPerPage = 5;//한페이지당 수
			int cPage = 1;//요청페이지
			try{
				cPage = Integer.parseInt(request.getParameter("cPage"));
			} catch(NumberFormatException e){
			
			}
			//2.업무로직
//			List<Board> list = boardService.selectBoardList();
			List<BoardDto> list = boardService.selectBoardListE(cPage, numPerPage);
			System.out.println("list@servlet="+list);
			
			final int totalBoardCount = new BoardService().selectBoardCountE();
			final int totalPage = (int)Math.ceil((double)totalBoardCount/numPerPage);
			
			String pageBar = "";	
			final int pageBarSize = 5;
			int pageStart = ((cPage - 1)/pageBarSize) * pageBarSize +1;
			int pageEnd = pageStart+pageBarSize-1;
			int pageNo = pageStart;
			System.out.println("pageNo: "+pageNo);
			//[이전] section
			if(pageNo == 1 ){
				pageBar += "<span>[이전]</span>"; 
			}
			else {
				pageBar += "<a href='BoardServlet?command=proboard&cPage="+(pageNo-1)+"'>[이전]</a> ";
			}
				
			// pageNo section
			while(!(pageNo>pageEnd || pageNo > totalPage)){
				
				if(cPage == pageNo ){
					pageBar += "<span class='cPage'>"+pageNo+"</span> ";
				} 
				else {
					pageBar += "<a href='BoardServlet.do?command=proboard&cPage="+pageNo+"'>"+pageNo+"</a> ";
				}
				pageNo++;
			}
			
			//[다음] section
			if(pageNo > totalPage){
				pageBar += "<span>[다음]</span>";
			} else {
				pageBar += "<a href='BoardServlet?command=proboard&cPage="+pageNo+"'>[다음]</a>";
			}

			//3.뷰모델 처리
			request.setAttribute("prolist", list);
			request.setAttribute("pageBar", pageBar);			
			dispatch("proEval.jsp", request, response);
		
    	}else if(command.equals("tipdetail")) {
    		int seq = Integer.parseInt(request.getParameter("seq"));
			
			BoardDto boarddto = dao.selectOne(seq);
			
			List<CommentDto> commlist = commdao.commAll(seq);
			
			int cnt = commdao.commCount(seq); //댓글 갯수 가져오기
			
			CommentDto commdto = new CommentDto();
			
			int view = dao.updateView(seq);
			
			request.setAttribute("commCnt", cnt);
			request.setAttribute("boarddto", boarddto);
			request.setAttribute("comm", commlist);
			dispatch("tip_detail.jsp", request, response);
			
		}else if(command.equals("prodetail")) {
			
			int userno = ((UserDto)session.getAttribute("logindto")).getUser_no();
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			BoardDto boarddto = dao.selectOne(seq);
			
			List<CommentDto> commlist = commdao.commAll(seq);
			
			int cnt = commdao.commCount(seq); //댓글 갯수 가져오기
			
			CommentDto commdto = new CommentDto();
			
			int view = dao.updateView(seq);
			
			List<MyPageDto> list = mypage.selectAll(userno);
			
			request.setAttribute("list", list);
			request.setAttribute("commCnt", cnt);
			request.setAttribute("boarddto", boarddto);
			request.setAttribute("comm", commlist);
			dispatch("prodetail.jsp", request, response);
		
       }else if(command.equals("commDelete")) {
			int commno = Integer.parseInt(request.getParameter("commno"));
			int seq = Integer.parseInt(request.getParameter("seq"));
			String type = request.getParameter("type");
			
			
			int res = commdao.commDelete(commno);
			
			if(res > 0 && type.equals("T")) {
				jsResponse("삭제되었습니다.", "BoardServlet.do?command=tipdetail&seq="+seq, response);
			
			}
			else if(res > 0 && type.equals("F")) {
				jsResponse("삭제되었습니다.", "forumController.do?command=forumdetail&seq="+seq, response);
			
			}
			else if(res > 0 && type.equals("E")) {
				jsResponse("삭제되었습니다.", "BoardServlet.do?command=prodetail&seq="+seq, response);
			
			}else {
				jsResponse("삭제실패.", "BoardServlet.do?command=prodetail&seq="+seq, response);
			}
		
		}else if(command.equals("commUpdate")) {
			int commno = Integer.parseInt(request.getParameter("commno"));
			String commcontent = request.getParameter("comm_content");
			
			CommentDto commUpdate = new CommentDto(commno, commcontent);
			
			int res = commdao.commUpate(commUpdate);
			
			System.out.println(res);
			
			if(res > 0) {
				jsResponse2("수정완료!", response);
			}
			
			request.setAttribute("res", res);
			dispatch("commUpdateForm.jsp", request, response);
			
		}else if(command.equals("commUpdateForm")) {
			int commno = Integer.parseInt(request.getParameter("commno"));
			
			CommentDto commOne = commdao.commOne(commno);
			
			
			request.setAttribute("commone", commOne);
			dispatch("commUpdateForm.jsp", request, response);
		
		}else if(command.equals("commInsert")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			int userno = Integer.parseInt(request.getParameter("userno"));
			String userid = request.getParameter("userid");
			String text = request.getParameter("commText");
			String boardtype = request.getParameter("boardtype");
			
			
			System.out.println(boardtype);
			
			CommentDto comm = new CommentDto(userid,text,userno,boardno);
			
			int res = commdao.commInsert(comm);
			
			if(res > 0 && boardtype.equals("T")) {  // 팁 게시판 댓글 
				response.sendRedirect("BoardServlet.do?command=tipdetail&seq="+boardno);
			
			}else if(res > 0 && boardtype.equals("F")) { //자유 게시판 댓글
				response.sendRedirect("forumController.do?command=forumdetail&seq="+boardno);
			
			}else if(res > 0 && boardtype.equals("E")) { //전문가 게시판 댓글
				response.sendRedirect("BoardServlet.do?command=prodetail&seq="+boardno);
			}
		
		}else if(command.equals("writeBoard")) {
			UserDto user = (UserDto)session.getAttribute("user");
			int maxSize = 1024 * 1024 * 10;
	    	String root = request.getSession().getServletContext().getRealPath("/");
	    	System.out.println(root);
			String savePath = root+"board";
			File isDir = new File(savePath);
			
			if(!isDir.isDirectory()) {
				System.out.println("디렉토리 생성");
				isDir.mkdir();
			}
			
	    	MultipartRequest mrequest = new MultipartRequest(request, savePath,maxSize, "UTF-8",new DefaultFileRenamePolicy());
			
	    	if(!ServletFileUpload.isMultipartContent(request)) {
				System.out.println("enctype 속성 사용 안됨");
			
			}else {
				System.out.println("속성 사용");
			}
			
			
			System.out.println(savePath);
			
			String originFileName = mrequest.getFilesystemName("file");
			
			if(originFileName != null) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))+"."+ originFileName.substring(originFileName.lastIndexOf(".")+1);
				
				File originFile = new File(savePath + "/" + originFileName);
				File renameFile = new File(savePath + "/" + renameFileName);
				
				if(!originFile.renameTo(renameFile)) {
					int read = -1;
					byte[] buf = new byte[1024];
					
					FileInputStream fin = new FileInputStream(originFile);
					FileOutputStream fout = new FileOutputStream(renameFile);
					
					while ((read = fin.read(buf, 0, buf.length)) != -1){
						fout.write(buf, 0, read);
					}
					fin.close();
					fout.close();
					originFile.delete();
				}
				
				String writer = mrequest.getParameter("writer");
				String menuid = mrequest.getParameter("menuid");
				String title = mrequest.getParameter("title");
				String content = mrequest.getParameter("content");
				int userno = Integer.parseInt(mrequest.getParameter("userno"));
				
				BoardDto insert = new BoardDto(writer,title,content,menuid,userno,originFileName,renameFileName);
				
				if(menuid.equals("T")) {
					int res = dao.boardInsert(insert);
					
					if(res > 0) {
						jsResponse("글이 작성 되었습니다.", "BoardServlet.do?command=tipboard", response);
					}else {
						jsResponse("글 작성 실패..", "BoardServlet.do?command=tipboard", response);
					}
				}
				
			}else {
				String writer = mrequest.getParameter("writer");
				String menuid = mrequest.getParameter("menuid");
				String title = mrequest.getParameter("title");
				String content = mrequest.getParameter("content");
				int userno = Integer.parseInt(mrequest.getParameter("userno"));
				
				BoardDto insert = new BoardDto(writer,title,content,menuid,userno,null,null);
				
				if(menuid.equals("T")) {
					int res = dao.boardInsert(insert);
					
					if(res > 0) {
						jsResponse("글이 작성 되었습니다.", "BoardServlet.do?command=tipboard", response);
					}else {
						jsResponse("글 작성 실패..", "BoardServlet.do?command=tipboard", response);
					}
					
				}else if(menuid.equals("F")) {
					int res =  dao.boardInsert(insert);
					
					if(res>0) {
						jsResponse("자유게시글 작성 성공!", "forumController.do?command=forumlist", response);
					}else {
						jsResponse("자유게시글 작성 실패..", "forumController.do?command=forumlist", response);
					}
					
				}else if(menuid.equals("E")) {
					int res =  dao.boardInsert(insert);
					
					if(res>0) {
						jsResponse("전문가평가 게시글 작성 성공!", "BoardServlet.do?command=proboard", response);
					}else {
						jsResponse("전문가평가 게시글 작성 실패..", "BoardServlet.do?command=proboard", response);
					}
				}
				
			}
			
		}else if(command.equals("writeBoardGo")) {
			dispatch("writeBoard.jsp", request, response);
		
		}else if(command.equals("proWrite")) {
			String writer = request.getParameter("userid");
			int userno = Integer.parseInt(request.getParameter("userno"));
			String title = writer + " 님 지출내역 입니다.";
			String content = " ";
			String menuid = "E";
			
			BoardDto insert = new BoardDto(writer,title,content,menuid,userno,null,null);
			
			
			int res = dao.boardInsert(insert);
			
			if(res > 0) {
				jsResponse("글이 작성 되었습니다.", "BoardServlet.do?command=proboard", response);
		}else {
			jsResponse("글 작성 실패..", "BoardServlet.do?command=proboard", response);
			
		}
	}
		
		else if(command.equals("boardDelete")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			int userNo = Integer.parseInt(request.getParameter("userNo"));
			String type = request.getParameter("type");
			
			System.out.println("userNo: "+userNo);
			BoardDto deleteDto = new BoardDto();
			deleteDto.setSeq(seq);
			deleteDto.setUserno(userNo);
			
			System.out.println(type);
			
			int res = dao.boardDelete(deleteDto);
			
			
			if(res>0 && type.equals("T")) {
				jsResponse("게시글 삭제 성공.", "BoardServlet.do?command=tipboard", response);
			
			}
			else if(res>0 && type.equals("E")) {
				jsResponse("게시글 삭제 성공.", "BoardServlet.do?command=proboard", response);
			
			}
			else if(res>0 && type.equals("F")) {
				jsResponse("게시글 삭제 성공.", "forumController.do?command=forumlist", response);
			
			}else {
				jsResponse("게시글 삭제 실패.", "forumController.do?command=forumdetail&seq="+seq, response);
			}
			
		//수정 페이지
		}else if(command.equals("boardUpdateForm")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			BoardDto dto = dao.selectOne(seq);
			
			request.setAttribute("boardUpdto", dto);
			dispatch("boardUpdateForm.jsp", request, response);
			
		//수정 완료 동작
		}else if(command.equals("boardUpdate")) {
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			String title =request.getParameter("title");
			String content = request.getParameter("content");
			int userNo = Integer.parseInt(request.getParameter("userNo"));
			
			BoardDto updateDto = new BoardDto(boardNo, userNo, title, content); 
			int res = dao.boardUpdate(updateDto);
			
			if(res>0) {
				jsResponse("게시글 수정 완료!", "BoardServlet.do?command=tipdetail&seq="+boardNo, response);
			}else {
				jsResponse("게시글 수정 실패!", "BoardServlet.do?command=tipdetail&seq="+boardNo, response);
			}	
		}
	}
    
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html); charset=UTF-8");
		doGet(request, response);
	
	}
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s ="<script type='text/javascript'>"
				+ "alert('"+msg+"');"+
				"location.href='"+url+"';"+
				"</script>";
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
	private void jsResponse2(String msg, HttpServletResponse response) throws IOException {
		String s ="<script type='text/javascript'>" 
				+ "alert('"+msg+"');"+
				"</script>";
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(s);
	}

}
