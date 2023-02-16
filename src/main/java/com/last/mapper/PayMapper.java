package com.last.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.last.dto.HobongDto;
import com.last.dto.PayBankDto;
import com.last.dto.PaybaseDto;
import com.last.vo.PayBankInfo;
import com.last.vo.PayInsurance;
import com.last.vo.PaySalaryTax;

@Mapper
public interface PayMapper {

	List<PayBankInfo> getPaybankInfo();
	
	List<HobongDto> getHobong();
	
	List<PaySalaryTax> getAllTaxs();
	
	List<PayInsurance> getInsurances();
	
	List<PaybaseDto> getPaybase();
	
	PayBankDto getPaybank(int employeeNo);

	PayBankInfo getPaybankInfo(int employeeNo);
		
	
	
}
