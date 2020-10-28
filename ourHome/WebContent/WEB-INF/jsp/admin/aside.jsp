<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img
					src="${pageContext.request.contextPath}/resources/${AdminInfo.pic}"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>${AdminInfo.realName}</p>
				<a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
			</div>
		</div>

		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">菜单</li>
			<li id="admin-index"><a
				href="${pageContext.request.contextPath}/admin/main"><i
					class="fa fa-dashboard"></i> <span>首页</span></a></li>
					
			<li class="treeview"><a
				href="${pageContext.request.contextPath}/admin/notice-list"> <i
					class="fa fa-envelope-o"></i><span>公告信息管理</span></a>
			</li>
			<li id="treeview">
						<a href="${pageContext.request.contextPath}/admin/convenient"> 
							<i class="fa fa-cubes"></i><span>便民信息管理</span>
						</a>
			</li>
			
			<li id="admin-login">
						<a href="${pageContext.request.contextPath}/admin/activity-list"> 
							<i class="fa fa-book"></i><span>社区活动管理</span>
						</a>
			</li>
					
			<li class="treeview">
						<a href="${pageContext.request.contextPath}/admin/reportInfo">
							<i class="fa fa-sticky-note-o"></i><span>体温上报信息</span>
				     	</a>
		    </li>
			<li id="admin-login">
						<a href="${pageContext.request.contextPath}/admin/userManage"> 
							<i class="fa fa-user-o"></i><span>居民注册信息</span>
						</a>
			</li>
			
				<li id="admin-login">
						<a href="${pageContext.request.contextPath}/admin/purchase"> 
							<i class="fa fa-shopping-bag"></i><span>代购服务安排</span>
						</a>
				</li>
			

<!--  
			<li class="treeview"><a href="#"> 
				<i class="fa fa-book"></i><span>信息审核</span>
					<span class="pull-right-container"> 
					<i class="fa fa-angle-left pull-right"></i>
				</span>
				</a>
				<ul class="treeview-menu">
					<li id="admin-login">
						<a href="${pageContext.request.contextPath}/admin/generalVerify"> 
							<i class="fa fa-circle-o"></i>普通信息审核
						</a>
					</li>
					
					<li id="admin-login">
						<a href="${pageContext.request.contextPath}/admin/elderlyVerify"> 
							<i class="fa fa-circle-o"></i>孤寡老人认证审核
						</a>
					</li>
				</ul></li>
			-->
			<li id="admin-login">
						<a href="${pageContext.request.contextPath}/admin/serviceAppoint"> 
							<i class="fa fa-cubes"></i><span>志愿服务</span>
						</a>
			</li>
			
			<li class="treeview"><a href="#"> 
				<i class="fa fa-pencil-square-o"></i><span>社区统计</span>
					<span class="pull-right-container"> 
					<i class="fa fa-angle-left pull-right"></i>
				</span>
				</a>
				<ul class="treeview-menu">
					<li id="admin-login">
						<a href="${pageContext.request.contextPath}/admin/resident"> 
							&nbsp; &nbsp; <i class="fa fa-circle-o"></i>居民登记
						</a>
					</li>
					<li id="admin-login">
						<a href="${pageContext.request.contextPath}/admin/visitor"> 
							&nbsp; &nbsp; <i class="fa fa-circle-o"></i>访客登记
						</a>
					</li>
					<li id="admin-login">
						<a href="${pageContext.request.contextPath}/admin/registration_c"> 
							&nbsp; &nbsp; <i class="fa fa-circle-o"></i>车辆登记
						</a>
					</li>
				</ul></li>
			</ul>
	</section>
	<!-- /.sidebar -->
</aside>