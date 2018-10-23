package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/admin/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @throws IOException
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String type = request.getParameter("type");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(type.equals("login")) {
			User u = new UserDAO().login(email, password);
			if (u.equals(null)) {
				response.sendRedirect("/Book/admin/Login");
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			session.setAttribute("password", password);
			session.setAttribute("userName", u.getName());
			
			response.sendRedirect("/Book/admin/dasboard");
		} else {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("/Book/admin/Login");
		}
		
	}

}
