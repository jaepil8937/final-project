package com.last.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.last.vo.VacationItems;

@Mapper
public interface VacationMapper {
	List<VacationItems> getItems();
}
