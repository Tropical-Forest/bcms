<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<%
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	String date= format.format(new Date());
	//Date date = new Date();
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
	<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
  <!-- 导航栏部分 -->
  <nav class="navbar navbar-default navbar-static-top" role="navigation"
		 style="margin-bottom: 0">
	<div class="navbar-header">
		<a class="navbar-brand" href="<%=basePath%>customer/list.action">客户管理系统 </a>
	</div>
	<!-- 导航栏右侧图标部分 -->
	<ul class="nav navbar-top-links navbar-right">
	   
		<!-- 信息和系统设置 start -->
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#"><i class="fa fa-user fa-fw"></i>
				           <c:if test="${USER_SESSION.user_level==35}">
							管理员:${USER_SESSION.user_name}
						</c:if>
						<c:if test="${USER_SESSION.user_level==36}">
							普通用户:${USER_SESSION.user_name}
						</c:if>
				    </a>
				</li>
				<li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
				<li class="divider"></li>
				<li>
					<a href="${pageContext.request.contextPath }/logout.action">
					<i class="fa fa-sign-out fa-fw"></i>退出登录
					</a>
				</li>
			</ul> 
		</li>
		<!-- 信息和系统设置结束 -->
	</ul>
	<!-- 左侧显示列表部分 start-->
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<!-- <li class="sidebar-search">
					<div class="input-group custom-search-form">
						<input type="text" class="form-control" placeholder="查询内容...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
					</div> 
				</li> -->
				<c:if test="${USER_SESSION.user_level=='35'}">
				<li>
				      <a href="${pageContext.request.contextPath }/user/list.action" >
				      <i class="fa fa-dashboard fa-fw" ></i> 用户管理
				    </a>
				</li>
				</c:if>
				<li>
				    <a href="${pageContext.request.contextPath }/customer/list.action" >
				      <i class="fa fa-edit fa-fw"></i> 客户管理
				    </a>
				</li>
				<li>
				      <a href="${pageContext.request.contextPath }/orders/list.action" class="active">
				      <i class="fa fa-dashboard fa-fw" ></i> 订单管理
				    </a>
				</li>
				
			</ul>
		</div>
	</div>
	<!-- 左侧显示列表部分 end--> 
  </nav>
    <!-- 客户列表查询部分  start-->
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">订单管理</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="panel panel-default">
			<div class="panel-body">
				<form class="form-inline" method="get" 
				      action="${pageContext.request.contextPath }/orders/list.action">
				      <div class="form-group">
						<label for="order_id">订单编号</label> 
						<input type="text" class="form-control" id="order_id" 
						                   value="${ order_id }" name="order_id" />
					</div>
					<div class="form-group">
						<label for="cust_name">客户名称</label> 
						<input type="text" class="form-control" id="cust_name" 
						                   value="${cust_name }" name="cust_name" />
					</div>
					<div class="form-group">
						<label for="order_create_name">创建者名称</label> 
						<input type="text" class="form-control" id="order_create_name" 
						                   value="${order_create_name }" name="order_create_name" />
					</div>
					<div class="form-group">
						<label for="pay_type">缴费类型</label>
						<select	class="form-control" id="pay_type" name="pay_type">
							<option value="">--请选择--</option>
							<c:forEach items="${pay_type}" var="item">
								<option value="${item.dict_id}"
								        <c:if test="${item.dict_id == pay_type}"> selected</c:if>>
								    ${item.dict_item_name }
								</option>
							</c:forEach>
						</select>
					</div>
					<button type="submit" class="btn btn-primary">查询</button>
				</form>
			</div>
		</div>
		<a href="#" class="btn btn-primary" data-toggle="modal" 
		           data-target="#newOrdersDialog" onclick="clearOrders()">新建</a>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">订单信息列表</div>
					<!-- /.panel-heading -->
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>订单编号</th>
								<th>客户编号</th>
								<th>客户名称</th>
								<th>创建者编号</th>
								<th>创建者名称</th>
								<th>缴费日期</th>
								<th>缴费类型</th>
								<th>到期日期</th>
								<th>费用</th>
								<th>提醒</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.order_id}</td>
									<td>${row.cust_id}</td>
									<td>${row.cust_name}</td>
									<td>${row.order_create_id}</td>
									<td>${row.order_create_name}</td>
								    <td>${row.pay_time}</td>
								    <td>${row.pay_type}</td>
								    <td>${row.expir_time}</td>
								    <td>${row.pay_cost}</td>
								    <td></td>
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#ordersRenewDialog" onclick= "renewOrders(${row.order_id})">续费</a>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#ordersEditDialog" onclick= "editOrders(${row.order_id})">修改</a>
										<a href="#" class="btn btn-danger btn-xs" onclick="deleteOrders(${row.order_id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12 text-right">
						<itheima:page url="${pageContext.request.contextPath }/orders/list.action" />
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
<div class="modal fade" id="newOrdersDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新建订单信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="new_orders_form">
				<!-- <div class="form-group">
						<label for="new_order_id" class="col-sm-2 control-label">
						    订单编号
						</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_order_id" placeholder="订单编号 " name="order_id" />
						</div>
					</div> -->
				<div class="form-group">
						<label for="new_cust_id" style="float:left;padding:7px 15px 0 27px;">客户编号</label> 
						<div class="col-sm-10">
							<select	class="form-control" id="new_cust_id" name="cust_id">
								<option value="">--请选择--</option>
								<c:forEach items="${cust_id}" var="item">
									<option value="${item.cust_id}">
									${item.cust_id }									
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="new_pay_type" style="float:left;padding:7px 15px 0 27px;">缴费类型</label> 
						<div class="col-sm-10">
							<select	class="form-control" id="new_pay_type" name="pay_type">
								<option value="">--请选择--</option>
								<c:forEach items="${pay_type}" var="item">
									<option value="${item.dict_id}"
								       <c:if test="${item.dict_id == pay_type}">selected</c:if>>
								    ${item.dict_item_name }
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="createOrders()">创建订单</button>
			</div>
		</div>
	</div>
</div>
<!-- 修改客户模态框 -->
<div class="modal fade" id="ordersEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改订单信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_order_form">
					<input type="hidden" id="edit_order_id" name="order_id"/>
					
 					<!-- <div class="form-group">
						<label for="edit_order_id" class="col-sm-2 control-label">订单编号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_order_id" placeholder="订单编号 " name="edit_order_id" />
						</div>
					</div> -->
					<div class="form-group">
						<label for="edit_cust_id" style="float:left;padding:7px 15px 0 27px;">客户编号</label> 
						<div class="col-sm-10">
							<select	class="form-control" id="edit_cust_id" name="cust_id">
								<option value="">--请选择--</option>
								<c:forEach items="${cust_id}" var="item">
									<option value="${item.cust_id}">
									${item.cust_id }									
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_pay_type" style="float:left;padding:7px 15px 0 27px;">缴费类型</label> 
						<div class="col-sm-10">
							<select	class="form-control" id="edit_pay_type" name="pay_type">
								<option value="">--请选择--</option>
								<c:forEach items="${pay_type}" var="item">
									<option value="${item.dict_id}"
								       <c:if test="${item.dict_id == pay_type}">selected</c:if>>
								    ${item.dict_item_name }
									</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateOrders()">保存修改</button>
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



//清空新建订单窗口中的数据
	function clearOrders() {
	    $("#new_order_id").val("");
	    $("#new_order_create_id").val("")
	    $("#new_cust_id").val("")
	    $("#new_pay_type").val("")
	    $("#new_pay_time").val("");
	}
	// 创建订单
	function createOrders() {
	$.post("<%=basePath%>orders/create.action",
	$("#new_orders_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("订单创建成功！");
	            window.location.reload();
	        }else{
	            alert("订单创建失败！");
	            window.location.reload();
	        }
	    });
	}
	// 通过id获取修改的客户信息
	function editOrders(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>orders/getOrdersById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#edit_cust_id").val(data.cust_id);
	            $("#edit_order_id").val(data.order_id);
	            $("#edit_pay_type").val(data.pay_type);
	            //$("#edit_order_create_id").val(data.order_create_id);
	            
	        }
	    });
	}
    // 执行修改客户操作
	function updateOrders() {
		$.post("<%=basePath%>orders/update.action",$("#edit_order_form").serialize(),function(data){
			if(data =="OK"){
				alert("客户信息更新成功！");
				window.location.reload();
			}else{
				alert("客户信息更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除客户
	function deleteOrders(id) {
	    if(confirm('确实要删除该订单吗?')) {
	$.post("<%=basePath%>orders/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("订单删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除订单失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>