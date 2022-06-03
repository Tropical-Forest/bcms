package com.core.web.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.utils.CommonValue;
import com.common.utils.MD5Util;
import com.common.utils.Page;
import com.core.po.BaseDict;
import com.core.po.Customer;
import com.core.po.User;
import com.core.service.BaseDictService;
import com.core.service.UserService;

/*
 * 用户控制器类
 */
@Controller
public class UserController {
	// 依赖注入
	@Autowired
	private UserService userService;

	/*
	 * 用户登录
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(String usercode, String password, Model model, HttpSession session) {
		// 通过账号和密码查询用户
		User user = userService.findUser(usercode, MD5Util.MD5(password));

		if (user != null) {
			// 将用户对象添加到Session
			session.setAttribute("USER_SESSION", user);
			return "redirect:customer/list.action";

		} else {
			
			model.addAttribute("msg", "账号或密码错误，请重新输入！");
			return "login";
		}
	}

	/*
	 * 退出登录
	 */
	@RequestMapping(value = "/logout.action")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.action";
	}

	/*
	 * 向用户登录页面跳转
	 */
	@RequestMapping(value = "/login.action", method = RequestMethod.GET)
	public String toLogin() {
		return "login";
	}

	@Autowired
	private BaseDictService baseDictService;
	// 用户级别
	@Value("${user.user.type}")
	private String USER_TYPE;
	// 用户状态
	@Value("${user.state.type}")
	private String STATE_TYPE;

	/*
	 * 用户列表
	 */
	@RequestMapping(value = "/user/list.action")
	public String list(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10") Integer rows,
			String user_level, String user_code, String user_name, String user_password, String user_state,
			Model model) {
		// 条件查询用户客户
		Page<User> users = userService.findUserList(page, rows, user_level, user_code, user_name, user_password,
				user_state);
		model.addAttribute("page", users);
		// 用户状态
		List<BaseDict> stateType = baseDictService.findBaseDictByTypeCode(STATE_TYPE);
		// 角色级别
		List<BaseDict> userType = baseDictService.findBaseDictByTypeCode(USER_TYPE);
		// 添加参数
		model.addAttribute("stateType", stateType);
		model.addAttribute("userType", userType);
		model.addAttribute("user_level", user_level);
		model.addAttribute("user_code", user_code);
		model.addAttribute("user_name", user_name);
		model.addAttribute("user_password", user_password);
		model.addAttribute("user_state", user_state);
		return "user";
	}
	
	/**
	 * 创建用户
	 */
	@RequestMapping("/user/create.action")
	@ResponseBody
	public String customerCreate(User user,HttpSession session) {
		String password = MD5Util.MD5(user.getUser_password());
		user.setUser_password(password);
	    // 创建Date对象
	    Date date = new Date();
	    // 得到一个Timestamp格式的时间，存入mysql中的时间格式“yyyy/MM/dd HH:mm:ss”
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Timestamp timeStamp = new Timestamp(date.getTime());
	    user.setUser_createtime(sdf.format(timeStamp));
	    // 执行Service层中的创建方法，返回的是受影响的行数
	    int rows = userService.createUser(user);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}
	
	/**
	 * 通过id获取用户信息
	 */
	@RequestMapping("/user/getUserById.action")
	@ResponseBody
	public User getUserById(Integer id) {
	    User user = userService.getUserById(id);
	    return user;
	}
	/**
	 * 更新用户
	 */
	@RequestMapping("/user/update.action")
	@ResponseBody
	public String userUpdate(User user) {
		if(user.getUser_password()==""||user.getUser_password()==null){
			return "FAIL";
		}
		if(user.getuser_level()==""||user.getuser_level()==null){
			return "FAIL";
		}
		if(user.getUser_code()==""||user.getUser_code()==null){
			return "FAIL";
		}
		if(user.getUser_name()==""||user.getUser_name()==null){
			return "FAIL";
		}
		if(user.getUser_state()==""||user.getUser_state()==null){
			return "FAIL";
		}
		String password = MD5Util.MD5(user.getUser_password());
		user.setUser_password(password);
	    int rows = userService.updateUser(user);
	    if(rows > 0){
	        return "OK";
	    }else{
	        return "FAIL";
	    }
	}

	/**
	 * 删除客户
	 */
	@RequestMapping("/user/ddelete.action")
	@ResponseBody
	public String userDelete(Integer id) {
	    int rows = userService.deleteUser(id);
	    if(rows > 0){			
	        return "OK";
	    }else{
	        return "FAIL";			
	    }
	}
}
