<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客户管理-BCMS</title>
<!-- 引入css样式文件 -->
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div id="wrapper">
		<!-- 导航栏部分 -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<a class="navbar-brand" href="<%=basePath%>user/list.action">客户管理系统
				</a>
			</div>
			<!-- 导航栏右侧图标部分 -->
			<ul class="nav navbar-top-links navbar-right">
				
				
				
				<!-- 信息和系统设置 start -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
						<i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i>
						<c:if test="${USER_SESSION.user_level==35}">
							管理员:${USER_SESSION.user_name}
						</c:if>
						<c:if test="${USER_SESSION.user_level==36}">
							普通普通:${USER_SESSION.user_name}
						</c:if>
						</a>
						</li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
						<li class="divider"></li>
						<li><a
							href="${pageContext.request.contextPath }/logout.action"> <i
								class="fa fa-sign-out fa-fw"></i>退出登录
						</a></li>
					</ul></li>
				<!-- 信息和系统设置结束 -->
			</ul>
			<!-- 左侧显示列表部分 start-->
			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<!-- <li class="sidebar-search">
					<div class="input-group user-search-form">
						<input type="text" class="form-control" placeholder="查询内容...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
					</div> 
				</li> -->
						<c:if test="${USER_SESSION.user_level=='35'}">
							<li><a
								href="${pageContext.request.contextPath }/user/list.action"
								class="active"> <i class="fa fa-dashboard fa-fw"></i> 用户管理
							</a></li>
						</c:if>
						<li><a
							href="${pageContext.request.contextPath }/customer/list.action">
								<i class="fa fa-edit fa-fw"></i> 客户管理
						</a></li>
						<li><a
							href="${pageContext.request.contextPath }/orders/list.action">
								<i class="fa fa-dashboard fa-fw"></i> 订单管理
						</a></li>

					</ul>
				</div>
			</div>
			<!-- 左侧显示列表部分 end-->
		</nav>
		<!-- 客户列表查询部分  start-->
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">用户管理</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" method="get"
						action="${pageContext.request.contextPath }/user/list.action">
						<div class="form-group">
							<label for="user_name">用户名称</label> <input type="text"
								class="user_name" id="user_name" value="${user_name }"
								name="user_name" />
						</div>
						<div class="form-group">
							<label for="user_state">用户状态</label> <select class="form-control"
								id="user_state" name="user_state">
								<option value="">--请选择--</option>
								<c:forEach items="${stateType}" var="item">
									<option value="${item.dict_id}"
										<c:if test="${item.dict_id == user_state}">selected</c:if>>
										${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<%-- <div class="form-group">
						<label for="custIndustry">所属行业</label> 
						<select	class="form-control" id="custIndustry"  name="custIndustry">
							<option value="">--请选择--</option>
							<c:forEach items="${industryType}" var="item">
								<option value="${item.dict_id}"
								        <c:if test="${item.dict_id == custIndustry}"> selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
					</div> --%>
						<div class="form-group">
							<label for="user_level">用户级别</label> <select class="form-control"
								id="user_level" name="user_level">
								<option value="">--请选择--</option>
								<c:forEach items="${userType}" var="item">
									<option value="${item.dict_id}"
										<c:if test="${item.dict_id == user_level}"> selected</c:if>>
										${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>
			<a href="#" class="btn btn-primary" data-toggle="modal"
				data-target="#newUserDialog" onclick="clearUser()">新建</a>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">用户信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>编号</th>
									<th>用户级别</th>
									<th>用户账号</th>
									<th>用户名称</th>
									<th>用户密码</th>
									<th>用户状态</th>
									<th>创建时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.user_id}</td>
										<td>${row.user_level}</td>
										<td>${row.user_code}</td>
										<td>${row.user_name}</td>
										<td>${row.user_password}</td>
										<td>${row.user_state}</td>
										
										<td>${row.user_createtime}</td>
										<td><a href="#" class="btn btn-primary btn-xs"
											data-toggle="modal" data-target="#userEditDialog"
											onclick="editUser(${row.user_id})">修改</a> <a href="#"
											class="btn btn-danger btn-xs"
											onclick="deleteUser(${row.user_id})">删除</a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<itheima:page
								url="${pageContext.request.contextPath }/user/list.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- 客户列表查询部分  end-->
	</div>
	<!-- 创建客户模态框 -->
	<div class="modal fade" id="newUserDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新建用户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_user_form">
						<div class="form-group">
							<label for="new_user_level"
								style="float: left; padding: 7px 15px 0 27px;">用户级别</label>
							<div class="col-sm-10">
								<select class="form-control" id="new_user_level"
									name="user_level">
									<option value="">--请选择--</option>
									<c:forEach items="${userType}" var="item">
										<option value="${item.dict_id}"
											<c:if test="${item.dict_id == user_level}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="new_userCode"
								style="float: left; padding: 7px 15px 0 27px;">用户账号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_userCode"
									placeholder="用户账号" name="user_code" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_userName" class="col-sm-2 control-label">
								用户名称 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="new_userName"
									placeholder="用户名称" name="user_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_userPassword" class="col-sm-2 control-label">
								用户密码 </label>
							<div class="col-sm-10">
								<input type="password" class="form-control"
									id="new_userPassword" placeholder="用户密码" name="user_password" />
							</div>
						</div>
						<div class="form-group">
							<label for="new_userFrom"
								style="float: left; padding: 7px 15px 0 27px;">用户状态</label>
							<div class="col-sm-10">
								<select class="form-control" id="new_userFrom" name="user_state">
									<option value="">--请选择--</option>
									<c:forEach items="${stateType}" var="item">
										<option value="${item.dict_id}"
											<c:if test="${item.dict_id == user_Sate}">selected</c:if>>
											${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="createUser()">创建用户</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 修改客户模态框 -->
	<div class="modal fade" id="userEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_user_form">
						<input type="hidden" id="edit_user_id" name="user_id" />
						<div class="form-group">
							<label for="edit_user_level"
								style="float: left; padding: 7px 15px 0 27px;">用户级别</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_user_level"
									name="user_level">
									<option value="">--请选择--</option>
									<c:forEach items="${userType}" var="item">
										<option value="${item.dict_id}"
											<c:if test="${item.dict_id == user_level}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="dit_userCode"
								style="float: left; padding: 7px 15px 0 27px;">用户账号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userCode"
									placeholder="用户账号" name="user_code" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_userName" class="col-sm-2 control-label">用户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userName"
									placeholder="用户名称" name="user_name" />
							</div>
						</div>
						<div class="form-group">
							<label for="dit_userPassword"
								style="float: left; padding: 7px 15px 0 27px;">用户密码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userPassword"
									placeholder="用户密码" name="user_password" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_userFrom"
								style="float: left; padding: 7px 15px 0 27px;">用户状态</label>
							<div class="col-sm-10">
								<select class="form-control" id="edit_userFrom"
									name="user_state">
									<option value="">--请选择--</option>
									<c:forEach items="${stateType}" var="item">
										<option value="${item.dict_id}"
											<c:if test="${item.dict_id == user_State}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>

							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary"
						onclick="updateUser()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 引入js文件 -->
	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>
	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>
	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	<!-- 编写js代码 -->
	<script type="text/javascript">
//清空新建客户窗口中的数据
	function clearUser() {
	    $("#new_userName").val("");
	    $("#new_userFrom").val("")
	    $("#new_userIndustry").val("")
	    $("#new_user_level").val("")
	    $("#new_userPassword").val("")
	}
	// 创建客户
	function createUser() {
	$.post("<%=basePath%>user/create.action",
	$("#new_user_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("客户创建成功！");
	            window.location.reload();
	        }else{
	            alert("客户创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的客户信息
	function editUser(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>user/getUserById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_user_id").val(data.user_id);
	            $("#edit_userName").val(data.user_name);
	            $("#edit_userFrom").val(data.user_state);
	            $("#edit_userCode").val(data.user_code);
	            $("#edit_user_level").val(data.user_level);
	            $("#edit_userPassword").val("");
	            
	        }
	    });
	}
    // 执行修改客户操作
	function updateUser() {
		$.post("<%=basePath%>user/update.action",$("#edit_user_form").serialize(),function(data){
			if(data =="OK"){
				alert("客户信息更新成功！");
				window.location.reload();
			}else{
				alert("客户信息更新失败");
				window.location.reload();
			}
		});
	}
	// 删除客户
	function deleteUser(id) {
	    if(confirm('确实要删除该用户吗?')) {
	$.post("<%=basePath%>user/ddelete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("用户删除成功！");
	                window.location.reload();
	            }else{
	                alert("用户客户失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>