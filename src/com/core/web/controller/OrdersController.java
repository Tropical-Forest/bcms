package com.core.web.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utils.Page;
import com.core.po.BaseDict;
import com.core.po.Customer;
import com.core.po.Orders;
import com.core.po.User;
import com.core.service.BaseDictService;
import com.core.service.CustomerService;
import com.core.service.OrdersService;

/**
 * 订单管理控制器类
 */
@Controller
public class OrdersController {
	// 依赖注入
		@Autowired
		private OrdersService ordersService;
		@Autowired
		private CustomerService customerService;
		@Autowired
		private BaseDictService baseDictService;
		// 缴费类型
			@Value("${pay_type}")
			private String PAY_TYPE;
			
			/**
			 *  订单列表
			 */
			@RequestMapping(value = "/orders/list.action")
			public String list(@RequestParam(defaultValue="1")Integer page,
					@RequestParam(defaultValue="10")Integer rows, 
					Integer order_id,String cust_name,String order_create_name,String pay_type,  Model model) {
				// 条件查询所有订单
				Page<Orders> orders = ordersService
						.findOrdersList(page, rows,order_id,cust_name, order_create_name,pay_type );
				model.addAttribute("page", orders);
				// 缴费类型
				List<BaseDict> payType = baseDictService
						.findBaseDictByTypeCode(PAY_TYPE);
				// 客户编号
				List<Customer> cust_id = customerService.findCustomerId();
				List<String> mypay_time = new ArrayList();
				// 添加参数
				model.addAttribute("order_id", order_id);
				model.addAttribute("cust_id", cust_id);
				model.addAttribute("cust_name", cust_name);
				model.addAttribute("order_create_name", order_create_name);
				model.addAttribute("pay_type", payType);
				return "order";
			}
			/*
			 * 创建订单
			 */
			@RequestMapping("/orders/create.action")
			@ResponseBody
			public String ordersCreate(Orders orders,HttpSession session) {
				Integer order_create_id;
				String cust_name;
				String order_create_name;
				Date date = new Date();
				//Date expir_time;
				Integer pay_cost;
				Integer pay_type = Integer.parseInt(orders.getPay_type()); 
				cust_name = ordersService.findCustNameById(orders.getCust_id());
				orders.setCust_name(cust_name);
				User user = (User) session.getAttribute("USER_SESSION");
				orders.setOrder_create_id(user.getUser_id());
				order_create_name = ordersService.findOrderCreateNameById(orders.getOrder_create_id());
				orders.setOrder_create_name(order_create_name);
				if(pay_type == 39) {
					pay_cost = 36;
					orders.setPay_cost(pay_cost);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Timestamp timeStamp = new Timestamp(date.getTime());
					orders.setPay_time(sdf.format(timeStamp));
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(date);
					calendar.add(Calendar.MONTH, +1);
					String expir_time = sdf.format(calendar.getTime());
					orders.setExpir_time(expir_time);
					
					
				}else if(pay_type == 40){
					pay_cost = 360;
					orders.setPay_cost(pay_cost);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Timestamp timeStamp = new Timestamp(date.getTime());
					orders.setPay_time(sdf.format(timeStamp));
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(date);
					calendar.add(Calendar.YEAR, +1);
					String expir_time = sdf.format(calendar.getTime());
					orders.setExpir_time(expir_time);
				}else{
					return "FAIL";
				}
				
			    int rows = ordersService.createOrders(orders);
			    if(rows > 0){
			        return "OK";
			    }else{
			        return "FAIL";
			    }
			}
		
			/**
			 * 通过id获取订单信息
			 */
			@RequestMapping("/orders/getOrdersById.action")
			@ResponseBody
			public Orders getOrdersById(Integer id) {
			    Orders orders = ordersService.getOrdersById(id);
			    return orders;
			}
			/**
			 * 更新订单
			 */
			@RequestMapping("/orders/update.action")
			@ResponseBody
			public String ordersUpdate(Orders orders,HttpSession session) {
				String cust_name;
				Date date = new Date();
				Integer pay_cost;
				Integer pay_type = Integer.parseInt(orders.getPay_type());
				cust_name = ordersService.findCustNameById(orders.getCust_id());
				orders.setCust_name(cust_name);
				if(pay_type == 39) {
					pay_cost = 36;
					orders.setPay_cost(pay_cost);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Timestamp timeStamp = new Timestamp(date.getTime());
					orders.setPay_time(sdf.format(timeStamp));
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(date);
					calendar.add(Calendar.MONTH, +1);
					String expir_time = sdf.format(calendar.getTime());
					orders.setExpir_time(expir_time);
				}else if(pay_type == 40){
					pay_cost = 360;
					orders.setPay_cost(pay_cost);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Timestamp timeStamp = new Timestamp(date.getTime());
					orders.setPay_time(sdf.format(timeStamp));
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(date);
					calendar.add(Calendar.YEAR, +1);
					String expir_time = sdf.format(calendar.getTime());
					orders.setExpir_time(expir_time);
				}else{
					return "FAIL";
				}
			    int rows = ordersService.updateOrders(orders);
			    if(rows > 0){
			        return "OK";
			    }else{
			        return "FAIL";
			    }
			}
			/**
			 * 删除订单
			 */
			@RequestMapping("/orders/delete.action")
			@ResponseBody
			public String ordersDelete(Integer id) {
			    int rows = ordersService.deleteOrders(id);
			    if(rows > 0){			
			        return "OK";
			    }else{
			        return "FAIL";			
			    }
			}
}
