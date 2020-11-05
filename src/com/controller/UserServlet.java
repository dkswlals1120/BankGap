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
import com.dao.ProMyPageDao;
import com.dao.UserDao;
import com.dto.MyPageDto;
import com.dto.ProMyPageDto;
import com.dto.UserDto;
import com.dto.sum_dto;

@WebServlet("/UserServlet.do")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String command = request.getParameter("command");
		System.out.println("command= "+command);
		UserDao userdao = new UserDao();
		MyPageDao dao = new MyPageDao();
		ProMyPageDao pdao = new ProMyPageDao();
		HttpSession session = request.getSession(false);
		
		if(command.equals("login")) {
			String id = request.getParameter("login_id");
			String pw = request.getParameter("login_pw");
			
			System.out.println("id :"+id+"pw : "+pw);
			
			UserDto dto = userdao.login(id, pw);
			
			if(dto.getUser_id() != null) {
				session = request.getSession();
				session.setAttribute("logindto",dto);
				session.setMaxInactiveInterval(-1);
				
				dispatch("index.jsp",request,response);
						
				}else {
					jsResponse("로그인 실패","index.jsp",response);
				}
			
		}else if(command.equals("logout")) {
			session = request.getSession();
			session.invalidate();
			jsResponse("로그아웃 완료", "index.jsp", response);
			
		//회원가입
		}else if(command.equals("signup")) {	
			String user_id = request.getParameter("user_id");
			String user_pw = request.getParameter("user_pw");
			String user_name = request.getParameter("user_name");
			String user_gender = request.getParameter("user_gender");
			String user_birth = request.getParameter("user_birth");
			String user_phone = request.getParameter("user_phone");
			String user_email = request.getParameter("user_email");
			String user_grade = request.getParameter("user_grade");
			
			System.out.println("user_gender: "+user_gender);
			
			UserDto udto = new UserDto();
			udto.setUser_id(user_id);
			udto.setUser_pw(user_pw);
			udto.setUser_name(user_name);
			udto.setUser_gender(user_gender);
			udto.setUser_birth(user_birth);
			udto.setUser_phone(user_phone);
			udto.setUser_email(user_email);
			udto.setUser_grade(user_grade);
			
			int res = userdao.signup(udto);
			
			PrintWriter out = response.getWriter();
			if(res>0) {
				//자바에서 jsp사용하기

				out.println("<script>alert('회원가입 성공'); location.href='index.jsp';</script>");
				out.flush();
				
				//response.sendRedirect("UserServlet.do?command=index.jsp");
				System.out.println("회원가입 성공");
			}else {				
				out.println("<script>alert('회원가입 실패'); location.href='index.jsp';</script>");
				out.flush();
				System.out.println("실패");	
			}
			
		//회원가입시 id check
		}else if(command.equals("idChk")) {
			String user_id = request.getParameter("user_id");
			
			boolean idnotused = userdao.idChk(user_id);
			
			response.sendRedirect("idChk.jsp?idnotused="+idnotused);
			
		//등급별 mypage
		}else if(command.equals("mypage")) {
			if((UserDto)request.getSession().getAttribute("logindto")==null) {
				jsResponse("로그인 해주세요.", "index.jsp", response);
			}
			
			String user_grade = ((UserDto)request.getSession().getAttribute("logindto")).getUser_grade();
			//String user_grade = request.getParameter("user_grade");
			if(user_grade.equals("관리자")) {
				dispatch("adminpage.jsp",request,response);
			}else if(user_grade.equals("전문가")) {
				session = request.getSession();
				int user_no = ((UserDto) session.getAttribute("logindto")).getUser_no();
				List<ProMyPageDto> list = pdao.selectAll(user_no); 
				request.setAttribute("list", list);
				
				dispatch("expertpage.jsp", request, response);
			}else if(user_grade.equals("사용자")) {
				session = request.getSession();
				int user_no = ((UserDto)session.getAttribute("logindto")).getUser_no();
				
				// 사용자일때만 MyPageDto에서 해당 데이터 출력
				List<MyPageDto> list = dao.selectAll(user_no);
				request.setAttribute("list", list);
				
				sum_dto tr = dao.traffic(user_no);
				sum_dto ct = dao.cultural(user_no);
				sum_dto fd = dao.food(user_no);
				sum_dto ut = dao.utility(user_no);
				sum_dto ps = dao.pleasure(user_no);
				request.setAttribute("tr", tr);
				request.setAttribute("ct", ct);
				request.setAttribute("fd", fd);
				request.setAttribute("ut", ut);
				request.setAttribute("ps", ps);
				
				dispatch("userpage.jsp", request, response);
			}
			
		//내정보 보기
		}else if(command.equals("myinfo")) {
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			
			UserDto dto = userdao.selectOne(user_no);
			request.setAttribute("myinfodto", dto);
			dispatch("myinfo.jsp",request,response);
			
		//관리자 등급일때 모든 회원정보 보기
		}else if(command.equals("selectall")) {
			List<UserDto> dto = userdao.selectAll();
			
			request.setAttribute("selectalldto", dto);
			dispatch("selectall.jsp",request, response);
			
		//관리자 등급일때 회원정보 변경화면
		}else if(command.equals("enabledch")) {
			List<UserDto> dto = userdao.selectAll();
			
			request.setAttribute("enabledchdto", dto);
			
			dispatch("enabledch.jsp", request, response);
			
		//회원정보 변경 popup창
		}else if(command.equals("enabledchform")) {
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			String user_grade = request.getParameter("user_grade");
			
			int res = userdao.updateRole(user_no, user_grade);
			
			if(res>0) {				
				popupResponse("등급 변경 성공","UserServlet.do?command=enabledch",response);
			}else {
				jsResponse("등급 변경 실패","enabledch.jsp",response);
			}
			
		//회원정보 변경 popup창을 뛰우는 컨트롤러
		}else if(command.equals("selectonech")) {
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			
			UserDto dto = userdao.selectOne(user_no);
			request.setAttribute("onechdto", dto);
			dispatch("enabledchform.jsp",request, response);
			
		//내정보 수정하기페이지 이동
		}else if(command.equals("updatemyinfo")) {
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			
			UserDto dto = userdao.selectOne(user_no);
			request.setAttribute("upmyinfodto", dto);
			dispatch("infoupdate.jsp",request, response);
			
		//내정보 수정하기 동작
		}else if(command.equals("myinfoupdate")) {
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			String user_pw = request.getParameter("user_pw");			
			String user_email = request.getParameter("user_email");
			String user_phone = request.getParameter("user_phone");
			
				
				UserDto dto = new UserDto();
				dto.setUser_no(user_no);
				dto.setUser_pw(user_pw);
				dto.setUser_email(user_email);
				dto.setUser_phone(user_phone);
			
				int res = userdao.myinfoupdate(dto);
				
				System.out.println("setUser_pw: "+dto.getUser_pw());
				
				if(res>0) {
					jsResponse("수정 성공","UserServlet.do?command=myinfo&user_no="+user_no,response);
				}else {
					jsResponse("수정 실패","UserServlet.do?command=updatemyinfo&user_no="+user_no,response);
				}
				
		//회원탈퇴
		}else if(command.equals("secession")) {
			int user_no = Integer.parseInt(request.getParameter("user_no"));
			
			UserDto dto = new UserDto();
			dto.setUser_no(user_no);
			dto.setUser_enabled("N"); // enabled가 N이면 탈퇴처리.
			
			int res = userdao.secession(dto);
			
			if(res>0) {
				jsResponse("회원 탈퇴 성공", "index.jsp", response);
			} else {
				jsResponse("회원 탈퇴 실패", "UserServlet.do?command=secession&user_no="+user_no, response);
			}
			
		}else if(command.equals("proInfo")) {//이해가 안가는부분
			int user_no = ((UserDto) session.getAttribute("dto")).getUser_no();
			ProMyPageDao ProUserPageDao = new ProMyPageDao();
			
			List<ProMyPageDto> res = ProUserPageDao.selectAll(user_no);
			
			System.out.println(res);
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