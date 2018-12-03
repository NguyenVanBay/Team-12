<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@ page import="java.util.*"%>


<%
	ArrayList<Product> products = (ArrayList) request.getAttribute("products");
%>

<%
	ArrayList<Category> categorys = (ArrayList) request.getAttribute("categorys");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<jsp:include page="include/head.jsp"></jsp:include>

<link rel="stylesheet" href="css/login.css">

</head>

<%
	String error = (request.getParameter("error") == null) ? "" : request.getParameter("error");
%>

<body>

	<!-- menu top -->
	<jsp:include page="include/menu-area.jsp"></jsp:include>
	<!-- end menu top -->

	<div class="container" style="margin: 50px;">
		<div class="form">
			<h3>Đăng nhập</h3>
			<p class="er-red" style="font-size: 35px;">
				<%
					if (error.equals("login")) {
						out.print("Email hoắc mật khẩu không đúng");
					}
				%>
			</p>
			<form action="/Book/dang-nhap-dang-ki" method="post">
				<input type="hidden" name="type" value="login" /> <input
					type="hidden" name="page"
					value="<%=request.getParameter("checkout")%>" />
				<div class="list-form">
					<label for="uname"><b>Email</b></label> <input type="text"
						placeholder="Nhập email" value="" onfocusout="checkParamLogin()"
						id="emaillg" class="cje" name="email" required>
					<div id="er-email-lg">
						<p id="t-email-lg" class="er-red"></p>
					</div>

					<label for="uname"><b>Mật khẩu</b></label> <input type="password"
						placeholder="Nhập mật khẩu" value=""
						onfocusout="checkParamLogin()" id="passwordlg" name="password"
						required>
					<div id="er-passeord-lg">
						<p id="t-password-lg" class="er-red"></p>
					</div>


					<div class="form-group">
						<button style="color: #fff; background-color: red; padding: 5px;" type="submit">Đăng nhập</button>
					</div>

				</div>
			</form>
		</div>


		<div class="form">
			<h3>Đăng kí</h3>

			<p class="er-red" style="font-size: 35px;">
				<%
					if (error.equals("register")) {
						out.print("Đăng kí thất bại");
					}

					String email = (request.getParameter("email") == null) ? "" : request.getParameter("email");

					
				%>
			</p>
			
			<p class="er-green" style="font-size: 35px; margin-bottom: 10px;">
				<%
				
				String success = (request.getParameter("success") == null) ? "" : request.getParameter("success");

				
					if (success.equals("register")) {
						out.print("Đăng kí thành công");
					}

					
				%>
			</p>

			<form action="/Book/dang-nhap-dang-ki" method="post">
				<input type="hidden" name="type" value="register" />
				<div class="list-form">

					<label for="uname"><b>Họ tên</b></label> <input type="text" value=""
						placeholder="Nhập họ tên" onfocusout="checkParam()" id="rg-name"
						name="name" required>
					<div id="er-name-rg">
						<p id="name-rg" class="er-red"></p>
					</div>

					<label for="uname"><b>Email</b></label> <input type="text" value=""
						placeholder="Email" onfocusout="checkParam()" id="rg-email"
						name="email" required>
					<div id="er-email-rg">
						<p id="email-rg" class="er-red"><% if (email.equals("exists")) {
							out.print("Email đã tồn tại");
						} %></p>
					</div>

					<label for="uname"><b>Password</b></label> <input type="password"
						id="rg-password" onfocusout="checkParam()" placeholder="Password" value=""
						name="password" required>
					<div id="er-password-rg">
						<p id="password-rg" class="er-red"></p>
					</div>

					<label for="uname"><b>Nhập lại password</b></label> <input
						type="password" id="rg-repassword" onfocusout="checkParam()" value=""
						placeholder="Nhập lại password" name="repassword" required>
					<div id="er-repassword-rg">
						<p id="repassword-rg" class="er-red"></p>
					</div>

					<label for="uname"><b>Số điện thoại</b></label> <input type="text" value=""
						id="rg-phone" onfocusout="checkParam()"
						placeholder="Số điện thoại" name="phone" required>

					<div id="er-phone-rg">
						<p id="phone-rg" class="er-red"></p>
					</div>

					<label for="uname"><b>Địa chỉ</b></label> <input type="text"
						id="rg-address" onfocusout="checkParam()" placeholder="Địa chỉ" value=""
						name="address" required>

					<div id="er-address-rg">
						<p id="address-rg" class="er-red"></p>
					</div>
					<div class="form-group">
						<button style="color: #fff; background-color: red; padding: 5px;" type="submit">Đăng kí</button>
					</div>
				</div>
			</form>
		</div>

		<script>
			function checkParamLogin() {
				// chuẩn hóa đầu vào.
				// đăng nhập.
				var email = document.getElementById("emaillg").value.trim();
				var passowrd = document.getElementById("passwordlg").value
						.trim();

				// check email dang nhap.
				if (email == "") {
					document.getElementById("t-email-lg").innerHTML = "Chưa nhập email";

				} else {
					document.getElementById("t-email-lg").innerHTML = "";
				}

				if (passowrd == "") {
					document.getElementById("t-password-lg").innerHTML = "Chưa nhập passowrd";

				} else {
					document.getElementById("t-password-lg").innerHTML = "";
				}

			}

			function checkParam() {

				// đăng kí.
				var rg_name = document.getElementById("rg-name").value.trim();
				var rg_email = document.getElementById("rg-email").value.trim();
				var rg_password = document.getElementById("rg-password").value
						.trim();
				var rg_repassword = document.getElementById("rg-repassword").value
						.trim();
				var rg_phone = document.getElementById("rg-phone").value.trim();
				var rg_address = document.getElementById("rg-address").value
						.trim();

				if (rg_name == "") {
					document.getElementById("name-rg").innerHTML = "Chưa nhập tên";
				} else {
					document.getElementById("name-rg").innerHTML = "";
				}

				if (rg_email == "") {
					document.getElementById("email-rg").innerHTML = "Chưa nhập email";
				} else {
					document.getElementById("email-rg").innerHTML = "";
				}

				if (rg_password == "") {
					document.getElementById("password-rg").innerHTML = "Chưa nhập password";
				} else {
					document.getElementById("password-rg").innerHTML = "";
				}

				if (rg_repassword == "") {
					document.getElementById("repassword-rg").innerHTML = "Chưa nhập lại password";
				} else {
					document.getElementById("repassword-rg").innerHTML = "";
				}

				if (rg_repassword != rg_password) {
					document.getElementById("repassword-rg").innerHTML = "Password nhập lại chưa đúng";
				} else {
					document.getElementById("repassword-rg").innerHTML = "";
				}

				if (rg_phone == "") {
					document.getElementById("phone-rg").innerHTML = "Chưa nhập Số điện thoại";
				} else {
					document.getElementById("phone-rg").innerHTML = "";
				}

				if (rg_address == "") {
					document.getElementById("address-rg").innerHTML = "Chưa nhập địa chỉ";
				} else {
					document.getElementById("address-rg").innerHTML = "";
				}
			}
		</script>

	</div>

	<!-- footer -->
	<jsp:include page="include/footer.jsp"></jsp:include>
	<!-- end footer -->

</body>

</html>