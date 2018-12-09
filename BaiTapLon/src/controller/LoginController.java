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
import tool.MD5;

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

		// get param.
		String type = request.getParameter("type");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		HttpSession session = request.getSession();

		switch (type) {
		case "login":
			User u = new UserDAO().login(email, password);
			if (u.getC_email() == null) {
				response.sendRedirect("/BaiTapLon/admin/Login");
			} else {

				u = new UserDAO().login(email, password);
				session.setAttribute("idAdmin", u.getPk_user_id());
				session.setAttribute("email", email);
				response.sendRedirect("/BaiTapLon/admin/dashboard");
			}
			return;
		default:
			session.removeAttribute("idAdmin");
			session.removeAttribute("email");
			session.removeAttribute("password");
			session.removeAttribute("userName");
			session.removeAttribute("role");
			response.sendRedirect("/BaiTapLon/admin/Login");
		}
		return;
	}
}
