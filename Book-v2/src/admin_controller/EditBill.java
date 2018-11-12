package admin_controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BillDAO;
import dao.UserDAO;
import model.Bill;
import model.User;

public class EditBill extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditBill() {
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

			if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYKHO)) {

				Long id = Long.parseLong(request.getParameter("id"));
				Long status = Long.parseLong(request.getParameter("status"));

				Bill b = new BillDAO().getBillById(id);
				b.setStatus(status);

				new BillDAO().editBill(b);

				response.sendRedirect("/Book/admin/listBill");

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
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");

			if (checkUser(email, password, id) == 1) {
				User u = new User();
				u.setId(Long.parseLong(id));
				u.setAddress(address);
				u.setEmail(email);
				u.setName(name);
				u.setPassword(password);
				u.setPhone(phone);

				new UserDAO().editUser(u);
			}

			response.sendRedirect("/Book/admin/listUser");

		}
	}

	private int checkUser(String email, String password, String id) {

		return 1;

	}

}
