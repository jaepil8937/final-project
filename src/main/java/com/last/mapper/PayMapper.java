package com.last.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.last.vo.PayInsurance;
import com.last.vo.PaySalaryTax;

@Mapper
public interface PayMapper {

	 List<PaySalaryTax> getAllTaxs();
	 List<PayInsurance> getInsurances();
}
