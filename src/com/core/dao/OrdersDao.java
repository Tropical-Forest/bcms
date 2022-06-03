package com.core.dao;

import java.util.List;

import com.core.po.Orders;

/*
 * Order接口
 */
public interface OrdersDao {
	//订单列表
	public List<Orders> selectOrdersList(Orders orders);
	// 订单数
	public Integer selectOrdersListCount(Orders orders);
	public int createOrders(Orders orders);
	
	public String findCustNameById(Integer cust_id);
	public String findOrderCreateNameById(Integer order_create_id);
	public Orders getOrdersById(Integer id);
	public int updateOrders(Orders orders);
	public int deleteOrders(Integer id);
}
