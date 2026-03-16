<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loan Management Login</title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>

body {
	margin: 0;
	font-family: "Segoe UI", Arial, sans-serif;
	height: 100vh;
	background: linear-gradient(135deg, #1e3c72, #2a5298);
	display: flex;
	align-items: center;
	justify-content: center;
}

.login-card {
	width: 360px;
	background: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.25);
	animation: slideDown 0.5s ease;
}

@
keyframes slideDown {from { opacity:0;
	transform: translateY(-20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
h3 {
	text-align: center;
	color: #1e3c72;
	margin-bottom: 20px;
}

input {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border-radius: 5px;
	border: 1px solid #ccc;
	font-size: 14px;
}

input:focus {
	outline: none;
	border-color: #2a5298;
	box-shadow: 0 0 5px rgba(42, 82, 152, 0.3);
}

button {
	width: 100%;
	padding: 10px;
	background: #2a5298;
	border: none;
	color: #fff;
	font-size: 15px;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 10px;
	transition: background 0.3s;
}

button:hover {
	background: #1e3c72;
}

.footer-text {
	text-align: center;
	margin-top: 15px;
	font-size: 12px;
	color: #777;
}

.pulse {
	animation: softPulse 2s ease-in-out infinite;
}

@
keyframes softPulse { 0% {
	transform: scale(1);
}
50%
{
transform
:
 
scale
(1
.04
);

    
}
100%
{
transform
:
 
scale
(1);

    
}
}
</style>
</head>

<body>

	<div class="login-card">
		<h3 class="pulse">Admin Login</h3>

		<form action="login" method="post">
			<input type="text" name="username" placeholder="Username" required>
			<input type="password" name="password" placeholder="Password"
				required>
			<button type="submit">Login</button>
		</form>

		<div class="footer-text">Loan Management System</div>
	</div>
	<c:if test="${not empty msg}">
		<script>
			Swal.fire({
				icon : 'error',
				title : 'Login Failed',
				text : '${msg}'
			});
		</script>
	</c:if>
</body>
</html>
