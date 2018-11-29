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
import model.Bill;
import model.User;

public class BillController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BillController() {
		super();
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

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYKHO)) {

					ArrayList<Bill> bills = new  ArrayList<>();

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
//				String idCategory = (request.getParameter("idCategory") == null || request.getParameter("idCategory") == "") ? "-1" : request.getParameter("idCategory");

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
		} else if (action.equals("add")) {
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {
				
				Long id = Long.parseLong(request.getParameter("id"));
				
				Bill bill = new BillDAO().getBillById(id);
				
				request.setAttribute("bill", bill);

				RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/createBill.jsp");
				rd.forward(request, response);
			}
		} else if (action.equals("detail")) {
		
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				String roleAdmin = (String) session.getAttribute("role");

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYKHO)) {

					Long id = Long.parseLong(request.getParameter("id"));

					Bill bill = new BillDAO().getBillById(id);

					request.setAttribute("bill", bill);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/chi-tiet-don-hang");
					rd.forward(request, response);

				} else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
					rd.forward(request, response);
				}

			}
		} else if(action.equals("edit")) {
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

					response.sendRedirect("/Book/admin/bill?action=list");

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
