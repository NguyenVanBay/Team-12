package home;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
import tool.MD5;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/dang-nhap-dang-ki")
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

		// get utf-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// get all category.
		ArrayList<Product> allProduct = null;
		allProduct = new ProductDAO().getAll();
		request.setAttribute("products", allProduct);

		// get all product.
		ArrayList<Category> allCategory = new CategoryDAO().getAll();
		request.setAttribute("categorys", allCategory);

		// redirec page.
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @throws IOException
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// get ufl-8
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		ServletContext context = getServletContext();

		// get param.
		String type = request.getParameter("type");
		String url = context.getInitParameter("contextPath");
		String email, password;

		switch (type) {

		case "login":

			// get paramerter.
			email = request.getParameter("email");
			password = request.getParameter("password");
			password = MD5.encryption(password);

			// login false.
			if (new UserDAO().loginUser(email, password) == null) {
				response.sendRedirect(url + "dang-nhap-dang-ki?error=login");
				return;
			} else {

				User u = new UserDAO().loginUser(email, password);
				session.setAttribute("emailUser", email);
				session.setAttribute("passwordUser", password);
				session.setAttribute("userNameUser", u.getName());
				session.setAttribute("idUser", u.getId());

				// nếu từ trang có tạo oldUrl. chuyển sang trang đó.
				String oldUrl = (String) session.getAttribute("url");
				if (oldUrl != null) {
					session.removeAttribute("oldUrl");
					response.sendRedirect(oldUrl);

					return;
				}

				response.sendRedirect(url);
			}
			break;

		case "register":

			// get param.
			email = request.getParameter("email");
			password = request.getParameter("password");
			String name = request.getParameter("name");
			String repass = request.getParameter("repassword");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");

			// check pass and repass chuyển sang trang đăng kí thông báo lỗi.
			if (!password.equals(repass)) {
				response.sendRedirect(url + "dang-nhap-dang-ki?error=register");
				return;
			}

			// check email nếu đã có thì chuyển trang đăng kí thông báo lỗi.
			if (new UserDAO().checkEmail(email)) {
				response.sendRedirect(url + "dang-nhap-dang-ki?error=register&email=exists");
				return;
			}

			User u = new User();

			// md5 pass trước ki đăng kí
			password = MD5.encryption(password);
			u.setName(name);
			u.setPhone(phone);
			u.setEmail(email);
			u.setAddress(address);
			u.setPassword(password);
			u.setRole((long) 0);
			u.setCreateBy((long) -1);

			if (new UserDAO().insertUser(u)) {
				response.sendRedirect(url + "dang-nhap-dang-ki?success=register");
			} else {
				response.sendRedirect(url + "dang-nhap-dang-ki?error=register");
			}

			break;
		case "logout":
			// xóa tất sesion của người dùng.
			session.removeAttribute("emailUser");
			session.removeAttribute("passwordUser");
			session.removeAttribute("userNameUser");
			session.removeAttribute("idUser");
			response.sendRedirect(url + "dang-nhap-dang-ki");
			return;
		default:
			response.sendRedirect(url);
			break;
		}
	}

}
