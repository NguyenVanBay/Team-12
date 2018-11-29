<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- menu area -->
<div id="header-top-area">
	
	<div class="account-area">
		<ul>
			<%
				if (session.getAttribute("userNameUser") == null) {
			%>
			<li><a href="${pageContext.request.contextPath}/dang-nhap-dang-ki">Đăng nhập</a></li>
			<%
				} else {
			%>

			
			<li>
				<form id="form" action="${pageContext.request.contextPath}/dang-nhap-dang-ki" method="post">
					<input type="hidden" name="type" value="logout" />
					<button  class="btn btn-success" type="submit">Logout</button>
				</form>
			</li>
			
			<li><a href=""><%=(session.getAttribute("userNameUser") == null) ? ""
						: "Xin chào " + session.getAttribute("userNameUser")%></a></li>

			<%
				}
			%>

			<li><a href="${pageContext.request.contextPath}/dang-nhap-dang-ki">Đăng kí</a></li>
			<li><a href="${pageContext.request.contextPath}/cart?command=list">Xem giỏ hàng</a></li>
		</ul>
	</div>
</div>
<!-- end header-top-area -->