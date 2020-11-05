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

import com.dao.MyPageDao;
import com.dto.UserDto;
import com.dto.MyPageDto;
import com.dto.sum_dto;

@WebServlet("/MyPageController.do")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyPageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String command = request.getParameter("command");
		System.out.println("MyPageServlet Command= "+command);
		
		HttpSession session = request.getSession();
		
		MyPageDao dao = new MyPageDao();
		
		UserDto userdto = new UserDto();
		sum_dto sd = new sum_dto();
		
		if(command.equals("selectAll")) {
			
			int user_no = ((UserDto)session.getAttribute("dto")).getUser_no();
			
			List<MyPageDto> list = dao.selectAll(user_no);
			System.out.println(list);
			request.setAttribute("list", list);
			dispatch("mypage.jsp",request,response);
			
		}else if(command.equals("selectOne")) {
			int userno = Integer.parseInt(request.getParameter("userno"));
			
			int user_no = ((UserDto)session.getAttribute("logindto")).getUser_no();
			String user_id = ((UserDto)session.getAttribute("logindto")).getUser_id();
			
			List<MyPageDto> list = dao.selectAll(userno);
			request.setAttribute("user_no", user_no);
			request.setAttribute("user_id", user_id);
			request.setAttribute("list", list);
			dispatch("proWrite.jsp", request, response);
			
		}else if(command.equals("insert")) {
			System.out.println(request.getParameter("amount"));
			System.out.println(request.getParameter("category"));
			System.out.println(request.getParameter("place"));
			System.out.println(request.getParameter("usedate"));
			int user_no = ((UserDto)session.getAttribute("logindto")).getUser_no();
			//int payno = Integer.parseInt(request.getParameter("payno"));
			String category = request.getParameter("category");
			String place = request.getParameter("place");
			int amount = Integer.parseInt(request.getParameter("amount"));
			String usedate = request.getParameter("usedate"); 
			
			MyPageDto dto = new MyPageDto(user_no, category, place, amount, usedate);
			int res = dao.insert(dto);
			
			if(res>0) {
				jsResponse("지출 내역 등록 성공", "UserServlet.do?command=mypage", response);
			}else {
				jsResponse("지출 내역 등록 실패", "UserServlet.do?command=mypage", response);
			}
			
		} else if(command.equals("delete")) {
			//int user_no = ((UserDto)session.getAttribute("dto")).getUser_no();
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			int payno = Integer.parseInt(request.getParameter("payno"));
			
			System.out.println(payno);
			MyPageDao del = dao.delete(user_no,payno); // 만약에 delete가 실패할수도 있으니까  ~ if문으로 대비하는게 좋지 않을까~~~~
			int up = dao.update(user_no,payno);
			
			if(up>0) {
				jsResponse("지출내역 삭제에 성공하였습니다.", "UserServlet.do?command=mypage", response);
			//dispatch("UserServlet.do?command=mypage",request,response);
			}else if(up==0) {
				jsResponse("지출내역 삭제 성공", "UserServlet.do?command=mypage", response);
			} else {
				jsResponse("지출내역 삭제 실패", "UserServlet.do?command=mypage", response);
			}
			
		} else if(command.equals("graph")) {
			System.out.println( command + "로 이동" );
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			System.out.println(user_no);
			
			sum_dto tr = dao.traffic(user_no);
			sum_dto ct = dao.cultural(user_no);
			sum_dto fd = dao.food(user_no);
			sum_dto ut = dao.utility(user_no);
			sum_dto ps = dao.pleasure(user_no);
//			List<MyPageDto> tr = dao.traffic(user_no);
//			List<MyPageDto> ct = dao.cultural(user_no);
//			List<MyPageDto> fd = dao.food(user_no);
//			List<MyPageDto> ut = dao.utility(user_no);
//			List<MyPageDto> ls = dao.leisure(user_no);
			
			
			System.out.println(tr.getSum_amount());
			System.out.println(ct.getSum_amount());
			System.out.println(fd.getSum_amount());
			System.out.println(ut.getSum_amount());
			System.out.println(ps.getSum_amount());
			
			request.setAttribute("tr", tr);
			request.setAttribute("ct", ct);
			request.setAttribute("fd", fd);
			request.setAttribute("ut", ut);
			request.setAttribute("ps", ps);
			request.setAttribute("user_no", user_no);
			
			
			
			if(ut.getSum_amount()>0) {
				jsResponse("공과금 가져오기 성공", "UserServlet.do?command=mypage", response);
			} else {
				jsResponse("공과금 가져오기 실패", "UserServlet.do?command=mypage", response);
			}
			
			if(tr.getSum_amount()>0) {
				jsResponse("교통비 가져오기 성공", "UserServlet.do?command=mypage", response);
			} else {
				jsResponse("교통비 가져오기 실패", "UserServlet.do?command=mypage", response);
			}
			
			if(ct.getSum_amount()>0) {
				jsResponse("문화생활비 가져오기 성공", "UserServlet.do?command=mypage", response);
			} else {
				jsResponse("문화생활비 가져오기 실패", "UserServlet.do?command=mypage", response);
			}
			if(fd.getSum_amount()>0) {
				jsResponse("식비 가져오기 성공", "UserServlet.do?command=mypage", response);
			} else {
				jsResponse("식비 가져오기 실패", "UserServlet.do?command=mypage", response);
			}
			if(ps.getSum_amount()>0) {
				jsResponse("유흥비 가져오기 성공", "UserServlet.do?command=mypage", response);
			} else {
				jsResponse("유흥비 가져오기 실패", "UserServlet.do?command=mypage", response);
			}
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	private void jsResponse(String msg , String url , HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"+
						"alert('"+msg+"');"+
						"location.href='"+url+"';"+
					"</script>";
		
		PrintWriter out = response.getWriter();
		out.print(s);
	}
	
	private void popupResponse(String msg , String url , HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>"+
						"window.close();"+	
						"alert('"+msg+"');"+
						"location.href='"+url+"';"+
						"window.opener.location.reload();"+
					"</script>";
		
		PrintWriter out = response.getWriter();
		out.print(s);
	}
}