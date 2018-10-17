<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="include/head.jsp"></jsp:include>
</head>

<body class="animsition">
	<div class="page-wrapper">

		<!-- MENU SIDEBAR-->
		<jsp:include page="include/menusidebar.jsp"></jsp:include>
		<!-- END MENU SIDEBAR-->

		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<jsp:include page="include/header.jsp"></jsp:include>
			<!-- HEADER DESKTOP-->

			<!-- MAIN CONTENT-->
			<div class="card">
				<div class="card-header">
					<strong>Basic Form</strong> Elements
				</div>
				<div class="card-body card-block">
					<form action="" method="post" enctype="multipart/form-data"
						class="form-horizontal">
						<div class="row form-group">
							<div class="col col-md-3">
								<label class=" form-control-label">Static</label>
							</div>
							<div class="col-12 col-md-9">
								<p class="form-control-static">Username</p>
							</div>
						</div>
						<div class="row form-group">
							<div class="col col-md-3">
								<label for="text-input" class=" form-control-label">Text
									Input</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="text" id="text-input" name="text-input"
									placeholder="Text" class="form-control"> <small
									class="form-text text-muted">This is a help text</small>
							</div>
						</div>
						<div class="row form-group">
							<div class="col col-md-3">
								<label for="email-input" class=" form-control-label">Email
									Input</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="email" id="email-input" name="email-input"
									placeholder="Enter Email" class="form-control"> <small
									class="help-block form-text">Please enter your email</small>
							</div>
						</div>
						<div class="row form-group">
							<div class="col col-md-3">
								<label for="password-input" class=" form-control-label">Password</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="password" id="password-input" name="password-input"
									placeholder="Password" class="form-control"> <small
									class="help-block form-text">Please enter a complex
									password</small>
							</div>
						</div>
						<div class="row form-group">
							<div class="col col-md-3">
								<label for="disabled-input" class=" form-control-label">Disabled
									Input</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="text" id="disabled-input" name="disabled-input"
									placeholder="Disabled" disabled="" class="form-control">
							</div>
						</div>
						<div class="row form-group">
							<div class="col col-md-3">
								<label for="textarea-input" class=" form-control-label">Textarea</label>
							</div>
							<div class="col-12 col-md-9">
								<textarea name="textarea-input" id="textarea-input" rows="9"
									placeholder="Content..." class="form-control"></textarea>
							</div>
						</div>
						<div class="row form-group">
							<div class="col col-md-3">
								<label for="file-multiple-input" class=" form-control-label">Multiple
									File input</label>
							</div>
							<div class="col-12 col-md-9">
								<input type="file" id="file-multiple-input"
									name="file-multiple-input" multiple=""
									class="form-control-file">
							</div>
						</div>
					</form>
				</div>
				<div class="card-footer">
					<button type="submit" class="btn btn-primary btn-sm">
						<i class="fa fa-dot-circle-o"></i> Submit
					</button>
					<button type="reset" class="btn btn-danger btn-sm">
						<i class="fa fa-ban"></i> Reset
					</button>
				</div>
			</div>
			<!-- END MAIN CONTENT-->
			<!-- END PAGE CONTAINER-->
		</div>

	</div>

	<jsp:include page="include/filejs.jsp"></jsp:include>

</body>

</html>
<!-- end document-->
