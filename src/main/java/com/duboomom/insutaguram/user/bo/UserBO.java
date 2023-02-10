package com.duboomom.insutaguram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duboomom.insutaguram.common.EncryptUtils;
import com.duboomom.insutaguram.user.dao.UserDAO;
import com.duboomom.insutaguram.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	public int addUser(
			String loginId
			, String password
			, String name
			, String email) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, email);
		
	}
	
	public boolean checkDuplicateId(String loginId) {
		
		return userDAO.selectUserByLoginId(loginId);
		
	}
	
	public User getUser(String loginId, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
		
	}
	
	
}
