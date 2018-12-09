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

					<%
						for (Category c : categorys) {
					%>

					<div class="tin1">
						<div class="text1">TIN MỚI NHÂT</div>
						<%
							long id = c.getPk_category_news_id();
								for (New tin : new NewDAO().getNewByCategoryId(id)) {
						%>
						<div class="news">
							<a href="${pageContext.request.contextPath}/chi-tiet?id=<%= tin.getPk_news_id() %>"><img src="${pageContext.request.contextPath}/admin/upload/<%= tin.getC_img() %>" alt=""></a>
							<div class="description">
								<div class="text2" style="text-decoration: none;">
									<a href="${pageContext.request.contextPath}/chi-tiet?id=<%= tin.getPk_news_id() %>"><%= tin.getC_name() %></a>
								</div>
								<p><%= tin.getC_description() %></p>
							</div>
						</div>
						<div style="clear: both;"></div>
						<%
							}
						%>
					</div>
					<div style="clear: both;"></div>
				
				<%
					}
				%></div>

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
								<a href="${pageContext.request.contextPath}/chi-tiet?id=<%= tin.getPk_news_id() %>"><img
									src="${pageContext.request.contextPath}/admin/upload/<%= tin.getC_img() %>"
									alt=""></a>
								<div class="text-right">
									<a href="${pageContext.request.contextPath}/chi-tiet?id=<%= tin.getPk_news_id() %>" style="text-decoration: none;"> <%=tin.getC_description()%></a>
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