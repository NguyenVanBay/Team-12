package admin_controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

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
						response.sendRedirect("/Book/admin/listCustomer");
					} catch (SQLException e) {
						response.sendRedirect("/Book/admin/listCustomer?error=delete");
					}
					
				} else {

					Long idLogin = Long.parseLong(session.getAttribute("idAdmin") + "");

					User u = new UserDAO().getUserById(id);
					
					if (u.getCreateBy().equals(idLogin)) {
						try {
							new UserDAO().deleteById(id);
							response.sendRedirect("/Book/admin/listUser");
						} catch(Exception e) {
							response.sendRedirect("/Book/admin/listUser?error=delete");
						}
					} else {
						response.sendRedirect("/Book/admin/listUser?error=delete");
					}
				}

			} else {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
				rd.forward(request, response);
			}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
