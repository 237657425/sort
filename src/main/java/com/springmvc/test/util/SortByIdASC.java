package com.springmvc.test.util;

import java.util.Comparator;

import com.springmvc.test.domain.UserInfo;

@SuppressWarnings("rawtypes")
public class SortByIdASC implements Comparator{

	@Override
	public int compare(Object o1, Object o2) {
		UserInfo ui1 = (UserInfo) o1;
		UserInfo ui2 = (UserInfo) o2;
		if(ui1.getId() > ui2.getId()){
			return 1;
		}else{
			return -1;
		}
	}
}
