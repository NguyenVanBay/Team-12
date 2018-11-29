<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="model.Category"%>
<%@page import="model.Image"%>


<!DOCTYPE html>
<html lang="en">

<head>

<jsp:include page="include/head.jsp"></jsp:include>

<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="css/gioithieu.css">
<link rel="stylesheet" href="css/tintuc.css">

</head>

<body>

	<!-- menu top -->
	<jsp:include page="include/menu-area.jsp"></jsp:include>
	<!-- end menu top -->

	<!-- infomation -->
	<jsp:include page="include/infomation.jsp"></jsp:include>
	<!-- end infomation -->

	<!-- slider area -->
	<jsp:include page="include/menu.jsp"></jsp:include>
	<!-- end slide-area -->


	<div class="container" style="margin: 20px">



		<div class="topic1">
			<h2 class="topic-title">Khuyến mại | Giảm giá</h2>
			<a> <img class="anh" src="img/sales.jpg" alt="">

			</a>
			<p class="topic-caption" alt="">Nơi cập nhật những tin tức mới
				nhất về các sự kiện khuyến mại và giảm giá của cửa hàng sách</p>
			<div class="actions">
				<a href="http://localhost:8080/Book/Sukien.jsp"
					class="btn-action small btn-green">Xem ngay</a>
				</button>
			</div>
		</div>
		<div class="topic1">
			<h2 class="topic-title">Khuyến mại | Giảm giá</h2>
			<a> <img class="anh" src="img/sales.jpg" alt="">

			</a>
			<p class="topic-caption" alt="">Nơi cập nhật những tin tức mới
				nhất về các sự kiện khuyến mại và giảm giá của cửa hàng sách</p>
			<div class="actions">
				<a href="http://localhost:8080/Book/Sukien.jsp"
					class="btn-action small btn-green">Xem ngay</a>
				</button>
			</div>
		</div>
		<div class="tieude" style="width: 100px">
			<a target="_blank" href=""><img src="img/event.png" alt=""></a>
			<a target="_blank" href="https://www.facebook.com"><img
				src="img/facebook.png" alt=""></a> <a target="_blank"
				href="https://youtube.com"><img src="img/youtube.png" alt=""></a>

		</div>
	</div>

	<!-- menu top -->
	<jsp:include page="include/footer.jsp"></jsp:include>
	<!-- end menu top -->


</body>

</html>