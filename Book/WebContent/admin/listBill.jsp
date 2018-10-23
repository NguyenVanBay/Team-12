<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Bill"%>

<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="include/head.jsp"></jsp:include>

<%
	ArrayList<Bill> bills = (ArrayList) request.getAttribute("bills");
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
				<!-- DATA TABLE -->
				<div>
					<h3 class="title-5 m-b-35" style="float: left; margin-left: 37px;">Đơn
						hàng</h3>
				</div>
				<div class="table-responsive table-responsive-data2">
					<table class="table table-data2">
						<thead>
							<tr>
								<th>id</th>
								<th>Khách hàng</th>
								<th>Địa chỉ</th>
								<th>Số điện thoại</th>
								<th>Tổng tiền</th>
								<th>Trạng thái đơn hàng</th>
								<th></th>
								<th>
							</tr>
						</thead>
						<tbody>

							<%
								for (Bill b : bills) {
							%>
							<tr class="tr-shadow">
								<td><%=b.getId()%></td>
								<td><span><%=b.getCustomer()%></span></td>
								<td><%=b.getAddress()%></td>
								<td><%=b.getPhone()%></td>
								<td><%=b.getSumMoney()%></td>
								<td>
									<%
										if (b.getStatus() == 1) {
									%> <p style="color: yellow">Đã giao hàng</p> <%
										} else if (b.getStatus() == 2) {
									%> <p style="color: blue">Đang giao hàng</p> <%
										}  else if (b.getStatus() == 0) {
									%> <p style="color: red">Đang chờ duyệt</p> <%
										} else {
									%><p style="color: gray"> Đơn hàng bị hủy</p> <%
										}
									%>
								</td>
								<td>
									<div class="table-data-feature">
										<a href="detailBill?id=<%=b.getId()%>" class="item"
											data-toggle="tooltip" data-placement="top" title=""
											data-original-title="chi tiết"> <i class="fa fa-edit"></i>
										</a>
										<%
											if (b.getStatus() == 1) {
										%>
										<a href="editBill?id=<%=b.getId()%>&status=2" class="item"
											data-toggle="tooltip" data-placement="top" title=""
											data-original-title="đang giao hàng"> <i class="fa fa-fighter-jet"></i>
										</a>
										<a href="editBill?id=<%=b.getId()%>&status=3" class="item"
											data-toggle="tooltip" data-placement="top" title=""
											data-original-title="hủy đơn hàng"> <i class="fa  fa-times"></i>
										</a>
										<%
											} else if (b.getStatus() == 2) {
										%>
										<a href="editBill?id=<%=b.getId()%>&status=1" class="item"
											data-toggle="tooltip" data-placement="top" title=""
											data-original-title="đã giao hàng"> <i class="fa fa-check"></i>
										</a>
										<a href="editBill?id=<%=b.getId()%>&status=3" class="item"
											data-toggle="tooltip" data-placement="top" title=""
											data-original-title="hủy đơn hàng"> <i class="fa  fa-times"></i>
										</a>
										<%
											} else {
										%>
										<a href="editBill?id=<%=b.getId()%>&status=1" class="item"
											data-toggle="tooltip" data-placement="top" title=""
											data-original-title="đã giao hàng"> <i class="fa fa-check"></i>
										</a>
										<a href="editBill?id=<%=b.getId()%>&status=2" class="item"
											data-toggle="tooltip" data-placement="top" title=""
											data-original-title="đang giao hàng"> <i class="fa fa-fighter-jet"></i>
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
