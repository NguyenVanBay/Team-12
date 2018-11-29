<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BillDetail"%>
<%@page import="model.Bill"%>


<%@page import="java.text.*"%>

<%
	DecimalFormat formatter = new DecimalFormat("###,###,###.00");
	Bill bill = (Bill) request.getAttribute("bill");
%>

<!doctype html>
<html class="no-js" lang="vi">

<head>
<jsp:include page="include/head.jsp"></jsp:include>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/list.css">
<link rel="stylesheet" href="css/detailbill.css">
</head>

<body>
	<!-- menu-top -->
	<jsp:include page="include/menu-top.jsp"></jsp:include>
	<div class="container">
		<div class="bg-while">
			<div class="top">
				<h3>Chi tiết đơn hàng</h3>
				<a href="/Book/admin/listBill">Danh sách đơn hàng</a>
			</div>

			<form action="/Book/admin/listCategory" method="get">

				<div class="seach-content">

					<h3>
						Chi tiết đơn hàng của ông ( bà ) :
						<%=bill.getCustomer()%>

					</h3>
					<h3>
						Địa chỉ nhận hàng :
						<%=bill.getAddress()%>

					</h3>
					<h3>
						SDT :
						<%=bill.getPhone()%>
					</h3>

				</div>
			</form>
		</div>

		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>id</th>
						<th>Sản phẩm</th>
						<th>Số lượng</th>
						<th>Giá</th>
						<th>Thành tiền (VND)</th>
					</tr>
				</thead>
				<tbody>

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
						<td><%=formatter.format(billDetail.getPrice())%> VND</td>
						<td><%=formatter.format(tien)%></td>
					</tr>

					<%
						}
					%>

					<tr>
						<td colspan="4">Tổng tiền</td>
						<td><%=formatter.format(tongTien)%> VND</td>
					</tr>
					<%
					
					if(bill.getStatus() == Bill.CHODUYETDON) {
					%>
					<tr>
						<td>Tạo hóa đơn</td>
						<td colspan="4"><a href="${pageContext.request.contextPath}/admin/bill?action=add&id=<%= bill.getId() %>"
							class="item tooltip"> <span class="tooltiptext">Tạo
									hóa đơn và giao hàng</span> <i class="fa fa-taxi"></i>
						</a></td>
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