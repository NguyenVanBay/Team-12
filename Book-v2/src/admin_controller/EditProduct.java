package admin_controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategoryDAO;
import dao.ProductDAO;
import model.Category;
import model.Product;
import model.User;

public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditProduct() {
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

			if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYTHELOAI)) {

				Long id = Long.parseLong(request.getParameter("id"));

				ArrayList<Category> listCategory = new CategoryDAO().getAll();
				request.setAttribute("categorys", listCategory);

				Product product = new ProductDAO().getProductById(id);
				request.setAttribute("product", product);

				RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/sua-san-pham");
				rd.forward(request, response);

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
			String userName = request.getParameter("name");
			String idCategory = request.getParameter("idCategory");
			String author = request.getParameter("author");
			String publicAt = request.getParameter("publicAt");
			String count = request.getParameter("count");
			String price = request.getParameter("price");
			String title = request.getParameter("title");
			String description = request.getParameter("description");
			String type = request.getParameter("type");
			String url = request.getParameter("url");

			if (userName.equals("") || idCategory.equals("") || author.equals("") || publicAt.equals("")
					|| count.equals("") || price.equals("") || title.equals("") || description.equals("")
					|| type.equals("") || url.equals("")) {
				response.sendRedirect("/Book/admin/editProduct?id=" + id + "&error=edit");
				return;
			}

			long milliseconds = 0;
			SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
			try {
				Date d = f.parse(publicAt);
				milliseconds = d.getTime();
			} catch (Exception e) {
				System.out.println("chưa nhập ngày");
			}

			Product product = new ProductDAO().getProductById(Long.parseLong(id));

			product.setName(userName);
			product.setCategory(new Category(Long.parseLong(idCategory)));
			product.setAuthor(author);
			product.setCount(Long.parseLong(count));
			product.setPrice(Double.parseDouble(price));
			product.setPublicAt(new Timestamp(milliseconds));
			product.setTitle(title);
			product.setDescription(description);
			product.setType(type);
			product.setUrl(url);

			new ProductDAO().editProduct(product);

			response.sendRedirect("/Book/admin/listProduct");
		}
	}
}
