package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.BoardDao;
import com.dao.CommentDao;
import com.dto.BoardDto;
import com.dto.CommentDto;
import com.forum.dao.forumDao;

import com.dto.UserDto;

@WebServlet("/forumController.do")
public class ForumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ForumServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		forumDao dao = new forumDao();
		CommentDao commdao = new CommentDao();
		BoardDao bdao = new BoardDao();
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		if(command.equals("forumlist")) {
			List<BoardDto> list = dao.selectAll();
			
			request.setAttribute("forumlist", list);
			dispatch("forum.jsp",request,response);
			
		} else if(command.equals("forumdetail")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			BoardDto boarddto = dao.selectOne(seq);
			
			List<CommentDto> commlist = commdao.commAll(seq);
			
			int cnt = commdao.commCount(seq); //댓글 개수 가져오기
			
			CommentDto commdto = new CommentDto();
			
			int view = bdao.updateView(seq);
			
			request.setAttribute("commCnt", cnt);
			request.setAttribute("boarddto", boarddto);
			request.setAttribute("comm", commlist);
			
			dispatch("forum_detail.jsp",request,response);
			
		} else if(command.equals("writeform")) {
			response.sendRedirect("writeBoard.jsp");
			
		} else if(command.equals("boardwrite")) {
			String writer=((UserDto)session.getAttribute("logindto")).getUser_name();
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			String type = request.getParameter("menuid");
			int userno = ((UserDto)session.getAttribute("logindto")).getUser_no();
			
			BoardDto dto = new BoardDto(writer,title,content,type,userno);
			int res = dao.insert(dto);
			if(res>0) {
				jsResponse("글 작성 성공", "forumController.do?command=forumlist", response);
			}else {
				dispatch("forumController.do?command=writeform",request,response);
			}
		} else if(command.equals("delete")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			BoardDto dto = dao.delete(seq);
			
			dispatch("forumController.do?command=forumlist",request,response);
		} else if(command.equals("updateform")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			BoardDto dto = dao.selectOne(seq);
			request.setAttribute("dto", dto);
			dispatch("forumUpdate.jsp", request, response);
		} else if(command.equals("boardupdate")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			BoardDto dto = new BoardDto();
			dto.setSeq(seq);
			dto.setTitle(title);
			dto.setContent(content);
			
			int res = dao.update(dto);
			System.out.println(seq+"번째 게시글 수정 성공");
			if(res>0) {
				dispatch("forumController.do?command=forumdetail&seq="+seq ,request,response);
			} else {
				dispatch("forumController.do?command=updateform",request,response);
			}
		}
	} 

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		
		dispatch.forward(request, response);
		
	}
	
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"+
					"alert('"+msg+"');"+
					"location.href='"+url+"';"
					+"</script>";
		PrintWriter out = response.getWriter();
		out.print(s);
	}

}
