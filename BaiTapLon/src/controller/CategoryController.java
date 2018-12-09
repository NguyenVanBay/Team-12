package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import model.Category;

public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoryController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		String action = (String) request.getParameter("action");
		RequestDispatcher rd;
		String id;
		switch (action) {
		case "list":
			ArrayList<Category> categorys = new CategoryDAO().getAll();
			request.setAttribute("categorys", categorys);
			rd = getServletContext().getRequestDispatcher("/admin/listCategory.jsp");
			rd.forward(request, response);
			break;

		case "edit":
			id = request.getParameter("id");
			Category category = new CategoryDAO().getCategoryById(Long.parseLong(id));
			request.setAttribute("category", category);
			rd = getServletContext().getRequestDispatcher("/admin/editCategory.jsp");
			rd.forward(request, response);
			break;
			
		case "add":
			rd = getServletContext().getRequestDispatcher("/admin/addCategory.jsp");
			rd.forward(request, response);
			break;

		case "delete":
			id = request.getParameter("id");
			try {
				new CategoryDAO().deleteById(Long.parseLong(id));
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("/BaiTapLon/admin/category?action=list");
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = (String) request.getParameter("action");
		RequestDispatcher rd;
		String id;
		switch (action) {

		case "add":
			Category newcategory = new Category();
			newcategory.setC_name(request.getParameter("c_name"));
			new CategoryDAO().insertCategory(newcategory);
			response.sendRedirect("/BaiTapLon/admin/category?action=list");
			break;

		case "edit":
			
			Category category = new CategoryDAO().getCategoryById(Long.parseLong(request.getParameter("id")));
			category.setC_name(request.getParameter("c_name"));
			new CategoryDAO().editCategory(category);
			System.out.println(category.getC_name());
			System.out.println(category.getPk_category_news_id());
			response.sendRedirect("/BaiTapLon/admin/category?action=list");
			break;
		}
	}

}
