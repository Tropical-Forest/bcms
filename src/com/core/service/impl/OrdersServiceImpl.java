package com.core.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.common.utils.Page;
import com.core.dao.OrdersDao;
import com.core.po.Orders;
import com.core.service.OrdersService;

/*
 * 订单管理
 */
@Service("OrdersService")
@Transactional
public class OrdersServiceImpl implements OrdersService {
	@Autowired
	private OrdersDao ordersDao;

	@Override
	public Page<Orders> findOrdersList(Integer page, Integer rows, Integer order_id, String cust_name, String order_create_name,
			String pay_type) {
		// 创建订单对象
		Orders orders = new Orders();
		//判断订单编号
		if (order_id != null) {
			orders.setOrder_id(order_id);
		}
		// 判断客户名称
		if (StringUtils.isNoneBlank(cust_name)) {
			orders.setCust_name(cust_name);
		}
		// 判断创建者名称
		if (StringUtils.isNoneBlank(order_create_name)) {
			orders.setOrder_create_name(order_create_name);
		}
		// 判断缴费类型，包月还是包年
		if (StringUtils.isNoneBlank(pay_type)) {
			orders.setPay_type(pay_type);
		}
		// 当前页
		orders.setStart((page - 1) * rows);
		// 每页数
		orders.setRows(rows);
		// 查询客户列表
		List<Orders> orderss = ordersDao.selectOrdersList(orders);
		// 查询客户列表总记录数
		Integer count = ordersDao.selectOrdersListCount(orders);
		Page<Orders> result = new Page<>();
		result.setPage(page);
		result.setRows(orderss);
		result.setSize(rows);
		result.setTotal(count);
		return result;

	}

	@Override
	public int createOrders(Orders orders) {
		return ordersDao.createOrders(orders);
	}

	@Override
	public String findCustNameById(Integer cust_id) {
		return ordersDao.findCustNameById(cust_id);
	}

	@Override
	public String findOrderCreateNameById(Integer order_create_id) {
		return ordersDao.findOrderCreateNameById(order_create_id);
	}

	@Override
	public Orders getOrdersById(Integer id) {
		return ordersDao.getOrdersById(id);
	}

	@Override
	public int updateOrders(Orders orders) {
		// TODO Auto-generated method stub
		return ordersDao.updateOrders(orders);
	}

	@Override
	public int deleteOrders(Integer id) {
		// TODO Auto-generated method stub
		return ordersDao.deleteOrders(id);
	}

}
