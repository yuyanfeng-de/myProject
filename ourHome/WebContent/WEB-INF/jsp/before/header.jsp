<%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 页面头部 -->
<!--header-->
	
					
	   <div class="header" id="home">

		

				<div class="container">

						<div class="deatils" id="loginEntry">
							<ul>
								<li><i class="glyphicon glyphicon-log-in" aria-hidden="true"></i><a href="#" data-toggle="modal" data-target="#myModal">用户登录</a></li>
								<li><i class="glyphicon glyphicon-log-in" aria-hidden="true"></i><a href="${pageContext.request.contextPath}/admin/" data-toggle="modal">工作人员登录</a></li>
							</ul>
			    		</div>
			  <!-- 用户头像+uname -->
					<div id="userInfo" style="display:none;">
						<ul class="layui-nav" style="background-color:#05222A;float:right;margin:0px;">
					  <li class="layui-nav-item">
					    <a href="#"><img src="${pageContext.request.contextPath }/resources/images/my.jpg" class="layui-nav-img">${User.uname }</a>
					    <dl class="layui-nav-child">
					      <dd><a href="javascript:;"  onclick="updateInfo()">修改信息</a></dd>
					      <dd><a href="javascript:;"  onclick="changePassword()">安全管理</a></dd>
					      <dd><a href="${pageContext.request.contextPath }/before/userLogout">注销</a></dd>
					    </dl>
					  </li>
					</ul>
					</div>
			    		<div class="clearfix"></div>
					
				<div class="logo">
						<h1><a href="#">光明社区综合服务信息系统</a></h1>
				</div>

		</div>
	
	<!--header-->
<!-- 页面头部 /--> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 页面头部 -->
<!--header-->
	   <div class="header" id="home">
		<!-- 删掉<div class="header-top"> -->
				<div class="container">
					<!-- 删掉<div class="head-top"> -->
					
				
					</div>
					<div class="logo">
			   <div class="deatils" id="loginEntry"  style="margin-right:10px;">
					<ul>
						<li><i class="glyphicon glyphicon-log-in" aria-hidden="true"></i><a href="#" data-toggle="modal" data-target="#myModal">用户登录</a></li>
						<li><i class="glyphicon glyphicon-log-in" aria-hidden="true"></i><a href="${pageContext.request.contextPath}/admin/" data-toggle="modal">工作人员登录</a></li>
					</ul>
					
			    </div>
			    <div id="userInfo" style="display:none;margin-right:10px;">
					
						<ul class="layui-nav" style="float:right;margin:0px;">
					  <li class="layui-nav-item">
					    <a href="#"><img src="${pageContext.request.contextPath }/resources/images/my.jpg" class="layui-nav-img">${User.uname }</a>
					    <dl class="layui-nav-child">
					      <dd><a href="javascript:;"  onclick="updateInfo()">修改信息</a></dd>
					      <dd><a href="javascript:;"  onclick="changePassword()">安全管理</a></dd>
					      <dd><a href="${pageContext.request.contextPath }/before/userLogout">注销</a></dd>
					    </dl>
					  </li>
						</ul>
				</div>
						<h1><a href="#">光明社区综合服务信息系统</a></h1>
					</div>
					

		</div>
	

	<!--header-->