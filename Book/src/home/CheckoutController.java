/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package home;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dao.BillDAO;
import dao.UserDAO;
import model.Bill;
import model.BillDetail;
import model.Cart;
import model.User;

/**
 *
 * @author NVB
 */

@WebServlet("/Checkout")
public class CheckoutController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final BillDAO billDAO = new BillDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		if (null == session.getAttribute("idUser")) {
			// User is not logged in.
			response.sendRedirect("/Book/dang-nhap-dang-ki");
		} else {
			
			User u = new UserDAO().getUserById(Long.parseLong("" + session.getAttribute("idUser")));
			request.setAttribute("user", u);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkout.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String customer = request.getParameter("customer");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");

		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");

		if (cart == null) {
			cart = new Cart();
		}

		try {

			Bill bill = new Bill();
			bill.setCustomer(customer);
			bill.setAddress(address);
			bill.setPhone(phone);
			bill.setStatus(0);
			bill.setSumMoney(0);
			bill.setCreateBy(Long.parseLong(session.getAttribute("idUser").toString()));
			bill.setCreateAt(new Timestamp(new Date().getTime()));
			ArrayList<BillDetail> listBillDetail = new ArrayList<>();

			cart.getCartItems().forEach((key, value) -> {

				BillDetail billDetail = new BillDetail();
				billDetail.setCount(value.getQuantity());
				billDetail.setPrice(value.getProduct().getPrice());
				billDetail.setProduct(value.getProduct());
				listBillDetail.add(billDetail);
				bill.setSumMoney(bill.getSumMoney() + (value.getQuantity() * value.getProduct().getPrice()));
			});

			bill.setListBillDetail(listBillDetail);
			billDAO.insertBill(bill);

			cart = new Cart();
			session.setAttribute("cart", cart);
		} catch (Exception e) {
		}
		request.setAttribute("type", "success");
		response.sendRedirect("/Book/?checkout=success");
	}

}
