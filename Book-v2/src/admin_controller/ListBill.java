package admin_controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BillDAO;
import dao.ProductDAO;
import model.Bill;
import model.User;

public class ListBill extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListBill() {
		super();
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

				ArrayList<Bill> bills = new BillDAO().getAll();

				String name = (request.getParameter("name") == null || request.getParameter("name") == "") ? ""
						: request.getParameter("name");
				String address = (request.getParameter("address") == null || request.getParameter("address") == "") ? ""
						: request.getParameter("address");
				String phone = (request.getParameter("phone") == null || request.getParameter("phone") == "") ? ""
						: request.getParameter("phone");
				String sumFrom = (request.getParameter("sumFrom") == null || request.getParameter("sumFrom") == "") ? ""
						: request.getParameter("sumFrom");
				String sumTo = (request.getParameter("sumTo") == null || request.getParameter("sumTo") == "") ? ""
						: request.getParameter("sumTo");
//			String idCategory = (request.getParameter("idCategory") == null || request.getParameter("idCategory") == "") ? "-1" : request.getParameter("idCategory");

				if (name != "" || address != "" || phone != "" || sumFrom != "" || sumTo != "") {
					bills = new BillDAO().getWhere(name, address, phone, sumFrom, sumTo);
				} else {
					bills = new BillDAO().getAll();
				}

				request.setAttribute("bills", bills);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/danh-sach-don-hang");
				rd.forward(request, response);

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
