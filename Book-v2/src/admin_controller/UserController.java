package admin_controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;
import tool.MD5;

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String action = request.getParameter("action");

		// danh sach
		if (action.equals("list")) {
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {
				
				String roleAdmin = (String) session.getAttribute("role");
				
				if(roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYNHANVIEN)) {
					ArrayList<User> allUser = new UserDAO().getAllUser();
					
					String name = (request.getParameter("name") == null || request.getParameter("name") == "") ? "" : request.getParameter("name");
					String email = (request.getParameter("email") == null || request.getParameter("email") == "") ? "" : request.getParameter("email");
					String phone = (request.getParameter("phone") == null || request.getParameter("phone") == "") ? "" : request.getParameter("phone");
					String role = (request.getParameter("role") == null || request.getParameter("role") == "0") ? "0" : request.getParameter("role");
					
					if (name != "" || email != "" || phone != "" || role != "") {
						allUser = new UserDAO().getWhere(name, email, phone, role);
					} else {
						allUser = new UserDAO().getAllUser();
					}
					request.setAttribute("users", allUser);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/danh-sach-nguoi-dung");
					rd.forward(request, response);
				} else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
					rd.forward(request, response);
				}	
			}
		} else if (action.equals("add")) {
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {
				String roleAdmin = (String) session.getAttribute("role");

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYNHANVIEN)) {

					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/them-nguoi-dung");
					rd.forward(request, response);

				} else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
					rd.forward(request, response);
				}
			}
		} else if (action.equals("edit")) {
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				String roleAdmin = (String) session.getAttribute("role");

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYNHANVIEN)) {

					Long id = Long.parseLong(request.getParameter("id"));

					User user = new UserDAO().getUserById(id);

					System.out.println("create by : " + user.getCreateBy());
					System.out.println("id login : " + session.getAttribute("idAdmin"));

					// check điều kiện user đó là người tạo ra tài khoản này thì mới cho sửa.
					if (user.getCreateBy() == Long.parseLong(session.getAttribute("idAdmin") + "")) {

						request.setAttribute("user", user);
						RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/sua-nguoi-dung");
						rd.forward(request, response);

					} else {
						response.sendRedirect("/Book/admin/listUser?error=edit");
					}

				} else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
					rd.forward(request, response);
				}
			}
		} else if (action.equals("delete")) {
			
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				String roleAdmin = (String) session.getAttribute("role");

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYNHANVIEN)) {

					Long id = Long.parseLong(request.getParameter("id"));
					String type = (request.getParameter("type") == null) ? "" : request.getParameter("type");
					
					// delete khách hàng.
					if(type.equals("customer")) {
						System.out.println(id);
						try {
							new UserDAO().deleteById(id);
							response.sendRedirect("/Book/admin/customer?action=list");
						} catch (SQLException e) {
							response.sendRedirect("/Book/admin/customer?action=list&error=delete");
						}
						
					} else {

						Long idLogin = Long.parseLong(session.getAttribute("idAdmin") + "");

						User u = new UserDAO().getUserById(id);
						
						if (u.getCreateBy().equals(idLogin)) {
							try {
								new UserDAO().deleteById(id);
								response.sendRedirect("/Book/admin/user?action=list");
							} catch(Exception e) {
								response.sendRedirect("/Book/admin/user?action=list&error=delete");
							}
						} else {
							response.sendRedirect("/Book/admin/user?action=list&error=delete");
						}
					}

				} else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
					rd.forward(request, response);
				}
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String action = request.getParameter("action");

		// danh sach
		if (action.equals("list")) {
		} else if (action.equals("add")) {
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");

				String address = request.getParameter("address");
				String email = request.getParameter("email");
				String name = request.getParameter("name");
				String password = request.getParameter("password");
				String rePassword = request.getParameter("re-password");
				String phone = request.getParameter("phone");
				String role = request.getParameter("role");

				if (address.equals("") || email.equals("") || name.equals("") || password.equals("")
						|| rePassword.equals("") || phone.equals("") || role.equals("")) {

					if (new UserDAO().checkEmail(email)) {
						response.sendRedirect("/Book/admin/user?action=add&error=add&email=exists");
						return;
					} else {
						response.sendRedirect("/Book/admin/user?action=add&error=add");
						return;
					}
				} else {
					if (new UserDAO().checkEmail(email)) {
						response.sendRedirect("/Book/admin/user?action=list&error=add&email=exists");
						return;
					}
				}

				if (checkUser(email, password, rePassword) == 1) {

					password = MD5.encryption(password);

					if (new UserDAO().checkEmail(email)) {
						response.sendRedirect("/Book/admin/user?action=list&error=add?email=exist");
					} else {

						User u = new User();
						u.setAddress(address);
						u.setEmail(email);
						u.setName(name);
						u.setPassword(password);
						u.setPhone(phone);
						u.setRole(Long.parseLong(role));
						u.setCreateBy(Long.parseLong(session.getAttribute("idAdmin").toString()));

						new UserDAO().insertUser(u);
						response.sendRedirect("/Book/admin/user?action=list&email=" + email);
					}
				}
			}
		} else if (action.equals("edit")) {
			
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {
				request.setCharacterEncoding("UTF-8");

				String id = request.getParameter("id");
				String address = request.getParameter("address");
				String email = request.getParameter("email");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String role = request.getParameter("role");

				if(address.equals("") || email.equals("") || name.equals("") || phone.equals("") || role.equals("")) {
					response.sendRedirect("/Book/admin/user?action=edit&id=" + id + "&error=edit");
					return;
				}
				
				User userOld = new UserDAO().getUserById(Long.parseLong(id));

				if (!userOld.getEmail().equals(email)) {

					if (!new UserDAO().checkEmail(email)) {
						User u = userOld;
						u.setId(Long.parseLong(id));
						u.setAddress(address);
						u.setEmail(email);
						u.setName(name);
						u.setPhone(phone);
						u.setRole(Long.parseLong(role));

						new UserDAO().editUser(u);
						response.sendRedirect("/Book/admin/user?action=list&email=" + email);
					} else {
						response.sendRedirect("/Book/admin/user?action=edit&id=" + id + "&error=edit&email=exists");
					}

				} else {

					User u = new User();
					u.setId(Long.parseLong(id));
					u.setAddress(address);
					u.setEmail(email);
					u.setName(name);
					u.setPhone(phone);
					u.setRole(Long.parseLong(role));
					new UserDAO().editUser(u);
					response.sendRedirect("/Book/admin/user?action=list&email=" + email);
				}
			}
			
		} else if (action.equals("delete")) {
		}
		
	}

	private int checkUser(String email, String password, String rePassword) {

		if (password.equals(rePassword)) {
			return 1;
		}
		return 0;

	}
	
}
