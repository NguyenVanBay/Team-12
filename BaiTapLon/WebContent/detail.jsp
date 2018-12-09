<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.lang.*"%>
<%@page import="model.*"%>
<%@page import="dao.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
</head>
<link rel="stylesheet" href="css/web.css">
<body>
	<div id="wrap">
		<div id="top">
			<a href="index.html"> <img src="img/logo.png" alt=""
				style="padding: 20px 105px;">
			</a>
		</div>

		<div id="main">
			<div class="menu">
				<ul>
					<li><a href="index.html">TRANG CHỦ</a></li>

					<%
						ArrayList<Category> categorys = (ArrayList) request.getAttribute("categorys");

						for (Category c : categorys) {
					%>
					<li><a
						href="${pageContext.request.contextPath}/theloai?id=<%= c.getPk_category_news_id() %>"><%=c.getC_name()%></a></li>
					<%
						}
					%>


					<li><a href="contact.html">LIÊN HỆ</a></li>
					<input type="text" id="search" placeholder="Search"
						style="margin-left: 160px;">
					<li><a href=""><img src="img/search.png" alt=""
							style="width: 20px; height: 20px; padding-top: 0px;"></a></li>
				</ul>
			</div>
			<div class="main_top">
				<div class="top1" style="width: 757px; height: 450px;">
					<a href=""><img src="img/top-post1.jpg" alt="">
						<h5 id="text">tiêu dề bài viết 1</h5></a>

				</div>
				<div class="top2">
					<div class="top21">
						<a href="chitiet.html"><img src="img/top-post2.jpg" alt=""></a>
					</div>
					<div class="top21">
						<a href="chitiet.html"><img src="img/top-post3.jpg" alt=""></a>
					</div>
				</div>
				<div style="clear: both;"></div>
			</div>

			<div class="khoi">

				<div id="left">
				<% New chitiet = (New)request.getAttribute("tin"); %>
					<div class="tin1">
						<div style="padding-left: 20px; padding-top: 20px;">
							<img src="${pageContext.request.contextPath}/admin/upload/<%= chitiet.getC_img() %>" alt="">
						</div>
						<div class="text-header"><%= chitiet.getC_description() %></div>
						<p><%= chitiet.getC_content() %></p>
						<div
							style="font-weight: bold; padding-left: 20px; padding-top: 20px; font-size: 18px;">05
							Comments</div>
						<div class="comment">
							<img src="img/blog/c1.jpg" alt="" style="float: left;">
							<div class="text-comment">
								<a href="#">Emilly Blunt</a>
								<p class="date">December 4, 2017 at 3:12 pm</p>
								<p class="cm">Never say goodbye till the end comes!</p>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div class="comment" style="margin-left: 40px;">
							<img src="img/blog/c2.jpg" alt="" style="float: left;">
							<div class="text-comment">
								<a href="#">Emilly Blunt</a>
								<p class="date">December 4, 2017 at 3:12 pm</p>
								<p class="cm">Never say goodbye till the end comes!</p>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div class="comment">
							<img src="img/blog/c3.jpg" alt="" style="float: left;">
							<div class="text-comment">
								<a href="#">Emilly Blunt</a>
								<p class="date">December 4, 2017 at 3:12 pm</p>
								<p class="cm">Never say goodbye till the end comes!</p>
							</div>
							<div style="clear: both;"></div>
						</div>
						<div class="post-comment">
							<p style="color: black;">Post Comment</p>
							<input type="text" value="Enter Name" id="name"> <input
								type="text" value="Enter email address" id="email"> <input
								type="text" value="Subject" id=""> <input type="text"
								value="Messege">
							<button>POST COMMENT</button>
						</div>
					</div>
				</div>

				<div class="right-box">
					<%
						for (Category c : categorys) {
					%>

					<div id="right">
						<div class="right-tin1" style="padding-top: 20px;">
							<div class="text-header-right"><%=c.getC_name()%></div>

							<%
								long id = c.getPk_category_news_id();
									for (New tin : new NewDAO().getNewByCategoryId(id)) {
							%>

							<div class="right1">
								<a
									href="${pageContext.request.contextPath}/chi-tiet?id=<%= tin.getPk_news_id() %>"><img
									src="${pageContext.request.contextPath}/admin/upload/<%= tin.getC_img() %>"
									alt=""></a>
								<div class="text-right">
									<a
										href="${pageContext.request.contextPath}/chi-tiet?id=<%= tin.getPk_news_id() %>"
										style="text-decoration: none;"> <%=tin.getC_description()%></a>
								</div>
							</div>
							<%
								}
							%>
						</div>
					</div>
					<%
						}
					%>
					<div style="clear: both;"></div>
					<div class="right1"></div>
				</div>
			</div>

			<div id="footer">
				<div class="footer1">
					<div
						style="color: white; font-size: 20px; font-weight: bold; padding-top: 100px;">Top
						Products</div>
					<ul>
						<li><a href="#">Managed Website</a></li>
						<li><a href="#">Manage Reputation</a></li>
						<li><a href="#">Power Tools</a></li>
						<li><a href="#">Marketing Service</a></li>
					</ul>
				</div>
				<div class="footer1">
					<div
						style="color: white; font-size: 20px; font-weight: bold; padding-top: 100px;">Quick
						Links</div>
					<ul>
						<li><a href="#">Jobs</a></li>
						<li><a href="#">Brand Assets</a></li>
						<li><a href="#">Investor Relations</a></li>
						<li><a href="#">Terms of Service</a></li>
					</ul>
				</div>
				<div class="footer1">
					<div
						style="color: white; font-size: 20px; font-weight: bold; padding-top: 100px;">Features</div>
					<ul>
						<li><a href="#">Guides</a></li>
						<li><a href="#">Research</a></li>
						<li><a href="#">Experts</a></li>
						<li><a href="#">Agencies</a></li>
					</ul>
				</div>
				<div class="footer1">
					<div
						style="color: white; font-size: 20px; font-weight: bold; padding-top: 100px;">Resources</div>
					<ul>
						<li><a href="#">Managed Website</a></li>
						<li><a href="#">Manage Reputation</a></li>
						<li><a href="#">Power Tools</a></li>
						<li><a href="#">Marketing Service</a></li>
					</ul>
				</div>
				<div class="footer1">
					<div
						style="color: white; font-size: 20px; font-weight: bold; padding-top: 100px;">Instragram
						Feed</div>
					<div class="anh1">
						<img src="img/i1.jpg" alt=""> <img src="img/i2.jpg" alt="">
						<img src="img/i3.jpg" alt=""> <img src="img/i4.jpg" alt="">
					</div>
					<div class="anh1">
						<img src="img/i5.jpg" alt=""> <img src="img/i6.jpg" alt="">
						<img src="img/i7.jpg" alt=""> <img src="img/i8.jpg" alt="">
					</div>
				</div>
				<div style="clear: both;"></div>
				<div class="footer1" style="color: white;">Copyright ©2018 All
					rights reserved | This template is made with by Colorlib</div>
			</div>

		</div>
	</div>
</body>
</html>