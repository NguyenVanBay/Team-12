package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

@WebServlet(name = "ListUsers", urlPatterns = {"listUers"})
@MultipartConfig
public class ListUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<User> allUser = new UserDAO().getAll();
//		
//		request.setAttribute("users", allUser);
//		RequestDispatcher rd = getServletContext().getRequestDispatcher("admin/listUsers.jsp");
//        rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
