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
<jsp:include page="include/head.jsp"></jsp:include>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/admin/css/list.css">
</head>

<body>
	<!-- menu-top -->
	<jsp:include page="include/menu-top.jsp"></jsp:include>
	<div class="container">
		<div class="bg-while">
			<div class="top">
				<h3>Danh sách đơn hàng</h3>
			</div>

			<form action="${pageContext.request.contextPath}/admin/bill"
				method="get">
				<input type="hidden" name="action" value="list" />
				<div class="seach-content">

					<div class="form-group">
					<label>Tên khách hàng</label>
						<input name="name" type="text"
							value="<%=(request.getParameter(" name") == "" || request.getParameter("name") == null) ? ""
					: request.getParameter("name")%>">
					</div>
					<div class="form-group">
					<label>Địa chỉ</label>
						<input name="address" type="text"
							value="<%=(request.getParameter(" address") == "" || request.getParameter("address") == null) ? ""
					: request.getParameter("address")%>">
					</div>
					<div class="form-group">
					<label>Số điện thoại</label>
						<input name="phone" type="text"
							value="<%=(request.getParameter(" phone") == "" || request.getParameter("phone") == null) ? ""
					: request.getParameter("phone")%>">
					</div>

					<div class="form-group">
					<label>Tổng tiền từ (VND)</label>
						<input name="sumFrom" type="text"
							value="<%=(request.getParameter(" sumFrom") == "" || request.getParameter("sumFrom") == null) ? ""
					: request.getParameter("sumFrom")%>">
					</div>

					<div class="form-group">
					<label>Tổng tiền đến (VND)</label>
						<input name="sumTo" type="text"
							value="<%=(request.getParameter(" sumTo") == "" || request.getParameter("sumTo") == null) ? ""
					: request.getParameter("sumTo")%>">
					</div>
					
					<div class="form-group">
					<label>Đơn tạo từ</label>
						<input name="createFrom" type="date"
							value="<%=(request.getParameter("createFrom") == "" || request.getParameter("createFrom") == null) ? ""
					: request.getParameter("createFrom")%>"
							class="form-control-sm form-control">
					</div>


					<div class="form-group">
					<label>Đơn tạo đến</label>
						<input name="createTo" type="date" value="<%=(request.getParameter("createTo") == "" || request.getParameter("createTo") == null) ? ""
					: request.getParameter("createTo")%>"
							class="form-control-sm form-control">
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
						<th>Ngày tạo đơn</th>
						<th>Tổng tiền</th>
						<th>Trạng thái đơn hàng</th>
						<th></th>
					</tr>
				</thead>
				<tbody>

					<%
						SimpleDateFormat format = new SimpleDateFormat("dd-MM-YYYY");
					%>


					<%
						for (Bill b : bills) {
					%>
					<tr class="tr-shadow">
						<td><%=b.getId()%></td>
						<td><span> <%=b.getCustomer()%></span></td>
						<td><%=b.getAddress()%></td>
						<td><%=b.getPhone()%></td>
						<td><%= format.format(b.getCreateAt()) %></td>
						<td><%=formatter.format(b.getSumMoney())%> VND</td>
						<td>
							<%
								if (b.getStatus() == Bill.DAGIAODON) {
							%>
							<p style="color: yellow">Đã giao hàng</p> <%
 	} else if (b.getStatus() == Bill.DANGGIAODON) {
 %>
							<p style="color: blue">Đang giao hàng</p> <%
 	} else if (b.getStatus() == Bill.CHODUYETDON) {
 %>
							<p style="color: red">Đang chờ duyệt</p> <%
 	} else {
 %>
							<p style="color: gray">Đơn hàng bị hủy</p> <%
 	}
 %>
						</td>
						<td>
							<div class="table-data-feature">
								<a
									href="${pageContext.request.contextPath}/admin/bill?action=detail&id=<%=b.getId()%>"
									class="item tooltip"> <span class="tooltiptext">Chi
										tiết đơn hàng</span> <i class="fa fa-edit"></i>
								</a>
								<%
									if (b.getStatus() == 1) {
								%>
								<a
									href="${pageContext.request.contextPath}/admin/bill?action=edit&id=<%=b.getId()%>&status=3"
									class="item tooltip"> <span class="tooltiptext">Hủy
										đơn hàng</span><i class="fa  fa-times"></i>
								</a>
								<%
									} else if (b.getStatus() == 2) {
								%>
								<a
									href="${pageContext.request.contextPath}/admin/bill?action=edit&id=<%=b.getId()%>&status=1"
									class="item tooltip"> <span class="tooltiptext">Đã
										giao hàng</span> <i class="fa fa-check"></i>
								</a> <a
									href="${pageContext.request.contextPath}/admin/bill?action=edit&id=<%=b.getId()%>&status=3"
									class="item tooltip"> <span class="tooltiptext">Hủy
										đơn hàng</span> <i class="fa  fa-times"></i>
								</a>
								<%
									} else if (b.getStatus() == 3) {
								%>
								<%
									} else {
								%>
								<a
									href="${pageContext.request.contextPath}/admin/bill?action=add&id=<%=b.getId()%>"
									class="item tooltip"> <span class="tooltiptext">Tạo
										hóa đơn và giao hàng</span> <i class="fa fa-taxi"></i>
								</a> <a
									href="${pageContext.request.contextPath}/admin/bill?action=list&id=<%=b.getId()%>&status=3"
									class="item tooltip"> <span class="tooltiptext">Hủy
										đơn hàng</span> <i class="fa  fa-times"></i>
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