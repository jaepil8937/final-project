package com.last.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.last.dto.VacationRequestDto;
import com.last.vo.VacationItem;

@Mapper
public interface VacationMapper {
	
	List<VacationItem> getItems();

	VacationItem getItemByCode(int code);

	void insertItem(VacationItem item);

	void updateItem(VacationItem item);

	List<VacationRequestDto> getUsedVacations(Map<String, Object> param);
}
