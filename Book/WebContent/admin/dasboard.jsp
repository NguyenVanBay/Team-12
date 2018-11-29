<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Bill"%>
<%@page import="java.text.*"%>
<%
	ArrayList<Product> listwarningProduct = (ArrayList) request.getAttribute("listwarningProduct");
%>
<%
	ArrayList<Bill> listBill = (ArrayList) request.getAttribute("listBill");
%>

<html class="no-js" lang="vi">

<head>
<jsp:include page="include/head.jsp"></jsp:include>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/dasboard.css">
</head>

<body>
	<!-- menu-top -->
	<jsp:include page="include/menu-top.jsp"></jsp:include>
	<div class="container">
		<h3>Phần mềm quản lý bán hàng</h3>
		<p style="color:;">
			- Đơn chờ duyệt
			<%=request.getAttribute("donchuaduyet") + " <strong style='color:red;'> (đơn) </strong>"%></p>
		<p style="color:;">
			- Đơn đang giao
			<%=request.getAttribute("dondanggiao") + " <strong style='color:red;'> (đơn) </strong>"%></p>
		<p style="color:;">
			- Đơn đã giao
			<%=request.getAttribute("dondagiao") + " <strong style='color:red;'> (đơn) </strong>"%></p>
		<p style="color:;">
			- Đơn bị hủy
			<%=request.getAttribute("donhuy") + " <strong style='color:red;'> (đơn) </strong>"%></p>
		<br>
		<p style="color: red;">- Danh sách sản phẩm sắp hết hàng</p>
		<%
			int i = 1;
			for (Product p : listwarningProduct) {

				out.print("<p> " + i + " - " + p.getName() + " <strong style='color: red;'>" + p.getCount()
						+ " (sản phẩm)</strong> </p>");
				i++;
			}

			double tongTienThuDuoc = 0;
			for (Bill b : listBill) {
				tongTienThuDuoc += b.getSumMoney();
			}
		%>
		<br>
		<p">
			- Số hóa đơn tháng này :<strong style='color: red;'> <%=listBill.size()%>
				( đơn)
			</strong>
		</p>
		<%
			DecimalFormat formatter = new DecimalFormat("###,###,###.00");
		%>
		<p">
			- Số tiền thu được tháng này : <strong style='color: red;'><%=formatter.format(tongTienThuDuoc)%>
				VND</strong>
		</p>

	</div>
</body>

</html>