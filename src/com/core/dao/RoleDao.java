package com.core.dao;

import java.util.List;

import com.core.po.Role;

/*
 * 角色Dao层接口
 */
public interface RoleDao {
	public List<Role> findRoleByUserId(int userId);
}
