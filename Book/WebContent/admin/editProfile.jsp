<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.User"%>


<%
	User user = (User) request.getAttribute("user");
%>

<!doctype html>
<html class="no-js" lang="vi">

<head>
<jsp:include page="include/head.jsp"></jsp:include>
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/profile.css">
<link rel="stylesheet" href="css/add.css">
</head>

<body>
	<!-- menu-top -->
	<jsp:include page="include/menu-top.jsp"></jsp:include>
	<div class="container">
		<div class="bg-while">
			<div class="top">
				<h3>Cập nhật thông tin cá nhân</h3>
			</div>
		</div>

		<form id="editProfile" action="/Book/admin/profile" method="post">

			<input type="hidden" name="id" value="<%=user.getId()%>">

			<div class="form-group">
				<label for="text-input">Họ tên </label> <input type="text"
					name="name" value="<%=user.getName()%>" placeholder="Họ Tên">
			</div>

			<div class=" form-group">
				<label>email</label> <input type="text" name="email"
					value="<%=user.getEmail()%>" placeholder="Email">
			</div>

			<div class=" form-group">
				<label>Số điện thoại</label> <input type="text" id="text-input"
					name="phone" value="<%=user.getPhone()%>"
					placeholder="Số điện thoại">
			</div>

			<div class=" form-group">
				<label>Địa chỉ</label>
				<textarea name="address" placeholder="Địa chỉ..."><%=user.getAddress()%></textarea>
			</div>

			<div id="editpass" class=" form-group"></div>

			<div id="editpass_re" class=" form-group"></div>

			<input type="hidden" id="status" name="status" value="0" />

			<div class=" form-group">
				<label>Xác nhận mật khẩu</label> <input type="password"
					name="password">
			</div>

			<script>
				function changePass() {

					// them o nhap password
					var divTo = document.createElement("div");
					divTo.setAttribute("class", "form-group");

					var label = document.createElement("label");
					var node = document.createTextNode("Nhập mật khẩu mới");
					label.appendChild(node);
					label.setAttribute("style", "margin-right: 5px");

					var input = document.createElement("input");
					input.setAttribute("type", "password");
					input.setAttribute("name", "newpass");
					input.setAttribute("placeholder", "Nhập pass mới");

					divTo.appendChild(label);
					divTo.appendChild(input);

					var element = document.getElementById("editProfile");
					var elementChild = document.getElementById("editpass");

					element.replaceChild(divTo, elementChild);

					// them o nhap repass

					var divTo1 = document.createElement("div");
					divTo1.setAttribute("class", "form-group");

					var label1 = document.createElement("label");

					var node1 = document
							.createTextNode("Nhập lại mật khẩu mới");
					label1.appendChild(node1);
					label1.setAttribute("style", "margin-right: 5px");

					var input1 = document.createElement("input");
					input1.setAttribute("type", "password");
					input1.setAttribute("name", "newpass_re");
					input1.setAttribute("placeholder", "Nhập lại pass mới");

					divTo1.appendChild(label1);
					divTo1.appendChild(input1);

					var elementChild1 = document.getElementById("editpass_re");
					element.replaceChild(divTo1, elementChild1);

					// them input hidden de phan biet co sua passoword hay ko. 1 la co sua pass.
					document.getElementById("status").value = "1";

				}
			</script>

			<div class="card-footer">
				<label></label>
				<button type="submit">
					<i class="fa fa-dot-circle-o"></i> Submit
				</button>
				<button type="reset">
					<i class="fa fa-ban"></i> Reset
				</button>

				<button type="button" onclick="changePass();">Thay đổi mật
					khẩu</button>

			</div>

		</form>
	</div>
</body>

</html>