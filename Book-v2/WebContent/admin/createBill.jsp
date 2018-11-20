
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Bill"%>
<%@page import="model.BillDetail"%>
<%@page import="java.text.*"%>

<%

	DecimalFormat formatter = new DecimalFormat("###,###,###.00");
	Bill bill = (Bill) request.getAttribute("bill");
%>


<!doctype html>
<html class="no-js" lang="vi">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Bài tập lớn nhóm 12</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Google Fonts
		============================================ -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900"
	rel="stylesheet">
<!-- font awesome CSS
		============================================ -->
<link rel="stylesheet" href="css/font-awesome.min.css">

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/hoadon.css">
</head>

<body onload="window.print();">
	<div id="page" class="page">
		<div class="header">
			<div class="logo">
				<img src="images/icon/logo.png" />
			</div>
			<div class="company">Công ty bán hàng nhóm 12</div>
		</div>
		<br />
		<div class="title">
			HÓA ĐƠN THANH TOÁN SÁCH <br /> -------oOo-------
		</div>
		<br /> <br />
		<table class="TableData">
			<tr>
				<th>STT</th>
				<th>Tên</th>
				<th>Số lượng</th>
				<th>Đơn giá</th>
				<th>Thành tiền</th>
			</tr>

			<%
				int i = 0;
				double tongTien = 0;
				for (BillDetail billDetail : bill.getListBillDetail()) {
					i++;
					double tien = billDetail.getCount() * billDetail.getPrice();
					tongTien += tien;
			%>
			<tr class="tr-shadow">
				<td><%=billDetail.getId()%></td>
				<td><span> <%=billDetail.getProduct().getName()%></span></td>
				<td><%=billDetail.getCount()%></td>
				<td><%=formatter.format(billDetail.getPrice())%></td>
				<td><%=formatter.format(tien)%> VND</td>
			</tr>

			<%
				}
			%>

			<tr>
				<td colspan="4" class="tong">Tổng cộng</td>
				<td class="cotSo"><%=formatter.format(tongTien)%></td>
			</tr>
		</table>
		<div class="footer-left">
			Hà Nội, ngày 20 tháng 11 năm 2018<br /> Khách hàng <br>
			<%=bill.getCustomer()%>
		</div>
		<div class="footer-right">
			Hà Nội, ngày 20 tháng 11 năm 2018<br /> Nhân viên<br>
			<%= session.getAttribute("userName") %>
		</div>
	</div>

	<a href="${pageContext.request.contextPath}/admin/bill?action=edit&id=<%=bill.getId()%>&status=2" class="item tooltip">Xuất
		sản phẩm</a>
</body>

</html>