<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<aside class="menu-sidebar d-none d-lg-block">
	<div class="logo">
		<a href="#"> <img src="../admin/images/icon/logo.png"
			alt="Cool Admin" />
		</a>
	</div>
	<div class="menu-sidebar__content js-scrollbar1">
		<nav class="navbar-sidebar">
			<ul class="list-unstyled navbar__list">
				<li><a href="/Book/admin/dasboard"> <i
						class="fa fa-puzzle-piece"></i>Dasboard
				</a></li>
				<%
					String role = session.getAttribute("role").toString();
				%>
				<%
					if (role.equals("4") || role.equals("1")) {
				%>
				<li><a href="/Book/admin/listUser"> <i class="fa fa-users"></i>Nhân
						viên
				</a></li>
				<li><a href="/Book/admin/listCustomer"> <i
						class="fa fa-frown-o"></i>Khách hàng
				</a></li>
				<%
					}
				%>

				<%
				if (role.equals("4") || role.equals("2")) {
				%>
				<li><a href="/Book/admin/listCategory"> <i
						class="fa fa-rocket"></i>Thể loại
				</a></li>
				<li><a href="/Book/admin/listProduct"> <i
						class="fas fa-table"></i>Sản phẩm
				</a></li>
				<%
					}
				%>

				<%
				if (role.equals("4") || role.equals("3")) {
				%>
				<li><a href="/Book/admin/listBill"> <i class="fa fa-leaf"></i>Đơn
						hàng
				</a></li>
				<%
					}
				%>
			</ul>
		</nav>
	</div>
</aside>