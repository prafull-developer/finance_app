<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loan Dashboard</title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
body {
	margin: 0;
	font-family: "Segoe UI", Arial, sans-serif;
	background: #f2f4f7;
}

header {
	background: #1e3c72;
	color: #fff;
	padding: 15px 25px;
	font-size: 20px;
	letter-spacing: 1px;
}

.container {
	padding: 20px;
}

.form-card, .table-card {
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	margin-bottom: 25px;
}

h3 {
	margin-top: 0;
	color: #1e3c72;
}

input, select {
	padding: 8px;
	margin: 5px;
	border-radius: 4px;
	border: 1px solid #ccc;
	font-size: 13px;
}

button {
	padding: 8px 14px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 13px;
}

.btn-add {
	background: #2a5298;
	color: #fff;
}

.btn-add:hover {
	background: #1e3c72;
}

table {
	width: 100%;
	border-collapse: collapse;
	font-size: 13px;
}

th {
	background: #2a5298;
	color: #fff;
	padding: 8px;
}

td {
	padding: 8px;
	border-bottom: 1px solid #ddd;
	text-align: center;
}

.status-active {
	color: green;
	font-weight: bold;
}

.status-closed {
	color: red;
	font-weight: bold;
}

.fade-in {
    opacity: 0;
    animation: fadeInAnim 1.5s ease-in forwards;
    animation-delay: 0.4s;
}

@keyframes fadeInAnim {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

</style>

<script>
    function confirmDelete(url) {
        Swal.fire({
            title: 'Delete Loan?',
            text: 'This action cannot be undone!',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Delete'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = url;
            }
        });
    }
</script>

</head>

<body>

	<header class="fade-in" style="text-align: center;"> Loan
		Management Dashboard </header>


	<div class="container">


		<div class="form-card">
			<h3>Add New Loan</h3>
			<form action="addLoan" method="post">
				<input type="text" name="customerName" placeholder="Customer Name"
					required> <input type="email" name="customerEmail"
					placeholder="Email" required> <select name="loanType">
					<option>Home</option>
					<option>Personal</option>
					<option>Education</option>
				</select> <input type="number" name="loanAmount" placeholder="Loan Amount"
					required> <input type="number" name="interestRate"
					placeholder="Interest %" required> <input type="number"
					name="tenureYears" placeholder="Tenure (Years)" required> <input
					type="number" name="emiAmount" placeholder="EMI Amount" required>
				<button class="btn-add">Add Loan</button>
			</form>
		</div>


		<div class="table-card">
			<h3>Loan Records</h3>
			<table>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Type</th>
					<th>Amount</th>
					<th>EMI Paid</th>
					<th>Status</th>
					<th>Actions</th>
				</tr>

				<c:forEach items="${data}" var="l">
					<tr>
						<td>${l.loanId}</td>
						<td>${l.customerName}</td>
						<td>${l.customerEmail}</td>
						<td>${l.loanType}</td>
						<td>${l.loanAmount}</td>
						<td>${l.emiPaid}</td>
						<td><span
							class="${l.loanStatus == 'ACTIVE' ? 'status-active' : 'status-closed'}">
								${l.loanStatus} </span></td>
						<td><a href="editLoan?loanId=${l.loanId}">
								<button>Edit</button>
						</a>
							<button onclick="confirmDelete('deleteLoan?loanId=${l.loanId}')">
								Delete</button></td>
					</tr>
				</c:forEach>
			</table>
		</div>

	</div>

</body>
</html>
