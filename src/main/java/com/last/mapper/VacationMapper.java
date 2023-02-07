package com.last.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.last.vo.VacationItem;

@Mapper
public interface VacationMapper {
	List<VacationItem> getItems();

	VacationItem getItemByCode();

	void insertItem(VacationItem item);

	void updateItem(VacationItem item);
}
