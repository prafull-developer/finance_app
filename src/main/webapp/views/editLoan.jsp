<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Loan</title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
body {
	margin: 0;
	font-family: "Segoe UI", Arial, sans-serif;
	background: linear-gradient(120deg, #1e3c72, #2a5298);
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

.card {
	width: 520px;
	background: #ffffff;
	border-radius: 10px;
	box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	padding: 25px 30px;
	animation: fadeIn 0.5s ease-in;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(15px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.card h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #1e3c72;
	border-bottom: 2px solid #e6e6e6;
	padding-bottom: 10px;
}

label {
	font-size: 13px;
	color: #555;
	font-weight: 600;
}

input, select {
	width: 100%;
	padding: 9px 10px;
	margin: 6px 0 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	transition: border-color 0.3s;
}

input:focus, select:focus {
	outline: none;
	border-color: #2a5298;
	box-shadow: 0 0 5px rgba(42, 82, 152, 0.3);
}

.btn-group {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

button {
	padding: 10px 18px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	cursor: pointer;
	transition: background 0.3s, transform 0.2s;
}

.btn-update {
	background: #2a5298;
	color: white;
}

.btn-update:hover {
	background: #1e3c72;
	transform: translateY(-1px);
}

.btn-cancel {
	background: #e0e0e0;
	color: #333;
}

.btn-cancel:hover {
	background: #cfcfcf;
}
</style>

<script>
    function confirmUpdate() {
        Swal.fire({
            title: 'Confirm Update',
            text: 'Do you want to save the updated loan details?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#2a5298',
            cancelButtonColor: '#aaa',
            confirmButtonText: 'Yes, Update'
        }).then((result) => {
            if (result.isConfirmed) {
                document.getElementById("updateForm").submit();
            }
        });
        return false;
    }
</script>

</head>
<body>

	<div class="card">
		<h2>Edit Loan Details</h2>

		<form id="updateForm" action="updateLoan" method="post">

			<input type="hidden" name="loanId" value="${loan.loanId}"> <label>Customer
				Name</label> <input type="text" name="customerName"
				value="${loan.customerName}" required> <label>Email</label>
			<input type="email" name="customerEmail"
				value="${loan.customerEmail}" required> <label>Loan
				Type</label> <select name="loanType">
				<option value="Home" ${loan.loanType == 'Home' ? 'selected' : ''}>Home
					Loan</option>
				<option value="Personal"
					${loan.loanType == 'Personal' ? 'selected' : ''}>Personal
					Loan</option>
				<option value="Education"
					${loan.loanType == 'Education' ? 'selected' : ''}>Education
					Loan</option>
			</select> <label>Loan Amount</label> <input type="number" name="loanAmount"
				value="${loan.loanAmount}" required> <label>Interest
				Rate (%)</label> <input type="number" step="0.01" name="interestRate"
				value="${loan.interestRate}" required> <label>Tenure
				(Years)</label> <input type="number" name="tenureYears"
				value="${loan.tenureYears}" required> <label>EMI
				Amount</label> <input type="number" name="emiAmount"
				value="${loan.emiAmount}" required>

			<div class="btn-group">
				<button class="btn-cancel" type="button"
					onclick="window.history.back()">Cancel</button>
				<button class="btn-update" onclick="return confirmUpdate()">Update
					Loan</button>
			</div>
		</form>
	</div>

</body>
</html>
