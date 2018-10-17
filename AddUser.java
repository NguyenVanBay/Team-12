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
//@WebServlet(name = "AddUser", urlPatterns = {"addUser"})
//@MultipartConfig
//public class AddUser extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//    public AddUser() {
//        // TODO Auto-generated constructor stub
//    }
//
////	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////		// TODO Auto-generated method stub
////		response.getWriter().append("Served at: ").append(request.getContextPath());
////	}
////
////	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////		
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
////	}
//}
