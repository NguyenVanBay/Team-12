<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>404 Page no found</title>
<meta name="viewport" content="width=device-width">

<style type="text/css">
article.error {
    width: 300px;
    height: 300px;
    background: #8BC34A;
    color: #fff;
    font-family: cursive;
    font-size: 20px;
    border-radius: 50%;
    text-align: center;
    padding: 30px;
    margin: 170px auto;
}

a.error-back {
    color: red;
    font-size: 27px;
    text-decoration: none;
}
</style>
</head>
<body>
	<div class="error-page">
		<article class="error">
			<hgroup>
				<h1>404</h1>
				<h2>oops! Trang không tồn tại</h2>
			</hgroup>
			<a href="${pageContext.request.contextPath}/" title="Back to site" class="error-back">Quay lại trang chủ</a>
		</article>
	</div>
</body>
</html>