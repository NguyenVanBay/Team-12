<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Category"%>
<%@page import="model.Product"%>
<%@page import="model.Image"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>

<%
	ArrayList<Category> categorys = (ArrayList) request.getAttribute("categorys");
	Product product = (Product) request.getAttribute("product");
%>


<!doctype html>
<html class="no-js" lang="vi">

<head>
<jsp:include page="include/head.jsp"></jsp:include>

<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/add.css">
</head>

<body>
	<!-- menu-top -->
	<jsp:include page="include/menu-top.jsp"></jsp:include>
	<div class="container">

		<div class="top">
			<h3>
				sửa sản phẩm :
				<%=product.getName()%>
			</h3>
			<a
				href="${pageContext.request.contextPath}/admin/product?action=list">Danh
				sách sản phẩm</a>
		</div>

		<p style="color: red; font-size: 20px">
			<%="edit".equals(request.getParameter("error")) ? "Sửa không thành công" : ""%>
		</p>


		<form id="editProduct"
			action="${pageContext.request.contextPath}/admin/product"
			method="post"  enctype="multipart/form-data">

			<input type="hidden" name="action" value="edit" />
			<input name="id" type="hidden" value="<%=product.getId()%>" />
			<input name="idCategory" type="hidden" value="<%=product.getCategory().getId()%>" />
			<div class="form-group">
				<label for="text-input" class=" form-control-label">Tên sản
					phẩm</label> <input type="text" id="text-input" name="name"
					value="<%=product.getName()%>" placeholder="Tên sản phẩm">
			</div>

			<div class="form-group">
				<label for="text-input" class=" form-control-label">Đường
					dẫn</label> <input type="text" id="text-input" name="url"
					value="<%=product.getUrl()%>" placeholder="Đường dẫn">
			</div>

			<div class="form-group">
				<label for="selectSm" class=" form-control-label">Thể loại</label> <select
					name="idCategory">
					<%
						for (Category c : categorys) {
					%>
					<option
						<%=(c.getId().equals(product.getCategory().getId())) ? "selected" : ""%>
						value="
						<%=c.getId()%>">
						<%=c.getName()%>
					</option>
					<%
						}
					%>
				</select>
			</div>

			<div class="form-group">
				<label for="text-input" class=" form-control-label">Tác giả</label>
				<input type="text" id="text-input" name="author"
					value="<%=product.getAuthor()%>" placeholder="Tác giả"
					class="form-control">

			</div>

			<%
				SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
			%>

			<div class="form-group">
				<label for="text-input" class=" form-control-label">Thời
					gian xuất bản</label> <input type="date" name="publicAt"
					value="<%=format.format(product.getPublicAt())%>"
					placeholder="Giá tiền" class="form-control">

			</div>

			<div class="form-group">
				<label for="text-input" class=" form-control-label">Số lượng</label>
				<input type="text" id="password" name="count"
					value="<%=product.getCount()%>" placeholder="Số lượng"
					class="form-control">

			</div>

			<div class=" form-group">
				<label for="text-input" class=" form-control-label">Giá tiền</label>
				<input type="text" id="text-input" name="price"
					value="<%=product.getPrice()%>" placeholder="Giá tiền"
					class="form-control">

			</div>


			<div class=" form-group">
				<label for="text-input" class=" form-control-label">Giới
					thiệu</label> <input type="text" id="text-input" name="title"
					value="<%=product.getTitle()%>" placeholder="Giới thiệu tổng quan"
					class="form-control">
			</div>

			<div class="form-group">
				<label for="textarea-input" class=" form-control-label">Mô
					tả</label>
				<textarea name="description" id="textarea-input" rows="9"
					placeholder="Mô tả" class="form-control"><%=product.getDescription()%></textarea>

			</div>

			<div class=" form-group">
				<label for="select" class=" form-control-label">Sản phẩm</label> <select
					name="type" id="select" class="form-control">
					<option <%=(product.getType().equals("new")) ? "selected" : ""%>
						value="new">Mới</option>
					<option <%=(product.getType().equals("hot")) ? "selected" : ""%>
						value="hot">Nổi bật</option>
					<option
						<%=(product.getType().equals("sellMultiple")) ? "selected" : ""%>
						value="sellMultiple">Bán chạy</option>
				</select>
			</div>



			<div>
				<label>Cập nhật ảnh</label> <input type="radio" name="changeimg"
					onchange="changeImg()" value="true" style="display: inline-block; margin-right: 20px;"> <label>Hủy cập
					nhật ảnh</label> <input checked=""  type="radio" name="changeimg"
					onchange="changeImg()" value="false"><br><br>
			</div><br>

			<div id="thumbnail" class=" form-group"></div>

			<div id="imageDetail" class=" form-group"></div>

			<script>
				function changeImg() {

					var status;
					var radios = document.getElementsByName('changeimg');

					for (var i = 0, length = radios.length; i < length; i++) {
						if (radios[i].checked) {
							status = radios[i].value;
							break;
						}
					}

					if (status == "false") {
						document.getElementById("thumbnail").innerHTML = "";
						document.getElementById("imageDetail").innerHTML = "";
					} else {

						//
						var divTo = document.createElement("div");
						divTo.setAttribute("class", "form-group");
						divTo.setAttribute("id", "thumbnail");

						var label = document.createElement("label");
						var node = document.createTextNode("Thumbnail");
						label.appendChild(node);
						label.setAttribute("style", "margin-right: 5px");

						var input = document.createElement("input");
						input.setAttribute("type", "file");
						input.setAttribute("name", "thumbnail");

						divTo.appendChild(label);
						divTo.appendChild(input);

						var element = document.getElementById("editProduct");
						var elementChild = document.getElementById("thumbnail");

						element.replaceChild(divTo, elementChild);

						// 
						var divTo1 = document.createElement("div");
						divTo1.setAttribute("class", "form-group");
						divTo1.setAttribute("id", "imageDetail");

						var label1 = document.createElement("label");

						var node1 = document.createTextNode("Image Detail");
						label1.appendChild(node1);
						label1.setAttribute("style", "margin-right: 5px");

						var input1 = document.createElement("input");
						input1.setAttribute("type", "file");
						input1.setAttribute("name", "imageDetail");

						divTo1.appendChild(label1);
						divTo1.appendChild(input1);

						var elementChild1 = document
								.getElementById("imageDetail");
						element.replaceChild(divTo1, elementChild1);
					}

				}
			</script>

			<div class="form-group">
				<label for="text-input" class=" form-control-label">Thumbnail</label>
				<img class="img img-responsive" style="height: 150px;"
					src="/Book/admin/upload/<%=product.getThumbnail().getName()%>" />
			</div>

			<div class="form-group">
				<label for="text-input" class=" form-control-label">List Ảnh</label>
				<%
					for (Image i : product.getListImage()) {
				%>
				<img class="img img-responsive"
					style="height: 150px; width: auto; margin-right: 15px; margin-top: 15px;"
					src="/Book/admin/upload/<%=i.getName()%>" />
				<%
					}
				%>
			</div>

			<div class="card-footer">
				<label></label>
				<button type="submit" class="btn btn-primary btn-sm">
					<i class="fa fa-dot-circle-o"></i> Submit
				</button>
				<button type="reset" class="btn btn-danger btn-sm">
					<i class="fa fa-ban"></i> Reset
				</button>
			</div>

		</form>
	</div>
</body>

</html>