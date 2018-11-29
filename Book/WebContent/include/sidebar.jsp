<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Image"%>

<%
	ArrayList<Category> categorys = (ArrayList) request.getAttribute("categorys");
%>


<div class="sidebar">

	<nav id="menu-sidebar">
		<ul id="nav-sidebar">
			<li id="danh-muc"><a href="#">Danh mục</a></li>

			<%
			ArrayList<Product> listProduct = new ArrayList();
				for (Category c : categorys) {
			%>
			<li id="category"><a href="${pageContext.request.contextPath}/tim-kiem/<%= c.getUrl() %>-<%=c.getId()%>"> <%=c.getName()%></a>
				<ul id="submenuCategory">
				<%
				int i = 1;
				for(Product prTemp : c.getListProduct()) {
					%>
					<li><a href="${pageContext.request.contextPath}/chi-tiet/<%= prTemp.getUrl() %>-<%=prTemp.getId()%>"><%= i + " - " %> <%= prTemp.getName() %> ---- Tác giả : <%= prTemp.getAuthor() %> ---- Giá Tiền : <%= prTemp.getPrice() + " VND"%></a></li>
					<%
					i++;
				}
				%>
				</ul>
			</li>
			<%
				}
			%>

		</ul>
	</nav>

	<hr>

	<div class="search">
		<h3>Tìm kiếm nâng cao</h3>

		<form id="serchpage" action="${pageContext.request.contextPath}/tim-kiem/">

<label>Theo tên </label>
			<input type="text" value="<%=(request.getParameter(" name") == "" || request.getParameter("name") == null) ? ""
					: request.getParameter("name")%>" name="name"/> 
			<label>Theo tác giả </label><input
				type="text" value="<%=(request.getParameter(" author") == "" || request.getParameter("author") == null) ? ""
					: request.getParameter("author")%>"  name="author"/> 
				<label>Giá từ </label><input
				type="text" value="<%=(request.getParameter(" priceFrom") == "" || request.getParameter("priceFrom") == null) ? ""
					: request.getParameter("priceFrom")%>" name="priceFrom"/>
				<label>Giá đến </label><input
				type="text" value="<%=(request.getParameter(" priceTo") == "" || request.getParameter("priceTo") == null) ? ""
					: request.getParameter("priceTo")%>" name="priceTo" /> 
				<label>Xuất bản từ </label><input
				name="publicFrom" value="<%=(request.getParameter("publicFrom") == "" || request.getParameter("publicFrom") == null) ? ""
					: request.getParameter("publicFrom")%>" type="date" />
<label>Xuất bản đến</label><input
				name="publicTo" value="<%=(request.getParameter(" publicTo") == "" || request.getParameter("publicTo") == null) ? ""
					: request.getParameter("publicTo")%>" type="date" /> <br>
			<button type="submit">Tìm kiếm</button>

		</form>

	</div>
</div>