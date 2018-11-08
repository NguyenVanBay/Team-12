<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="header-desktop">
	<div class="section__content section__content--p30">
		<div class="container-fluid">
			<div class="header-wrap">
				<h3>Xin chào <%=session.getAttribute("userName") %></h3>
				<h3>(<%= session.getAttribute("email") %>)</h3>
				<form action="/Book/admin/Login" method="post">
					<input type="hidden" name="type" value="logout" />
					<button class="btn btn-success" type="submit">Logout</button>
				</form>
			</div>
		</div>
	</div>
</header>

<div style="height: 110px;"></div>
