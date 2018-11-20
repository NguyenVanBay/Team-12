package admin_controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategoryDAO;
import model.Category;
import model.User;

public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CategoryController() {
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

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYTHELOAI)) {

					ArrayList<Category> allCategory = new CategoryDAO().getAll();
					String name = (request.getParameter("name") == null || request.getParameter("name") == "") ? ""
							: request.getParameter("name");

					if (name != "") {
						allCategory = new CategoryDAO().getWhere(name);
					} else {
						allCategory = new CategoryDAO().getAll();
					}

					if ("delete".equals(request.getParameter("error"))) {
						request.setAttribute("error", "Xóa không thành công");
					}
					
					if ("delete".equals(request.getParameter("success"))) {
						request.setAttribute("success", "Xóa thành công");
					}

					System.out.println(request.getParameter("success"));
					// add
					if ("add".equals(request.getParameter("success"))) {
						request.setAttribute("success", "Thêm thành công");
					}

					// edit
					if ("edit".equals(request.getParameter("success"))) {
						request.setAttribute("success", "Sửa thành công");
					}
					
					if(request.getParameter("error") == null) {
						request.setAttribute("error", "");
					}
					
					if(request.getParameter("success") == null) {
						request.setAttribute("success", "");
					}

					request.setAttribute("categorys", allCategory);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/danh-sach-the-loai");
					rd.forward(request, response);

				} else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
					rd.forward(request, response);
				}
			}

//			form them
		} else if (action.equals("add")) {

			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				String roleAdmin = (String) session.getAttribute("role");

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYTHELOAI)) {

					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/them-the-loai");
					rd.forward(request, response);

				} else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
					rd.forward(request, response);
				}
			}

			// form sua
		} else if (action.equals("edit")) {

			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				String roleAdmin = (String) session.getAttribute("role");

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYTHELOAI)) {

					request.setCharacterEncoding("UTF-8");

					Long id = Long.parseLong(request.getParameter("id"));

					Category category = new CategoryDAO().getCategoryById(id);

					request.setAttribute("category", category);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/sua-the-loai");
					rd.forward(request, response);

				} else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
					rd.forward(request, response);
				}
			}

			// xóa thể loại.
		} else if (action.equals("delete")) {

			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				String roleAdmin = (String) session.getAttribute("role");

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYTHELOAI)) {

					Long id = Long.parseLong(request.getParameter("id"));
					try {
						new CategoryDAO().deleteById(id);
						response.sendRedirect("/Book/admin/category?action=list&success=delete");
						return;
					} catch (Exception e) {
						response.sendRedirect("/Book/admin/category?action=list&error=delete");
						return;
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

		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String action = request.getParameter("action");

		if (action.equals("list")) {

			// them the loai.
		} else if (action.equals("add")) {

			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				request.setCharacterEncoding("UTF-8");
				String name = request.getParameter("name");
				String url = request.getParameter("url");

				if (name.equals("") || url.equals("")) {
					response.sendRedirect("/Book/admin/category?action=list&error=add?error=add");
					return;
				}

				Category c = new Category();

				c.setName(name);
				c.setUrl(url);
				c.setCreateBy(Long.parseLong(session.getAttribute("idAdmin").toString()));

				new CategoryDAO().insertCategory(c);

				response.sendRedirect("/Book/admin/category?action=list&success=add");
			}

			// sua the loai
		} else if (action.equals("edit")) {

			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				request.setCharacterEncoding("UTF-8");

				String id = request.getParameter("id");

				String name = request.getParameter("name");
				String url = request.getParameter("url");

				if (name.equals("") || url.equals("")) {
					response.sendRedirect("/Book/admin/category?action=edit&id=" + id + "&error=edit");
					return;
				}

				Category c = new Category();
				c.setId(Long.parseLong(id));
				c.setName(name);
				c.setUrl(url);

				new CategoryDAO().editCategory(c);

				response.sendRedirect("/Book/admin/category?action=list&success=edit");

			}

			// xóa thể loại.
		} else if (action.equals("delete")) {

		}

	}
}
