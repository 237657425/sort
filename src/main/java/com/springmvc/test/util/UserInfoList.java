package com.springmvc.test.util;

import java.util.ArrayList;
import java.util.List;

import com.springmvc.test.domain.UserInfo;

public class UserInfoList {
	
	private static List<UserInfo> userInfoList;

	static{
		userInfoList = new ArrayList<UserInfo>();
	}
	
	public static List<UserInfo> getUserInfoList(){
		return userInfoList;
	}
	
	public static void addUserInfoToList(UserInfo userInfo){
		userInfoList.add(userInfo);
	}
	
	public static void addALLUserInfoToList(List<UserInfo> userInfos){
		userInfoList.addAll(userInfos);
	}
	
	public static UserInfo getUserInfoByNameAndPassWord(String name, String passWord){
		UserInfo resultUserInfo = new UserInfo();
		for (UserInfo userInfo : userInfoList) {
			if(userInfo.getName().equals(name) && userInfo.getPassword().equals(MD5Utils.StringToMD5(passWord))){
				resultUserInfo = userInfo;
				break;
			}
		}
		return resultUserInfo;
	}
	
	public static Long getLastUserInfoId(){
		return userInfoList.get(userInfoList.size()-1).getId();
	}
	
	public static int getIndexOfUserInfoList(UserInfo userInfo){
		for (int i = 0; i< userInfoList.size(); i++) {
			if(userInfo == userInfoList.get(i)){
				return i;
			}
		}
		return -1;
	}

	public static void deleteUserInfoByIndexId(int indexId) {
		userInfoList.remove(indexId);
	}
}
