<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Bill"%>
<%@page import="java.text.*"%>

<%

	DecimalFormat formatter = new DecimalFormat("###,###,###.00");
	ArrayList<Bill> bills = (ArrayList) request.getAttribute("bills");
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
	<link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
	<!-- font awesome CSS
		============================================ -->
	<link rel="stylesheet" href="css/font-awesome.min.css">

	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/list.css">
</head>

<body>
	<!-- menu-top -->
	<jsp:include page="include/menu-top.jsp"></jsp:include>
	<div class="container">
		<div class="bg-while">
			<div class="top">
				<h3>Danh sách đơn hàng</h3>
			</div>

			<form action="/Book/admin/listBill" method="get">

				<div class="seach-content">

					<div class="form-group">
						<input name="name" type="text" value="<%=(request.getParameter(" name")=="" || request.getParameter("name")==null)
						 ? "" : request.getParameter("name")%>"
						placeholder="Tên khách hàng">
					</div>
					<div class="form-group">
						<input name="address" type="text" value="<%=(request.getParameter(" address")=="" ||
						 request.getParameter("address")==null) ? "" : request.getParameter("address")%>"
						placeholder="Địa chỉ khách hàng">
					</div>
					<div class="form-group">
						<input name="phone" type="text" value="<%=(request.getParameter(" phone")=="" || request.getParameter("phone")==null)
						 ? "" : request.getParameter("phone")%>"
						placeholder="Số điện thoại">
					</div>

					<div class="form-group">
						<input name="sumFrom" type="text" value="<%=(request.getParameter(" sumFrom")=="" ||
						 request.getParameter("sumFrom")==null) ? "" : request.getParameter("sumFrom")%>"
						placeholder="Tổng tiền từ (VND)">
					</div>

					<div class="form-group">
						<input name="sumTo" type="text" value="<%=(request.getParameter(" sumTo")=="" || request.getParameter("sumTo")==null)
						 ? "" : request.getParameter("sumTo")%>"
						placeholder="Tổng tiền đến (VND)">
					</div>

					<div class="form-group">
						<button type="submit">Tìm kiếm</button>
					</div>
				</div>
			</form>
		</div>

		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>id</th>
						<th>Khách hàng</th>
						<th>Địa chỉ</th>
						<th>Số điện thoại</th>
						<th>Tổng tiền</th>
						<th>Trạng thái đơn hàng</th>
						<th></th>
					</tr>
				</thead>
				<tbody>

					<%
						for (Bill b : bills) {
					%>
					<tr class="tr-shadow">
						<td>
							<%=b.getId()%>
						</td>
						<td><span>
								<%=b.getCustomer()%></span></td>
						<td>
							<%=b.getAddress()%>
						</td>
						<td>
							<%=b.getPhone()%>
						</td>
						<td>
							<%=formatter.format(b.getSumMoney()) %> VND
						</td>
						<td>
							<%
								if (b.getStatus() == 1) {
							%>
							<p style="color: yellow">Đã giao hàng</p>
							<%
 	} else if (b.getStatus() == 2) {
 %>
							<p style="color: blue">Đang giao hàng</p>
							<%
 	} else if (b.getStatus() == 0) {
 %>
							<p style="color: red">Đang chờ duyệt</p>
							<%
 	} else {
 %>
							<p style="color: gray">Đơn hàng bị hủy</p>
							<%
 	}
 %>
						</td>
						<td>
							<div class="table-data-feature">
								<a href="detailBill?id=<%=b.getId()%>" class="item tooltip">
									<span class="tooltiptext">Chi tiết đơn hàng</span>
									<i class="fa fa-edit"></i>
								</a>
								<%
									if (b.getStatus() == 1) {
								%>
								<a href="editBill?id=<%=b.getId()%>&status=3" class="item tooltip">
									<span class="tooltiptext">Hủy đơn hàng</span><i class="fa  fa-times"></i>
								</a>
								<%
									} else if (b.getStatus() == 2) {
								%>
								<a href="editBill?id=<%=b.getId()%>&status=1" class="item tooltip">
									<span class="tooltiptext">Đã giao hàng</span>
									<i class="fa fa-check"></i>
								</a>
								<a href="editBill?id=<%=b.getId()%>&status=3" class="item tooltip">
									<span class="tooltiptext">Hủy đơn hàng</span>
									<i class="fa  fa-times"></i>
								</a>
								<%
									} else if (b.getStatus() == 3) {
								%>
								<%
									} else {
								%>
								<a href="createBill?id=<%=b.getId()%>" class="item tooltip">
									<span class="tooltiptext">Tạo hóa đơn và giao hàng</span>
									<i class="fa fa-taxi"></i>
								</a>
								<a href="editBill?id=<%=b.getId()%>&status=3" class="item tooltip">
									<span class="tooltiptext">Hủy đơn hàng</span>
									<i class="fa  fa-times"></i>
								</a>
								<%
									}
								%>
							</div>
						</td>
					</tr>

					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>

</html>