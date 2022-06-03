package com.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.core.po.User;

/*
 * 用户DAO层接口
 */
public interface UserDao {
	/*
	 * 通过账号和密码查询用户
	 */
	public User findUser(@Param("usercode") String usercode, @Param("password") String password);
	// 用户列表
	public List<User> selectUserList(User user);
	// 用户数
	public Integer selectUserListCount(User user);
	public int createUser(User user);
	public User getUserById(Integer id);
	public int updateUser(User user);
	public int deleteUser(Integer id);
	
	
	
}
