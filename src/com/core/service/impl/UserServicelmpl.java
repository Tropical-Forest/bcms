package com.core.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.common.utils.Page;
import com.core.dao.UserDao;
import com.core.po.Customer;
import com.core.po.User;
import com.core.service.UserService;

/*
 * 用户Service接口实现类
 */
@Service("userService")
@Transactional
public class UserServicelmpl implements UserService {
	// 注入UserDao
	@Autowired
	private UserDao userDao;

	@Override
	public User findUser(String usercode, String password) {
		User user = this.userDao.findUser(usercode, password);
		return user;
	}

	// 用户列表
	public Page<User> findUserList(Integer page, Integer rows, String user_level, String user_code, String user_name,
			String user_password,String user_state) {
		User user = new User();
		// 判断用户的角色id
		if (StringUtils.isNoneBlank(user_level)) {
			user.setuser_level(user_level);
		}
		// 判断用户的账号
		if (StringUtils.isNoneBlank(user_code)) {
			user.setUser_code(user_code);
		}
		// 判断用户的名称
		if (StringUtils.isNoneBlank(user_name)) {
			user.setUser_name(user_name);
		}
		// 判断用户密码
		if(StringUtils.isNoneBlank(user_password)){
			user.setUser_password(user_password);
		}
		// 判断用户的状态
		if (StringUtils.isNoneBlank(user_state)) {
			user.setUser_state(user_state);
		}
		// 当前页
		user.setStart((page - 1) * rows);
		// 每页数
		user.setRows(rows);
		// 查询用户列表
		List<User> users = userDao.selectUserList(user);
		// 查询用户列表总记录数
		Integer count = userDao.selectUserListCount(user);
		// 创建Page返回对象
		Page<User> result = new Page<>();
		result.setPage(page);
		result.setRows(users);
		result.setSize(rows);
		result.setTotal(count);
		return result;
	}
	
	/*
	 * 用户客户
	 */
	@Override
	public int createUser(User user) {
		
		return userDao.createUser(user);
	}

	@Override
	public User getUserById(Integer id) {
		User user = userDao.getUserById(id);
	    return user;	
	}

	@Override
	public int updateUser(User user) {
		 return userDao.updateUser(user);
	}

	@Override
	public int deleteUser(Integer id) {
		 return userDao.deleteUser(id);	
	}

}
