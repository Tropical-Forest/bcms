package com.core.po;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
/*
 * 订单持久化类
 */
public class Orders implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer order_id; //订单编号
	private Integer cust_id; //客户编号
	private String cust_name; //客户名称
	private Integer order_create_id; //创建者编号
	private String order_create_name; //创建者名称
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private String pay_time; //缴款日期
	private String pay_type; //缴款类型
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private String expir_time; //到期日期
	private Integer pay_cost; //费用
	private Integer start; //起始行
	private Integer rows; //所取行数
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public Integer getCust_id() {
		return cust_id;
	}
	public void setCust_id(Integer cust_id) {
		this.cust_id = cust_id;
	}
	public Integer getOrder_create_id() {
		return order_create_id;
	}
	public void setOrder_create_id(Integer order_create_id) {
		this.order_create_id = order_create_id;
	}
	
	public String getPay_time() {
		return pay_time;
	}
	
	public void setPay_time(String string) {
		this.pay_time = string;
	}
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	
	public String getExpir_time() {
		return expir_time;
	}

	public void setExpir_time(String expir_time2) {
		this.expir_time = expir_time2;
	}
	public Integer getPay_cost() {
		return pay_cost;
	}
	public void setPay_cost(Integer pay_cost2) {
		this.pay_cost = pay_cost2;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getOrder_create_name() {
		return order_create_name;
	}
	public void setOrder_create_name(String order_create_name) {
		this.order_create_name = order_create_name;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}

}
