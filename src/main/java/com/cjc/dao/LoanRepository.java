package com.cjc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cjc.model.LoanAccount;

@Repository
public interface LoanRepository extends JpaRepository<LoanAccount, Integer>{

}
