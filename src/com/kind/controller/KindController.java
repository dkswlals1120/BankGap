package com.kind.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kind.model.KindDao;
import com.kind.model.KindDto;

@WebServlet("/kindcontroller.do")
public class KindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KindController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		KindDao dao = new KindDao();
		
		if(command.equals("searchlist")) {
	         String search = request.getParameter("search");
	         System.out.println("search: " + search);
	         List<KindDto> dto = dao.selectAll(search);
	         System.out.println(dto);
	         request.setAttribute("dto", dto);
	         dispatch("kindform.jsp",request,response);
	         
	      }else if(command.equals("kindone")) {
	         String sh_id = request.getParameter("sh_id");
	         
	         KindDto dto = dao.selectOne(sh_id);
	         request.setAttribute("dto", dto);
	         System.out.println(dto);

	         dispatch("kindone.jsp",request,response);
	         
	      }else if(command.equals("kindboardform")) {
	         String sh_id = request.getParameter("sh_id");
	         
	         KindDto dto = dao.selectOne(sh_id);
	         request.setAttribute("dto", dto);

	         dispatch("kindmap.jsp",request,response);   
	      }
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

