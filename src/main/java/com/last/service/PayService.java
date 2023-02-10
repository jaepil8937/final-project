package com.last.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.last.dto.HobongDto;
import com.last.dto.PayBankDto;
import com.last.dto.PaybaseDto;
import com.last.mapper.PayMapper;
import com.last.vo.PayBankInfo;
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

	public List<HobongDto> getHobong() {
		return payMapper.getHobong();
	}

	public List<PaybaseDto> getPaybase() {
		return payMapper.getPaybase();
	}

	public PayBankDto getPaybank(int employeeNo) {
		PayBankDto payBankDto = payMapper.getPaybank(employeeNo);
		return payBankDto;
	}

	public PayBankInfo getPaybankInfo(int employeeNo) {
		PayBankInfo payBankInfo = payMapper.getPaybankInfo(employeeNo);
		return payBankInfo;
	}
	
}
