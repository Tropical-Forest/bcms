package com.core.service;

import com.common.utils.Page;
import com.core.po.Orders;

public interface OrdersService {
	//查询订单列表
	public Page<Orders> findOrdersList(Integer page, Integer rows, Integer order_id, String cust_name,
			String order_create_name, String pay_type);

	public int createOrders(Orders orders);

	public String findCustNameById(Integer cust_id);

	public String findOrderCreateNameById(Integer order_create_id);

	public Orders getOrdersById(Integer id);

	public int updateOrders(Orders orders);

	public int deleteOrders(Integer id);

	

	

	
}
