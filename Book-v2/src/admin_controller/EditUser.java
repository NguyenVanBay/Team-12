package admin_controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditUser() {
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

				User user = new UserDAO().getUserById(id);

				System.out.println("create by : " + user.getCreateBy());
				System.out.println("id login : " + session.getAttribute("idAdmin"));

				// check điều kiện user đó là người tạo ra tài khoản này thì mới cho sửa.
				if (user.getCreateBy() == Long.parseLong(session.getAttribute("idAdmin") + "")) {

					request.setAttribute("user", user);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/sua-nguoi-dung");
					rd.forward(request, response);

				} else {
					response.sendRedirect("/Book/admin/listUser?error=edit");
				}

			} else {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
				rd.forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		if (null == session.getAttribute("email")) {
			// User is not logged in.
			response.sendRedirect("/Book/admin/Login");
		} else {
			request.setCharacterEncoding("UTF-8");

			String id = request.getParameter("id");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String role = request.getParameter("role");

			User userOld = new UserDAO().getUserById(Long.parseLong(id));

			if (!userOld.getEmail().equals(email)) {

				if (!new UserDAO().checkEmail(email)) {
					User u = userOld;
					u.setId(Long.parseLong(id));
					u.setAddress(address);
					u.setEmail(email);
					u.setName(name);
					u.setPhone(phone);
					u.setRole(Long.parseLong(role));

					new UserDAO().editUser(u);
					response.sendRedirect("/Book/admin/listUser?email=" + email);
				} else {
					response.sendRedirect("/Book/admin/editUser?id=" + id + "&error=edit&email=exists");
				}

			} else {

				User u = new User();
				u.setId(Long.parseLong(id));
				u.setAddress(address);
				u.setEmail(email);
				u.setName(name);
				u.setPhone(phone);
				u.setRole(Long.parseLong(role));
				new UserDAO().editUser(u);
				response.sendRedirect("/Book/admin/listUser?email=" + email);
			}
		}
	}
}
