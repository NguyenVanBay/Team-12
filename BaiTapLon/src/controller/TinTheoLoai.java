package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.NewDAO;
import model.Category;
import model.New;

/**
 * Servlet implementation class TinTheoLoai
 */
@WebServlet("/theloai")
public class TinTheoLoai extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TinTheoLoai() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		long id = Long.parseLong((String) request.getParameter("id"));
		
		request.setAttribute("theloai", new CategoryDAO().getCategoryById(id).getC_name());
		
		ArrayList<New> tintheoloai = new NewDAO().getNewByCategoryId(id);
		request.setAttribute("tintheoloai", tintheoloai);
		
		ArrayList<New> news = new NewDAO().getAll();
		request.setAttribute("news", news);
		
		ArrayList<Category> categorys = new CategoryDAO().getAll();
		request.setAttribute("categorys", categorys);
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/tintheoloai.jsp");
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
