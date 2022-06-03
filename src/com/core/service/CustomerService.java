package com.core.service;

import java.util.List;

import com.common.utils.Page;
import com.core.po.Customer;

public interface CustomerService {
	// 查询客户列表
		public Page<Customer> findCustomerList(Integer page, Integer rows, 
	                                        String custName,String custState,
	                                        String custIndustry,String custLevel);

		public int createCustomer(Customer customer);

		public Customer getCustomerById(Integer id);

		public int updateCustomer(Customer customer);

		int deleteCustomer(Integer id);

		public List<Customer> findCustomerId();
}
