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

public class ListCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ListCategory() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Category> allCategory = new CategoryDAO().getAll();
		
		request.setAttribute("categorys", allCategory);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/danh-sach-the-loai");
        rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
