package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

public class ListUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ListUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<User> allUser = new UserDAO().getAll();
		
		request.setAttribute("users", allUser);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/danh-sach-nguoi-dung");
        rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
