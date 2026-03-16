package com.cjc.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor  
@AllArgsConstructor
@Table(name = "loan_account")
public class LoanAccount {

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY) 
	    private Integer loanId;               

	    private String customerName;      
	    private String customerEmail;     
	    private String loanType;          

	    private double loanAmount;       
	    private double interestRate;      
	    private int tenureYears;          

	    private double emiAmount;         
	    private Double emiPaid;           
	    private String loanStatus;
	
}
