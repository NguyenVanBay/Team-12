package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.NewDAO;
import model.New;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class NewController extends HttpServlet {
	public static final String UPLOAD_DIRECTORY = "C:\\Java\\worspace\\BaiTapLon\\WebContent\\admin\\upload\\";
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		
		String action = (String) request.getParameter("action");
		RequestDispatcher rd;
		String id;
		switch (action) {
		case "list":
			ArrayList<New> news = new NewDAO().getAll();
			request.setAttribute("news", news);
			rd = getServletContext().getRequestDispatcher("/admin/listNew.jsp");
			rd.forward(request, response);
			break;

		case "edit":
			id = request.getParameter("id");
			New oldtin = new NewDAO().getNewById(Long.parseLong(id));
			request.setAttribute("oldtin", oldtin);
			rd = getServletContext().getRequestDispatcher("/admin/editNew.jsp");
			rd.forward(request, response);
			break;
			
		case "add":
			rd = getServletContext().getRequestDispatcher("/admin/addNew.jsp");
			rd.forward(request, response);
			break;

		case "delete":
			id = request.getParameter("id");
			try {
				new NewDAO().deleteById(Long.parseLong(id));
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.sendRedirect("/BaiTapLon/admin/new?action=list");
			break;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = (String) request.getParameter("action");
		
		String nameImg = "image" + new Date().getTime();
		
		long hot = (request.getParameter("hot") != null) ? 1 : 0;
		long latest = (request.getParameter("latest") != null) ? 1 : 0;
		
		switch (action) {
		
		case "add":
			
			nameImg = "image" + new Date().getTime()  + ".png";;
			New newtin = new New();
			newtin.setC_name(request.getParameter("name"));
			newtin.setFk_category_news_id(Long.parseLong(request.getParameter("category")));
			newtin.setC_description(request.getParameter("description"));
			newtin.setC_content(request.getParameter("content"));
			newtin.setC_img(nameImg);
			newtin.setC_hotnews(hot);
			newtin.setC_latestnews(latest);
			
			
			new NewDAO().insertNew(newtin);
			
			Part part = request.getPart("img");
			String savePath = NewController.UPLOAD_DIRECTORY + File.separator + nameImg;
			part.write(savePath + File.separator);
			
			response.sendRedirect("/BaiTapLon/admin/new?action=list");
			break;

		case "edit":
			nameImg = "image" + new Date().getTime() + ".png";
			New oldNew = new NewDAO().getNewById(Long.parseLong(request.getParameter("id")));
			oldNew.setC_name(request.getParameter("name"));
			oldNew.setFk_category_news_id(Long.parseLong(request.getParameter("category")));
			oldNew.setC_description(request.getParameter("description"));
			oldNew.setC_content(request.getParameter("content"));
			oldNew.setC_img(nameImg);
			oldNew.setC_hotnews(hot);
			oldNew.setC_latestnews(latest);
			
			new NewDAO().editNew(oldNew);
			
			Part part1 = request.getPart("img");
			String savePath1 = NewController.UPLOAD_DIRECTORY + File.separator + nameImg;
			part1.write(savePath1 + File.separator);
			response.sendRedirect("/BaiTapLon/admin/new?action=list");
			break;
		}
	}

}
