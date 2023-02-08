package com.last.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.mapper.PayMapper;
import com.last.vo.PayInsurance;
import com.last.vo.PaySalaryTax;

@Service
public class PayService {

	@Autowired
	private PayMapper payMapper;
	
	public List<PaySalaryTax> getAllTaxs() {
		return payMapper.getAllTaxs();
	}

	public List<PayInsurance> getInsurance() {
		return payMapper.getInsurances();
	}
	
}
