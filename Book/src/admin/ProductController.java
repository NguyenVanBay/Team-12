package admin;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import constant.Constant;
import dao.CategoryDAO;
import dao.ProductDAO;
import model.Category;
import model.Image;
import model.Product;
import model.User;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public ProductController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		// danh sach
		if (action.equals("list")) {
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				String roleAdmin = (String) session.getAttribute("role");

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYTHELOAI)) {

					ArrayList<Product> allProduct = new ArrayList<>();
					String name = (request.getParameter("name") == null || request.getParameter("name") == "") ? ""
							: request.getParameter("name");
					String author = (request.getParameter("author") == null || request.getParameter("author") == "") ? ""
							: request.getParameter("author");
					String title = (request.getParameter("title") == null || request.getParameter("title") == "") ? ""
							: request.getParameter("title");
					String priceFrom = (request.getParameter("priceFrom") == null
							|| request.getParameter("priceFrom") == "") ? "" : request.getParameter("priceFrom");
					String priceTo = (request.getParameter("priceTo") == null || request.getParameter("priceTo") == "") ? ""
							: request.getParameter("priceTo");
					String idCategory = (request.getParameter("idCategory") == null
							|| request.getParameter("idCategory") == "") ? "-1" : request.getParameter("idCategory");
					String publicFrom = (request.getParameter("publicFrom") == null
							|| request.getParameter("publicFrom") == "") ? "" : request.getParameter("publicFrom");
					String publicTo = (request.getParameter("publicTo") == null || request.getParameter("publicTo") == "") ? ""
							: request.getParameter("publicTo");

					// nếu bất kì trường tìm kiếm nào khác khoảng trống thì sẽ tìm where.
					if (name != "" || author != "" || title != "" || priceFrom != "" || priceTo != "" || publicFrom != "" || publicTo != ""
							|| idCategory != "-1") {
						allProduct = new ProductDAO().getWhere(name, author, title, priceFrom, priceTo, idCategory, publicFrom, publicTo);
					
					// lấy tất cả sản phẩm.
					} else {
						allProduct = new ProductDAO().getAll();
					}

					ArrayList<Category> listCategory = new CategoryDAO().getAll();
					request.setAttribute("categorys", listCategory);
					request.setAttribute("products", allProduct);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/danh-sach-san-pham");
					rd.forward(request, response);

				} else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
					rd.forward(request, response);
				}
			}
		} else if(action.equals("add")) {
			if (null == session.getAttribute("email") && session.getAttribute("role").equals("2")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				String roleAdmin = (String) session.getAttribute("role");

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYTHELOAI)) {

					ArrayList<Category> listCategory = new CategoryDAO().getAll();
					request.setAttribute("categorys", listCategory);

					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/them-san-pham");
					rd.forward(request, response);

				} else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
					rd.forward(request, response);
				}
			}
		}  else if(action.equals("edit")) {
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				String roleAdmin = (String) session.getAttribute("role");

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYTHELOAI)) {

					Long id = Long.parseLong(request.getParameter("id"));

					ArrayList<Category> listCategory = new CategoryDAO().getAll();
					request.setAttribute("categorys", listCategory);

					Product product = new ProductDAO().getProductById(id);
					request.setAttribute("product", product);

					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/sua-san-pham");
					rd.forward(request, response);

				} else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
					rd.forward(request, response);
				}
			}
		}  else if(action.equals("delete")) {
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				String roleAdmin = (String) session.getAttribute("role");

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYTHELOAI)) {

					Long id = Long.parseLong(request.getParameter("id"));

					new ProductDAO().deleteById(id);

					response.sendRedirect("/Book/admin/listProduct");

				} else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
					rd.forward(request, response);
				}
			}
		} else if(action.equals("detail")) {
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				String roleAdmin = (String) session.getAttribute("role");

				if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYTHELOAI)) {

					Long id = Long.parseLong(request.getParameter("id"));

					Product product = new ProductDAO().getProductById(id);

					request.setAttribute("product", product);
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/detailProduct.jsp");
					rd.forward(request, response);

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
		
		if (action.equals("list")) {
			
		} else if(action.equals("add")) {
			
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				request.setCharacterEncoding("UTF-8");
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=utf-8");

				String userName = request.getParameter("name");
				String idCategory = request.getParameter("idCategory");
				String author = request.getParameter("author");
				String publicAt = request.getParameter("publicAt");
				String count = request.getParameter("count");
				String price = request.getParameter("price");
				String title = request.getParameter("title");
				String description = request.getParameter("description");
				String type = request.getParameter("type");
				String url = request.getParameter("url");

				long milliseconds = 0;
				SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
				try {
					Date d = f.parse(publicAt);
					milliseconds = d.getTime();
				} catch (Exception e) {
					System.out.println("chưa nhập ngày");
				}

				if (userName.equals("") || idCategory.equals("") || author.equals("") || publicAt.equals("")
						|| count.equals("") || price.equals("") || title.equals("") || description.equals("")
						|| type.equals("") || url.equals("")) {
					response.sendRedirect("/Book/admin/addProduct?error=add");
					return;
				}

				Product p = new Product();
				p.setName(userName);
				p.setPrice(Double.parseDouble(price));
				p.setAuthor(author);
				p.setCategory(new Category(Long.parseLong(idCategory)));
				p.setCount(Long.parseLong(count));
				p.setPublicAt(new Timestamp(milliseconds));
				p.setTitle(title);
				p.setDescription(description);
				p.setType(type);
				p.setUrl(url);
				p.setCreateBy(Long.parseLong(session.getAttribute("idAdmin").toString()));

				String nameImg = "image" + new Date().getTime();

				Image thumbnail = new Image();
				thumbnail.setName(nameImg + "1.png");
				thumbnail.setType((long) 1);

				p.setThumbnail(thumbnail);

				ArrayList<Image> listImg = new ArrayList<>();

				Image img1 = new Image();
				img1.setName(nameImg + "2.png");
				img1.setType((long) 2);

				listImg.add(img1);

				p.setListImage(listImg);

				System.out.println(p.toString());

				if (new ProductDAO().insertProduct(p)) {

					Part part1 = request.getPart("thubnail");
					Part part2 = request.getPart("image1");
					String savePath1 = Constant.UPLOAD_DIRECTORY + File.separator + nameImg + "1.png";
					String savePath2 = Constant.UPLOAD_DIRECTORY + File.separator + nameImg + "2.png";

					part1.write(savePath1 + File.separator);
					part2.write(savePath2 + File.separator);

				}

				response.sendRedirect("/Book/admin/product?action=list");
			}
			
		}  else if(action.equals("edit")) {
			if (null == session.getAttribute("email")) {
				// User is not logged in.
				response.sendRedirect("/Book/admin/Login");
			} else {

				request.setCharacterEncoding("UTF-8");

				String id = request.getParameter("id");
				String userName = request.getParameter("name");
				String idCategory = request.getParameter("idCategory");
				String author = request.getParameter("author");
				String publicAt = request.getParameter("publicAt");
				String count = request.getParameter("count");
				String price = request.getParameter("price");
				String title = request.getParameter("title");
				String description = request.getParameter("description");
				String type = request.getParameter("type");
				String url = request.getParameter("url");

				if (userName.equals("") || idCategory.equals("") || author.equals("") || publicAt.equals("")
						|| count.equals("") || price.equals("") || title.equals("") || description.equals("")
						|| type.equals("") || url.equals("")) {
					response.sendRedirect("/Book/admin/product?action=edit&id=" + id + "&error=edit");
					return;
				}

				long milliseconds = 0;
				SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
				try {
					Date d = f.parse(publicAt);
					milliseconds = d.getTime();
				} catch (Exception e) {
					System.out.println("chưa nhập ngày");
				}

				Product product = new ProductDAO().getProductById(Long.parseLong(id));

				product.setName(userName);
				product.setCategory(new Category(Long.parseLong(idCategory)));
				product.setAuthor(author);
				product.setCount(Long.parseLong(count));
				product.setPrice(Double.parseDouble(price));
				product.setPublicAt(new Timestamp(milliseconds));
				product.setTitle(title);
				product.setDescription(description);
				product.setType(type);
				product.setUrl(url);

				new ProductDAO().editProduct(product);

				response.sendRedirect("/Book/admin/product?action=list");
			}
		}  else if(action.equals("delete")) {
			
		}
		
	}

}
