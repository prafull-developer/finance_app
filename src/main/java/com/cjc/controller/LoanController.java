package com.cjc.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.cjc.model.LoanAccount;
import com.cjc.service.LoanService;

@Controller
public class LoanController {

	@Autowired
	LoanService loanService;

	@RequestMapping("/")
	public String preLogin() {
		return "login";
	}

	@PostMapping("/login")
	public String loginCheck(@RequestParam String username, @RequestParam String password, Model m) {

		if (username.equals("admin") && password.equals("admin@123")) {

			List<LoanAccount> loans = loanService.getAllLoans();
			m.addAttribute("data", loans);

			return "dashboard";
		} else {
			m.addAttribute("msg", "Invalid Username or Password");
			return "login";
		}
	}

	@PostMapping("/addLoan")
	public String addLoan(@ModelAttribute LoanAccount loan, Model m) {

		loan.setLoanStatus("ACTIVE");
		loan.setEmiPaid(0.0);

		loanService.saveLoan(loan);

		m.addAttribute("data", loanService.getAllLoans());
		return "dashboard";
	}

	@GetMapping("/viewLoans")
	public String viewLoans(Model m) {

		m.addAttribute("data", loanService.getAllLoans());
		return "dashboard";
	}

	@GetMapping("/editLoan")
	public String editLoan(@RequestParam int loanId, Model m) {

		LoanAccount loan = loanService.getLoanById(loanId);
		m.addAttribute("loan", loan);

		return "editLoan";
	}

	@PostMapping("/updateLoan")
	public String updateLoan(@ModelAttribute LoanAccount loan, Model m) {

		loanService.updateLoan(loan);

		m.addAttribute("data", loanService.getAllLoans());
		return "dashboard";
	}

	@GetMapping("/deleteLoan")
	public String deleteLoan(@RequestParam int loanId, Model m) {

		loanService.deleteLoan(loanId);

		m.addAttribute("data", loanService.getAllLoans());
		return "dashboard";
	}

	@PostMapping("/payEmi")
	public String payEmi(@RequestParam int loanId, @RequestParam double amount, Model m) {

		loanService.payEmi(loanId, amount);

		m.addAttribute("data", loanService.getAllLoans());
		return "dashboard";
	}

	@GetMapping("/closeLoan")
	public String closeLoan(@RequestParam int loanId, Model m) {

		LoanAccount loan = loanService.getLoanById(loanId);
		loan.setLoanStatus("CLOSED");

		loanService.updateLoan(loan);

		m.addAttribute("data", loanService.getAllLoans());
		return "dashboard";

	}

}
