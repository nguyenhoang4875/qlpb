<%@ page import="model.bean.User"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Cookie cookies[] = request.getCookies();
	Cookie cookieEmail = null;
	Cookie cookiePassword = null;
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			//response.getWriter().print(cookies[i].getName() + cookies[i].getValue());
			if (cookies[i].getName().equals("cookieEmail")) {
				cookieEmail = cookies[i];
			}
			if (cookies[i].getName().equals("cookiePassword")) {
				cookiePassword = cookies[i];
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Quản Lý Phòng Ban</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>
	<%
		String email = "";
		String password = "";

		if ((request.getParameter("email") != null)) {
			email = (String) request.getParameter("email");
		} else if (cookieEmail != null) {
			email = cookieEmail.getValue();
		}
		if ((request.getParameter("password") != null)) {
			password = (String) request.getParameter("password");
		} else if (cookiePassword != null) {
			password = cookiePassword.getValue();
		}
		String message = (request.getAttribute("message") != null) ? (String) request.getAttribute("message") : "";
	%>

	<!-- Header -->
	<jsp:include page="inc/header.jsp"></jsp:include>
	<!-- end header -->
	<!-- Container -->
	<div class="container " style="margin-top: 6px;">

		<div class="container">
			<h2>Login</h2>
			<form class="form-horizontal" id="login-form" action="UserServlet"
				method="post">
				<input type="hidden" name="command" value="login">
				<div class="form-group">
					<label class="control-label col-sm-2" for="email">Email:</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="email"
							placeholder="Enter email" name="email" value="<%=email%>">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">Password:</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="pwd"
							placeholder="Enter password" name="password"
							value="<%=password%>">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div>
							<input type="checkbox" checked="checked" name="remember" value="Remember me ">
							<span id="message" class="label label-danger"><%=message%></span>
						</div>
						<button type="submit" class="btn btn-success">Submit</button>

					</div>
				</div>

			</form>
		</div>
		<!-- advertisement -->

		<!-- end advertisement -->
	</div>
	<!-- end container -->
	<!-- footer -->
	<%-- <jsp:include page="inc/footer.jsp"></jsp:include> --%>
	<!-- end footer -->
</body>
</html>