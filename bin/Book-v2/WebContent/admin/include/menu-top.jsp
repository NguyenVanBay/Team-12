<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="header-top-area">
	<div class="menutop">
		<div class="logo-area">
			<a href="#">Nhóm 12</a> <a>Xin chào
				<%=session.getAttribute("userName")%></a>
			<form action="/Book/admin/Login" method="post">
				<input type="hidden" name="type" value="logout" />
				<button class="btn btn-success" type="submit">Logout</button>
			</form>
		</div>
	</div>

	<%
		String role = session.getAttribute("role").toString();
	%>
	<div class="menu-bottom">
		<li class="nav-item"><a href="/Book/admin/dasboard"><span><i class="fa fa-desktop"></i></span>Dashboard</a></li>
		<%
			if (role.equals("4") || role.equals("1")) {
		%>
		<li class="nav-item"><a href="/Book/admin/listUser"><span><i class="fa fa-users"></i></span>Nhân viên</a></li>
		<li class="nav-item"><a href="/Book/admin/listCustomer"><span><i class="fa fa-heart-o"></i></span>Khách hàng</a></li>
		<%
			}
		%>

		<%
			if (role.equals("4") || role.equals("2")) {
		%>
		<li class="nav-item"><a href="/Book/admin/listCategory"><span><i class="fa fa-paper-plane-o"></i></span>Thể loại</a></li>

		<li class="nav-item"><a href="/Book/admin/listProduct"><span><i class="fa fa-pagelines"></i></span>Sản phẩm</a></li>
		<%
			}
		%>

		<%
			if (role.equals("4") || role.equals("3")) {
		%>
		<li class="nav-item"><a href="/Book/admin/listBill"><span><i class="fa fa-paint-brush"></i></span>Đơn hàng</a></li>

		<%
			}
		%>

		<li class="nav-item"><a href="/Book/admin/profile?type=infomation"><span><i class="fa fa-info"></i></span>Profile</a></li>
		</ul>
	</div>
</div>