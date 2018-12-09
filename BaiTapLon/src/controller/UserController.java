package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = (String) request.getParameter("action");
		RequestDispatcher rd;
		String id;
		switch (action) {
		case "list":
			ArrayList<User> users = new UserDAO().getAllUser();
			request.setAttribute("users", users);
			rd = getServletContext().getRequestDispatcher("/admin/listUser.jsp");
			rd.forward(request, response);
			break;

		case "edit":
			id = request.getParameter("id");
			User user = new UserDAO().getUserById(Long.parseLong(id));
			request.setAttribute("user", user);
			rd = getServletContext().getRequestDispatcher("/admin/editUser.jsp");
			rd.forward(request, response);
			break;
			
		case "add":
			rd = getServletContext().getRequestDispatcher("/admin/addUser.jsp");
			rd.forward(request, response);
			break;

		case "delete":
			id = request.getParameter("id");
			try {
				new UserDAO().deleteById(Long.parseLong(id));
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("/BaiTapLon/admin/user?action=list");
			break;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = (String) request.getParameter("action");
		switch (action) {

		case "add":
			
			if(request.getParameter("pass").equals(request.getParameter("repass"))) {
				User newuser = new User();
				newuser.setC_email(request.getParameter("email"));
				newuser.setC_fullname(request.getParameter("fullName"));
				newuser.setC_password(request.getParameter("pass"));
				new UserDAO().insertUser(newuser);
				response.sendRedirect("/BaiTapLon/admin/user?action=list");
			}	
			break;

		case "edit":
			
			User user = new UserDAO().getUserById(Long.parseLong(request.getParameter("id")));
			user.setC_email("email");
			user.setC_fullname("fullName");
			user.setC_password("pass");
			new UserDAO().editUser(user);
			response.sendRedirect("/BaiTapLon/admin/user?action=list");
			break;
		}
	}

}
