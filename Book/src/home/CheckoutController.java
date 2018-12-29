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
import dao.ProductDAO;
import dao.UserDAO;
import model.Bill;
import model.BillDetail;
import model.Cart;
import model.Product;
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

		// check login. nếu chưa login sang trang login.
		if (null == session.getAttribute("idUser")) {
			session.setAttribute("url", getServletContext().getInitParameter("contextPath") + "/Book/cart?command=list");
			// User is not logged in.
			response.sendRedirect("/Book/dang-nhap-dang-ki");
			return;
		}

		// check số lượng sp khách hàng.
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart.countItem() < 1) {
			cart = new Cart();
			request.setAttribute("type", "success");
			response.sendRedirect("/Book/?checkout=error");
			return;
		}

		// sản phẩm đề xuất.
		ArrayList<Product> listProductSugerencias = new ArrayList<>();
		cart.getCartItems().forEach((key, value) -> {
			double priceFrom = value.getProduct().getPrice() - 20000;
			double priceTo = value.getProduct().getPrice() + 20000;

			// lấy sản phẩm cùng lại và có giá hơn kém 20k.
			String sql = "Select * from products where id_category = " + value.getProduct().getCategory().getId()
					+ " AND price between " + priceFrom + " AND " + priceTo + " limit 2";
			System.out.println(sql);
			ArrayList<Product> temp = new ProductDAO().getProductBySQL(sql);

			listProductSugerencias.addAll(temp);
		});

		// lấy thông tin khách hàng login.
		User u = new UserDAO().getUserById(Long.parseLong("" + session.getAttribute("idUser")));
		request.setAttribute("user", u);
		request.setAttribute("listProductSugerencias", listProductSugerencias);
		// send data sang trang checkout.
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkout.jsp");
		rd.forward(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// get urf-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		// get param
		String customer = request.getParameter("customer");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");

		try {

			// tạo hóa đơn.
			Bill bill = new Bill();
			bill.setCustomer(customer);
			bill.setAddress(address);
			bill.setPhone(phone);
			bill.setStatus(0);
			bill.setSumMoney(0);
			bill.setCreateBy(Long.parseLong(session.getAttribute("idUser").toString()));
			bill.setCreateAt(new Timestamp(new Date().getTime()));
			ArrayList<BillDetail> listBillDetail = new ArrayList<>();

			Cart cart = (Cart) session.getAttribute("cart");
			cart.getCartItems().forEach((key, value) -> {

				// tạo hóa đơn chi tiết từng sản phẩm.
				BillDetail billDetail = new BillDetail();
				billDetail.setCount(value.getQuantity());
				billDetail.setPrice(value.getProduct().getPrice());
				billDetail.setProduct(value.getProduct());
				listBillDetail.add(billDetail);

				// đối với dừng đơn. giá tiền sẽ được cộng dồn.
				bill.setSumMoney(bill.getSumMoney() + (value.getQuantity() * value.getProduct().getPrice()));
			});

			bill.setListBillDetail(listBillDetail);

			// tạo hóa đơn.
			billDAO.insertBill(bill);

			cart = new Cart();
			session.setAttribute("cart", cart);
		} catch (Exception e) {
			System.out.println("lỗi tạo hóa đơn !");
		}

		// chuyển về trang chủ thông báo.
		request.setAttribute("type", "success");
		response.sendRedirect("/Book/?checkout=success");
		return;
	}

}
