package controller;

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

import dao.CategoryDAO;
import dao.ProductDAO;
import model.Category;
import model.Image;
import model.Product;

public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Long id = Long.parseLong(request.getParameter("id"));
		
		ArrayList<Category> listCategory = new CategoryDAO().getAll();
		request.setAttribute("categorys", listCategory);
		
		Product product = new ProductDAO().getProductById(id);
		request.setAttribute("product", product);
		
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/sua-san-pham");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("name");
		String idCategory = request.getParameter("idCategory");
		String author = request.getParameter("author");
		String publicAt = request.getParameter("publicAt");
		String count = request.getParameter("count");
		String price = request.getParameter("price");
	
		long milliseconds = 0;
		SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
		try {
		    Date d = f.parse(publicAt);
		    milliseconds = d.getTime();
		} catch (Exception e) {
		    e.printStackTrace();
		}

		System.out.println(userName);
		System.out.println(idCategory);
		System.out.println(author);
		System.out.println(publicAt);
		System.out.println(count);
		System.out.println(price);
		
		Product p = new Product();
		p.setName(userName);
		p.setPrice(Double.parseDouble(price));
		p.setAuthor(author);
		p.setCategory(new Category(Long.parseLong(idCategory)));
		p.setCount(Long.parseLong(count));
		p.setPublicAt(new Timestamp(milliseconds));
		
		String nameImg = "image" + new Date().getTime();
		
		Image thumbnail = new Image();
		thumbnail.setName(nameImg + "1.png");
		thumbnail.setType((long)1);
		
		p.setThumbnail(thumbnail);
		
		ArrayList<Image> listImg = new ArrayList<>();
		
		Image img1 = new Image();
		img1.setName(nameImg + "2.png");
		img1.setType((long)2);
		
		Image img2 = new Image();
		img2.setName(nameImg + "3.png");
		img2.setType((long)2);
		
		Image img3 = new Image();
		img3.setName(nameImg + "4.png");
		img3.setType((long)2);
		
		listImg.add(img1);
		listImg.add(img2);
		listImg.add(img3);
		
		p.setListImage(listImg);
		
		System.out.println(p.toString());
		
		new ProductDAO().insertProduct(p);

		response.sendRedirect("/Book/admin/listCategory");

	}
}
