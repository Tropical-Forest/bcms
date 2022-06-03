<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户管理系统登录页面</title>
    <link href="${pageContext.request.contextPath}/css/denglu.css"
	type=text/css rel=stylesheet>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
	
</script>
<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
<script>
	// 判断是登录账号和密码是否为空
	function check() {
		var usercode = $("#usercode").val();
		var password = $("#password").val();
		if (usercode == "" || password == "") {
			$("#message").text("账号或密码不能为空！");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
<body>
    <div class="box">
        <h2>欢迎使用宽带客户管理系统</h2>
        <form action="${pageContext.request.contextPath }/login.action"
							method="post" onsubmit="return check()">
			<font color="red"> <%-- 提示信息--%> <span id="message">${msg}</span>
						</font>
            <div class="inputbox">
                <input type="text" name="usercode" required="">
                <label>账号</label>
            </div>
            <div class="inputbox">
                <input type="password" name="password" required="">
                <label>密码</label>
            </div>
            <input type="submit" name="" value="登录">
        </form>
    </div>
</body>
</html>
</body>
</html>