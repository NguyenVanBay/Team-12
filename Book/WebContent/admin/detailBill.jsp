<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BillDetail"%>
<%@page import="model.Bill"%>

<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="include/head.jsp"></jsp:include>

<%
	Bill bill = (Bill) request.getAttribute("bill");
%>

</head>

<body class="animsition">
	<div class="page-wrapper">

		<!-- MENU SIDEBAR-->
		<jsp:include page="include/menusidebar.jsp"></jsp:include>
		<!-- END MENU SIDEBAR-->

		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<jsp:include page="include/header.jsp"></jsp:include>
			<!-- HEADER DESKTOP-->



			<!-- MAIN CONTENT-->
			<div class="col-md-12">
			<h4>Chi tiết đơn hàng của ông : <%= bill.getCustomer() %></h4><br>
			<h4>SDT : <%= bill.getPhone() %></h4><br>
			<h4>Địa chỉ giao hàng : <%= bill.getAddress() %></h4><br>
				<!-- DATA TABLE -->
				<div class="table-responsive table-responsive-data2">
					<table class="table table-data2">
						<thead>
							<tr>
								<th>id</th>
								<th>Sản phẩm</th>
								<th>Số lượng</th>
								<th>Giá</th>
							</tr>
						</thead>
						<tbody>

							<%
								for (BillDetail billDetail : bill.getListBillDetail()) {
							%>
							<tr class="tr-shadow">
								<td><%= billDetail.getId() %></td>
								<td><span><%= billDetail.getProduct().getName() %></span></td>
								<td><%= billDetail.getCount() %></td>
								<td><%= billDetail.getPrice() %></td>
							</tr>

							<%
								}
							%>
							<tr class="spacer"></tr>
						</tbody>
					</table>
				</div>
				<!-- END DATA TABLE -->
			</div>
			<!-- END MAIN CONTENT-->
			<!-- END PAGE CONTAINER-->
		</div>

	</div>

	<jsp:include page="include/filejs.jsp"></jsp:include>

</body>

</html>
<!-- end document-->
