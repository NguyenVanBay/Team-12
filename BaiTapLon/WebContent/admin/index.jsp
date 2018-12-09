<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Bài tập lớn</title>
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

    <div class="container">

        <div class="menu">
            <a href="${pageContext.request.contextPath}/admin/Login?type=logout">Logout</a>
        </div>

        <div class="box">
            <%@ include file="/admin/include/menu.jsp" %>

            <div class="content">
                web tin tá»©c.
            </div>
        </div>

    </div>

</body>

</html>