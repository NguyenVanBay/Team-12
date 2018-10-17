package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.sun.xml.internal.ws.client.RequestContext;

/**
 * Servlet implementation class TestController
 */
@WebServlet("/TestController")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TestController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @throws IOException
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		final String UPLOAD_DIRECTORY = "/Book/admin/upload";
		
		if (ServletFileUpload.isMultipartContent(request)) {

			try {

				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest((org.apache.tomcat.util.http.fileupload.RequestContext) request);

				for (FileItem item : multiparts) {

					if (!item.isFormField()) {

						String name = new File(item.getName()).getName();

						item.write(new File(UPLOAD_DIRECTORY + File.separator + name));

					}

				}

				// File uploaded successfully
				System.out.println("thanh cong ");

				request.setAttribute("message", "File Uploaded Successfully");

			} catch (Exception ex) {
				System.out.println("loi");
				System.out.println(ex);
				request.setAttribute("message", "File Upload Failed due to " + ex);

			}

		} else {

			request.setAttribute("message",

					"Sorry this Servlet only handles file upload request");

		}

	}

}
