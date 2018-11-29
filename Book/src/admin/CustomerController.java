package admin;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CustomerController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String action = request.getParameter("action");

		// danh sach
		if (action.equals("list")) {
			
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				String roleAdmin = (String) session.getAttribute("role");

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYNHANVIEN)) {
					
					ArrayList<User> allUser = new UserDAO().getAllCustomer();

					String name = (request.getParameter("name") == null || request.getParameter("name") == "") ? ""
							: request.getParameter("name");
					String email = (request.getParameter("email") == null || request.getParameter("email") == "") ? ""
							: request.getParameter("email");
					String phone = (request.getParameter("phone") == null || request.getParameter("phone") == "") ? ""
							: request.getParameter("phone");

					if (name != "" || email != "" || phone != "") {
						allUser = new UserDAO().getWhereCustomer(name, email, phone);
					} else {
						allUser = new UserDAO().getAllCustomer();
					}

					request.setAttribute("users", allUser);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/listCustomer.jsp");
					rd.forward(request, response);

				} else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
					rd.forward(request, response);
				}
			}
			
		} else if (action.equals("add")) {
		} else if (action.equals("edit")) {
		} else if (action.equals("delete")) {
			
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				String roleAdmin = (String) session.getAttribute("role");

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYNHANVIEN)) {

					Long id = Long.parseLong(request.getParameter("id"));
					String type = (request.getParameter("type") == null) ? "" : request.getParameter("type");
					
					// delete khách hàng.
					if(type.equals("customer")) {
						System.out.println(id);
						try {
							new UserDAO().deleteById(id);
							response.sendRedirect("/Book/admin/customer?action=list");
						} catch (SQLException e) {
							response.sendRedirect("/Book/admin/customer?action=list&error=delete");
						}
						
					} else {

						Long idLogin = Long.parseLong(session.getAttribute("idAdmin") + "");

						User u = new UserDAO().getUserById(id);
						
						if (u.getCreateBy().equals(idLogin)) {
							try {
								new UserDAO().deleteById(id);
								response.sendRedirect("/Book/admin/user?action=list");
							} catch(Exception e) {
								response.sendRedirect("/Book/admin/user?action=list&error=delete");
							}
						} else {
							response.sendRedirect("/Book/admin/user?action=list&error=delete");
						}
					}

				} else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
					rd.forward(request, response);
				}
			}		
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
