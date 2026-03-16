package com.cjc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjc.dao.LoanRepository;
import com.cjc.model.LoanAccount;

@Service
public class LoanserviceImpl implements LoanService{
	
	
	@Autowired
	private LoanRepository loanRepository;

	@Override
	public List<LoanAccount> getAllLoans() {
		// TODO Auto-generated method stub
		return loanRepository.findAll();
	}

	@Override
	public void saveLoan(LoanAccount loan) {
		// TODO Auto-generated method stub
		loanRepository.save(loan);
	}

	@Override
	public LoanAccount getLoanById(int loanId) {
		// TODO Auto-generated method stub
		return loanRepository.findById(loanId).get();
	}

	@Override
	public void updateLoan(LoanAccount loan) {
		// TODO Auto-generated method stub
		 loanRepository.save(loan);
	}

	@Override
	public void deleteLoan(int loanId) {
		// TODO Auto-generated method stub
		loanRepository.deleteById(loanId);
	}

	@Override
	public void payEmi(int loanId, double amount) {
		// TODO Auto-generated method stub
		 LoanAccount loan = loanRepository.findById(loanId).get();

	        double totalPaid = loan.getEmiPaid() + amount;
	        loan.setEmiPaid(totalPaid);

	        if (totalPaid >= loan.getLoanAmount()) {
	            loan.setLoanStatus("CLOSED");
	        } else {
	            loan.setLoanStatus("ACTIVE");
	        }
	        
	        loanRepository.save(loan);
	}

}
