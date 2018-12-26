package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.NewDAO;
import model.Category;
import model.New;

public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int page = 0;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			if (page < 0)
				page = 0;
		}
		
		ArrayList<New> news = new NewDAO().getAll(page);
		request.setAttribute("news", news);
		
		ArrayList<Category> categorys = new CategoryDAO().getAll();
		request.setAttribute("categorys", categorys);
		
		request.setAttribute("page", page);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
