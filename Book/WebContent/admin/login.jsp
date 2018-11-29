<!DOCTYPE html>
<html lang="en">

<head>
<link href="${pageContext.request.contextPath}/admin/css/login.css" rel="stylesheet" media="all">
</head>

<body class="animsition">
	<div class="login-page">
		<div class="form">
			<form class="login-form" action="/Book/admin/Login" method="post">
			<input type="hidden" name="type" value="login"/>
				<input type="text" placeholder="email" name="email" /> <input type="password"
					placeholder="password" name="password" />
				<button type="submit">login</button>
			</form>
		</div>
	</div>

</body>

</html>
<!-- end document-->