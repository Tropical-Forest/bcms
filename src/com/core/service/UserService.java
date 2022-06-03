package com.core.service;

import com.common.utils.Page;
import com.core.po.Customer;
import com.core.po.User;

/*
 * 用户Service层接口
 */
public interface UserService {
	//通过账号和密码查询客户
	public User findUser(String usercode, String password);
	// 查询用户列表
	public Page<User> findUserList(Integer page, Integer rows, 
		                           String user_level,String user_code,
		                           String user_name,String user_password,String user_state);
	public int createUser(User user);
	public User getUserById(Integer id);
	public int updateUser(User user);
	public int deleteUser(Integer id);
}
