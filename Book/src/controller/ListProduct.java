package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import model.Product;

public class ListProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ListProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Product> allProduct = new ProductDAO().getAll();
		
		request.setAttribute("products", allProduct);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/danh-sach-san-pham");
        rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
