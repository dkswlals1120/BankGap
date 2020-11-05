package com.api.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.api.dto.ApiDao;
import com.api.dto.ApiDto;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet("/apicontroller.do")
public class ApiController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ApiController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("command = "+command);
		
		ApiDao dao = new ApiDao();
//	if(command.equals("second_db")){
//		response.sendRedirect("marketdbsave.jsp");
//		System.out.println("asdasd");
//	}else if(command.equals("second")) {
//		System.out.println("1234");
//			int res = dao.delete();//db에 있는 정보 삭제 먼저
//			if(res>0) {
//				System.out.println("삭제 성공");
//			}else {
//				System.out.println("삭제 실패");
//			}
//			
//			String obj = request.getParameter("obj");
//			
//			JsonParser parser = new JsonParser();
//			
//			JsonElement element = parser.parse(obj);
//			
//			List<ApiDto> dtos = new ArrayList<ApiDto>();
//			
//			for(int i=0;i<element.getAsJsonObject().get("DATA").getAsJsonArray().size();i++) {
//				JsonObject tmp = element.getAsJsonObject().get("DATA").getAsJsonArray().get(i).getAsJsonObject();
//				
//				JsonElement m_name_gu = tmp.get("m_name");
//				JsonElement m_code_gu = tmp.get("m_code");
//				JsonElement guname_gu = tmp.get("guname");
//				JsonElement m_addr_gu = tmp.get("m_addr");
//				JsonElement lng_gu = tmp.get("lng");
//				JsonElement lat_gu = tmp.get("lat");
//				
//				String m_name = m_name_gu.getAsString();
//				String m_code = m_code_gu.getAsString();
//				String guname = guname_gu.getAsString();
//				String m_addr = m_addr_gu.getAsString();
//				double lng = lng_gu.getAsDouble();
//				double lat = lat_gu.getAsDouble();
//				
//				ApiDto dto = new ApiDto();
//				dto.setM_name(m_name);
//				dto.setM_code(m_code);
//				dto.setGuname(guname);
//				dto.setM_addr(m_addr);
//				dto.setLng(lng);
//				dto.setLat(lat);
//				
//				dtos.add(dto);
//			}
//			int result = dao.insert(dtos);//dao에 담아주고
//			if(result>0) {
//				System.out.println("insert 성공\n");
//			}else {
//				System.out.println("insert 실패\n");
//			}
//			
//			PrintWriter out = response.getWriter();
//			out.println(result);
//
//		}
		if(command.equals("searchlist")) {
			String search = request.getParameter("search");
			
			List<ApiDto> dto =  dao.selectAll(search);
			request.setAttribute("dto",dto );
			dispatch("searchlist.jsp",request,response);
			
		}
//		else if(command.equals("mapping")) {
//			String mname = request.getParameter("mname");
//			response.sendRedirect("map.jsp");	
//		}
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
