package home_controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BillDAO;
import dao.CategoryDAO;
import model.Bill;
import model.Category;

@WebServlet("/admin/createBill")
public class CreateBill extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CreateBill() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

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
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		if (null == session.getAttribute("email")) {
			// User is not logged in.
			response.sendRedirect("/Book/admin/Login");
		} else {

			request.setCharacterEncoding("UTF-8");
			String name = request.getParameter("name");
			
			System.out.println(name);
			
			Category c = new Category();
		
			c.setName(name);
			c.setCreateBy(Long.parseLong(session.getAttribute("idAdmin").toString()));

			new CategoryDAO().insertCategory(c);

			response.sendRedirect("/Book/admin/listCategory");
		}
	}
}
