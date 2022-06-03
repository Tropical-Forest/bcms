package com.core.po;

import java.io.Serializable;

public class Role implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer id; //角色id
	private String role_name; //角色名称
	private String role_Desc; //角色描述
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public String getRole_Desc() {
		return role_Desc;
	}
	public void setRole_Desc(String role_Desc) {
		this.role_Desc = role_Desc;
	}
	
}
