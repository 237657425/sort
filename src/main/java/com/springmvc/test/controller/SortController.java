package com.springmvc.test.controller;

import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.test.domain.UserInfo;
import com.springmvc.test.util.MD5Utils;
import com.springmvc.test.util.SortByIdASC;
import com.springmvc.test.util.SortByIdDESC;
import com.springmvc.test.util.SortByNameASC;
import com.springmvc.test.util.UserInfoList;

@Controller
@RequestMapping("v1/con")
public class SortController{
	
	private static Logger log = LoggerFactory.getLogger(SortController.class);


	@RequestMapping(value="/login_page",method = RequestMethod.GET)
	public String loginPage(){
		return "sort/login";
	}
	
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public @ResponseBody String login(Model model, String name, String passWord){
		UserInfo userInfo = UserInfoList.getUserInfoByNameAndPassWord(name, passWord);
		if(userInfo == null){
			return "false";
		}else{
			return "true";
		}
	}
	
	@RequestMapping(value="/list_page",method = RequestMethod.GET)
	public String listPage(){
		return "sort/list";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/listByCondition",method = RequestMethod.GET)
	public @ResponseBody List<UserInfo> listByCondition(String condition){
		if(condition == null || condition.equals("")){
			return null;
		}else{
			List<UserInfo> userInfoList = UserInfoList.getUserInfoList();
			log.info("入参 condition=" + condition);
			if(condition.equals("idAsc")){
				Collections.sort(userInfoList, new SortByIdASC());
			}else if(condition.equals("idDesc")){
				Collections.sort(userInfoList, new SortByIdDESC());
			}else if(condition.equals("nameAsc")){
				Collections.sort(userInfoList, new SortByNameASC());
			}else if(condition.equals("nameDesc")){
				Collections.sort(userInfoList, new SortByNameASC());
				Collections.reverse(userInfoList);
			}
			return userInfoList;
		}
	}
	
	@RequestMapping(value="/createUser",method = RequestMethod.GET)
	public @ResponseBody String createUser(String loginName, String name, String password){
		if(name == null || name.equals("") || password == null || password.equals("") || loginName == null || loginName.equals("") ){
			return null;
		}else{
			log.info("入参 loginName=" + loginName + " name=" + name + " password=" + password);
			UserInfo userInfo = new UserInfo();
			userInfo.setId(UserInfoList.getLastUserInfoId() + 1);
			userInfo.setLoginname(loginName);
			userInfo.setName(name);
			userInfo.setPassword(MD5Utils.StringToMD5(password));
			UserInfoList.addUserInfoToList(userInfo);
			return "true";
		}
	}
	
	@RequestMapping(value="/deleteUser",method = RequestMethod.GET)
	public @ResponseBody String deleteUser(String indexId){
		log.info("入参 indexId=" + indexId );
		if(indexId == null || indexId.equals("") ){
			return null;
		}else{
			UserInfoList.deleteUserInfoByIndexId(Integer.parseInt(indexId));
			return "true";
		}
	}
	
	@RequestMapping(value="/updateUser",method = RequestMethod.GET)
	public @ResponseBody String updateUser(String name, String indexId){
		log.info("入参 indexId=" + indexId);
		if(indexId == null || indexId.equals("") ){
			return null;
		}else{
			int index = Integer.parseInt(indexId);
			UserInfo userInfo = UserInfoList.getUserInfoList().get(index);
			userInfo.setName(name);
			UserInfoList.getUserInfoList().set(index, userInfo);
			return "true";
		}
	}
}
