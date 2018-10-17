//package controller;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import dao.UserDAO;
//import model.User;
//
//@WebServlet(name = "EditUser", urlPatterns = { "/editUser" })
//@MultipartConfig
//public class EditUser extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	public EditUser() {
//		// TODO Auto-generated constructor stub
//	}
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
////		request.setCharacterEncoding("UTF-8");
////		response.setCharacterEncoding("UTF-8");
////		response.setContentType("text/html;charset=utf-8");
////
////		Long userID = Long.parseLong(request.getParameter("id"));
////
////		User u = new User();
////		u.setId(userID);
////		u.setAddress(request.getParameter("address"));
////		u.setEmail(request.getParameter("email"));
////		u.setName(request.getParameter("name"));
////		u.setPassword(request.getParameter("password"));
////		u.setPhone(request.getParameter("phone"));
////		
////		new UserDAO().editUser(u);
////		
////		response.sendRedirect("/Book/admin/listUsers.jsp");
//
//	}
//
//	@Override
//	protected void doPut(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
////		request.setCharacterEncoding("UTF-8");
////		response.setCharacterEncoding("UTF-8");
////		response.setContentType("text/html;charset=utf-8");
////
////		User u = new User();
////		u.setAddress(request.getParameter("address"));
////		u.setEmail(request.getParameter("email"));
////		u.setName(request.getParameter("name"));
////		u.setPassword(request.getParameter("password"));
////		u.setPhone(request.getParameter("phone"));
////
////		new UserDAO().insertUser(u);
////
////		response.sendRedirect("/Book/admin/listUsers.jsp");
//	}
//}
