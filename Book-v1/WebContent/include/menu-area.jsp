<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- menu area -->
<div id="header-top-area">
	
	<div class="account-area">
		<ul>
			<%
				if (session.getAttribute("userNameUser") == null) {
			%>
			<li><a href="/Book/dang-nhap-dang-ki">Đăng nhập</a></li>
			<%
				} else {
			%>

			
			<li>
				<form id="form" action="/Book/dang-nhap-dang-ki" method="post">
					<input type="hidden" name="type" value="logout" />
					<button  class="btn btn-success" type="submit">Logout</button>
				</form>
			</li>
			
			<li><a href=""><%=(session.getAttribute("userNameUser") == null) ? ""
						: "Xin chào " + session.getAttribute("userNameUser")%></a></li>

			<%
				}
			%>

			<li><a href="/Book/dang-nhap-dang-ki">Đăng kí</a></li>
			<li><a href="/Book/danh-sach-gio-hang">Xem giỏ hàng</a></li>
		</ul>
	</div>
</div>
<!-- end header-top-area -->

<div class="menu-area">
	<nav id="menu">
		<ul id="nav">
			<li><a href="/Book/home">Trang chủ</a></li>

			<li><a href="/Book/tintuc.jsp">Tin tức</a></li>


			<li><a href="/Book/gioithieu.jsp">Giới thiệu</a></li>


			<li><a href="/Book/lienhe.jsp">Liên hệ</a></li>
		</ul>
	</nav>
</div>
<!-- end menu area -->