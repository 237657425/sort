package com.springmvc.test.util;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.BeanFactoryAware;
import org.springframework.stereotype.Component;

import com.springmvc.test.domain.UserInfo;

@Component
public class UserInfoListInit implements BeanFactoryAware{

	@Override
	public void setBeanFactory(BeanFactory beanFactory) throws BeansException {
		
		UserInfo userInfo = new UserInfo();
		userInfo.setId(1);
		userInfo.setLoginname("andy");
		userInfo.setName("Andy");
		userInfo.setPassword(MD5Utils.StringToMD5("123456"));
		UserInfoList.addUserInfoToList(userInfo);
		
	    userInfo = new UserInfo();
		userInfo.setId(2);
		userInfo.setLoginname("carl");
		userInfo.setName("Carl");
		userInfo.setPassword(MD5Utils.StringToMD5("123456"));
		UserInfoList.addUserInfoToList(userInfo);
		
		userInfo = new UserInfo();
		userInfo.setId(3);
		userInfo.setLoginname("bruce");
		userInfo.setName("Bruce");
		userInfo.setPassword(MD5Utils.StringToMD5("123456"));
		UserInfoList.addUserInfoToList(userInfo);
		
		userInfo = new UserInfo();
		userInfo.setId(4);
		userInfo.setLoginname("dolly");
		userInfo.setName("Dolly");
		userInfo.setPassword(MD5Utils.StringToMD5("123456"));
		UserInfoList.addUserInfoToList(userInfo);
		
	}
	
}
