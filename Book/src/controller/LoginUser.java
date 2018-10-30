package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategoryDAO;
import dao.ProductDAO;
import dao.UserDAO;
import model.Category;
import model.Product;
import model.User;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/dang-nhap-dang-ki")
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// get all category.
		ArrayList<Product> allProduct = new ProductDAO().getAll();
		request.setAttribute("products", allProduct);

		// get all product.
		ArrayList<Category> allCategory = new CategoryDAO().getAll();
		request.setAttribute("categorys", allCategory);

		RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @throws IOException
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String type = request.getParameter("type");
		HttpSession session = request.getSession();

		if (type.equals("login")) {

			
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			if (new UserDAO().loginUser(email, password) == null) {
				response.sendRedirect("/Book/dang-nhap-dang-ki");

			} else {

				User u = new UserDAO().loginUser(email, password);
				
				session.setAttribute("emailUser", email);
				session.setAttribute("passwordUser", password);
				session.setAttribute("userNameUser", u.getName());
				session.setAttribute("idUser", u.getId());

				
				
				response.sendRedirect("/Book/home");
			}

		} else if (type.equals("register")) {

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			String repass = request.getParameter("repassword");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			
			if(!pass.equals(repass)) {
				response.sendRedirect("/Book/dang-nhap-dang-ki");
			} else {
				
				User u = new User();
				u.setName(name);
				u.setPhone(phone);
				u.setEmail(email);
				u.setAddress(address);
				u.setPassword(pass);
				u.setRole((long) 0);
			
				new UserDAO().insertUser(u);
				response.sendRedirect("/Book/dang-nhap-dang-ki");
			}
			

		} else {
			session.removeAttribute( "emailUser" );
			session.removeAttribute( "passwordUser" );
			session.removeAttribute( "userNameUser" );
			response.sendRedirect("/Book/dang-nhap-dang-ki");
		}

	}

}
