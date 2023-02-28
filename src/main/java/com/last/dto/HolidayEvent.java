package com.last.dto;

import java.util.Date;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HolidayEvent {  

	private String id;
	private Date start;
	private Date end;
	private String title;
	private boolean allDay;
	
	private String dateType;
	private String holidayType;
}
