<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>首页</title>


<!--css-->
<link rel="stylesheet" 
	href="${pageContext.request.contextPath}/resources/layui/css/layui.css" media="all">	
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/resources/css/style-before.css" rel="stylesheet" type="text/css" media="all" />
<!--css-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> 
	addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 
	function hideURLbar(){ window.scrollTo(0,1); } 
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flexslider.css" type="text/css" media="screen" />
<!--js-->
<script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!--js-->
<!--webfonts-->
<link href='http://fonts.googleapis.com/css?family=Josefin+Sans:400,700italic,700,600italic,600,400italic,300italic,300,100italic,100' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<!--webfonts-->
<script src="${pageContext.request.contextPath}/resources/js/responsiveslides.min.js"></script>
 <script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	nav: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
  </script>
  <link href="${pageContext.request.contextPath}/resources/css/owl.carousel.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
	<script>
		$(document).ready(function() {
		$("#owl-demo").owlCarousel({
			items : 1,
			lazyLoad : true,
			autoPlay : true,
			navigation : false,
			navigationText :  false,
			pagination : true,
		});
		});
	</script>
	
<script type="text/javascript"> 
 	window.onload = function(){
		if('${User.uname}' !=null && '${User.uname}' !=''){
			$('#loginEntry').hide();
			$('#userInfo').show();
		}else if('${uname}' !=null && '${uname}' !='' ){
			$('#myModal').modal('show');
		}
		
		if('${npassword}' !=null && '${npassword}' !=''){
			changePassword();
		}
	}
</script> 
<style>
body 
{
	margin-top:0dp;
     background-image:url(${pageContext.request.contextPath}/resources/images/background.jpg);
}
</style>

<!-- 用户分享 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/wangEditor.js"></script>
<style type="text/css">
.toolbar {
	border: 1px solid #ccc;
	margin-left: 110px;
}

.text {
	border: 1px solid #ccc;
	height: 400px;
	margin-left: 110px;
}
#guide_panel{
	    width: 98%;
	    margin: 0 auto;
	}
	#row_panel{
	    width: 98%;
	    height: 720px;
	    margin: 0 auto;
	    /*border: solid 1px red;*/
	}
	#row_panel .table-panel{
	    width: 50%;
	    height: 500px;
	    float: left;
	    text-align: center;
	}
	#row_panel .table-panel p{
	    color:#BBBBBB;
	}
	#row_panel .bottom-panel{
	    width: 100%;
	    height: 40px;
	    background: #F0F0F0;
	    float: left;
	    margin-top: 20px;
	    text-align: right;
	}
	#row_panel .bottom-panel span{
	    line-height: 40px;
	    font-size: 18px;
	}
/* .top { */
/* 	padding-top: 1%; */
/* 	padding-left: 10%; */
/* 	width: 80%; */
/* } */
</style>
<!--     用户分享 -->
</head>
<body>

	<!-- 页面头部 -->
		<jsp:include page="header.jsp"></jsp:include>
	<!-- 页面头部 /-->
	
	
	<!--banner-->
		<div class="banner-section">
		<div class="slider">
			<div class="callbacks_container">
				<ul class="rslides" id="slider">
					<li>
					  <img src="${pageContext.request.contextPath}/resources/images/ba1.jpg" alt="">
					 <div class="caption">
						<h3>科学做好个人防护</h3>
						<p>请广大市民群众增强自身防护意识，健康生活方式从自我做起、从家人做起，养成勤洗手、常通风、多运动、用公筷的良好卫生习惯，不接触、不食用野生动物。保持1米以上的社交距离，减少非必要的人群聚集。咳嗽、打喷嚏时注意遮挡。在人员密集的封闭场所、与他人小于1米距离接触时佩戴口罩。</p>
					 </div>
					</li>
					<li>
					  <img src="${pageContext.request.contextPath}/resources/images/ba2.jpg" alt="">
						<div class="caption">
						<h3>保持环境卫生整洁</h3>
						<p>深入开展“爱卫月”和“爱卫突击周”活动，把环境治理措施落实到社区、村居、单位和家庭中。大力推进城乡环境治理，落实公共场所、公共设施、公共交通工具、小区楼道电梯和密闭、半密闭场所等的日常清洁、通风消毒措施，加强对农贸市场、城中村、城乡结合部、厂区、出租屋、铁路沿线、高速公路沿线、站场码头等部位的环境卫生整治，消灭卫生死角，营造干净整洁环境，防止传染病滋生蔓延。</p>
					</div>
					</li><li>
					  <img src="${pageContext.request.contextPath}/resources/images/ba3.jpg" alt="">
						<div class="caption">
						<h3>配合健康服务管理</h3>
						<p>在各公共场所入口处进行体温检测和健康码查验，无法出示健康码的人员，若体温检测正常，可凭7日内新冠病毒核酸检测结果阴性证明或7日内解除隔离医学观察通知书，持有效身份证明并做好个人信息登记后进入。一旦出现疫情，各级各部门可划定一定范围的重点防控区域和重点防控人群，有关场所和人员应按规定配合做好流行病学调查、核酸检测、隔离医学观察等健康服务管理措施。</p>
					</div>
					</li>
				</ul>
		  </div>
	  </div>
	</div>
	<!--banner-->
	
	
	
	<div class="content">
		
		<div class="popular-w3">
			<div class="container">
				<h2 class="tittle">信息公布</h2>
				<div class="popular-grids">
					<div class="col-md-4 popular-grid">
						<h4>通知公告</h4>
						<img src="${pageContext.request.contextPath}/resources/images/a.jpg" class="img-responsive" alt=""/>
						<div class="popular-text">
							<h5>近一周社区公告</h5>
							<a href="#" class="button" data-toggle="modal" data-target="#aaaaaa">查看详情</a>
							<div class="detail-bottom">
								<ul>
									<li class="text-infoaaa">明日起小区实施全面封锁进出</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-infoaaa">关于开展小区各家户人口统计的通知</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-infoaaa">关于开展小区各处消毒检查工作的通知</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-infoaaa">关于开展小区将进行免费核酸检测的通知</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-infoaaa">关于改进疫情防控期间居民小区管理的通知</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-infoaaa">招募小区志愿者的通知</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-infoaaa">小区工作人员每日排班表</li>
									<div class="clearfix"></div>
								</ul>
								
							</div>
						</div>
					</div>
					<div class="col-md-4 popular-grid">
						<h4>便民信息</h4>
						<img src="${pageContext.request.contextPath}/resources/images/a1.jpg" class="img-responsive" alt=""/>
						<div class="popular-text">
							<h5>各种便民信息汇总</h5>				
							<a href="#" class="button" data-toggle="modal" data-target="#bbbbbb">查看详情</a>
							<div class="detail-bottom">
								<ul>
									<li class="text-info">常用电话:</li>
									<li class="text-info1">120</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-info">附近超市:</li>
									<li class="text-info1">福盈门超市</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-info">附近药店:</li>
									<li class="text-info1">益康药店</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-info">附近医院:</li>
									<li class="text-info1">同康人民医院</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-info">办事中心:</li>
									<li class="text-info1">光明政府办事中心</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-info">娱乐场所:</li>
									<li class="text-info1">光明西湖公园</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-info">小区电话:</li>
									<li class="text-info1">456789</li>
									<div class="clearfix"></div>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-4 popular-grid">
						<h4>便民服务</h4>
						<img src="${pageContext.request.contextPath}/resources/images/a2.jpg" class="img-responsive" alt=""/>
						<div class="popular-text" id="aaaaa">
							<h5>最近社区活动 </h5>
							
							<a href="#" class="button" data-toggle="modal" data-target="#cccccc">查看详情</a>
							<div class="detail-bottom">
								<ul>
									<li class="text-infoaaa">小区在住居民可申请代购服务</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-infoaaa">小区在住居民可申请理发服务</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-infoaaa">关于开展小区各处消毒检查工作的通知</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-infoaaa">关于开展小区将进行免费核酸检测的通知</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-infoaaa">关于改进疫情防控期间居民小区管理的通知</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-infoaaa">招募小区志愿者的通知</li>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li class="text-infoaaa">小区工作人员每日排班表</li>
									<div class="clearfix"></div>
								</ul>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		
		<!--high properties-->
		<!--featured-->
			<div class="featured-w3l">
				<div class="container">
					<h3 class="tittle1">社区服务</h3>
					<div class="feature-grids">
						<div class="col-md-4 fer-grid">
							<div class="icons" onclick="reportInfo();">
								<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
							</div>
								<h4>体温上报</h4>
								<p>实时上报居民信息.</p>
						</div>
						<div class="col-md-4 fer-grid">
							<div class="icons" class="button" data-toggle="modal" id="gerenfenxiangjs"
							data-target="#gerenfenxiang">
							<i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
						</div>
								<h4>个人分享</h4>
								<p>记录每个人的分享.</p>
						</div>
						<div class="col-md-4 fer-grid">
							<div class="icons">
								<i class="glyphicon glyphicon-signal" aria-hidden="true"></i>
							</div>
							<h4>便民购物</h4>
								<p>提供购物车功能，方便购物</p>
						</div>
						<!--  
						<div class="col-md-3 fer-grid">
							<div class="icons" onclick="identity();">
								<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
							</div>
								<h4>身份认证</h4>
								<p>认证志愿者或孤寡老人</p>
						</div>
						<div class="col-md-3 fer-grid">
							<div class="icons" onclick="volunteerTask();">
								<i class="glyphicon glyphicon-home" aria-hidden="true"></i>
							</div>
								<h4>志愿者任务</h4>
								<p>供志愿者查看自己的任务分配情况.</p>
						</div>
						
						-->
						<div class="clearfix"></div>
					</div>
					<div class="feature-grids">
						<div class="col-md-4 fer-grid">
							<div class="icons" onclick="statistics();">
								<i class="glyphicon glyphicon-globe" aria-hidden="true"></i>
							</div>
								<h4>社区统计信息</h4>
								<p>统计居民小区最近一周情况变化.</p>
						</div>
						<div class="col-md-4 fer-grid">
							<div class="icons" onclick="service();">
								<i class="glyphicon glyphicon-cog" aria-hidden="true"></i>
							</div>
								<h4>申请服务</h4>
								<p>给社区居民提供社区服务.</p>
						</div>
						
						<div class="col-md-4 fer-grid">
							<div class="icons" onclick="volunteer_v();">
								<i class="glyphicon glyphicon-signal" aria-hidden="true"></i>
							</div>
								<h4>志愿服务</h4>
							<p>记录志愿者的志愿活动</p>
								</div>
						
						
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
	
	</div>
		
			<!--footer-->
					<jsp:include page="footer.jsp"></jsp:include>
			<!-- footer -->
			
				
				
			
			<!--公告详情-->
			<div class="modal fade" id="aaaaaa" tabindex="-1" role="dialog">
				<div class="modal-dialoga" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-bodya real-spa">
							<div class="login-gridsa">
								<div class="login">
									<div class="login-right">
									<h3>公告详情</h3>
									<table class="layui-hide" id="test2" lay-filter="test2"></table>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--公告详情-->
				
				
				
					
		<!--信息查询-->
			<div class="modal fade" id="bbbbbb" tabindex="-1" role="dialog">
				<div class="modal-dialogx" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-body real-spa">
							<div class="login-grids">
								<div class="login">
									<div class="login-right">
											<h3>详细信息</h3> 
											<table class="table table-striped">
													<thead>
														<tr>
														  <th>常用电话</th>
														  <th>号码</th>
														  <th>附近场所</th>
														  <th>位置</th>
														  <th>电话</th>
	                                                  	</tr>
	                                                </thead>
	                                                   <tbody>
		                                                  <tr>
		                                                    <td>火警电话:</td>
			                                                <td>119</td>
		                                                 	<td>福盈门超市</td>
		                                                 	<td>光明小巷向东50米路南</td>
		                                                 	<td>564646</td>
		                                                  </tr>
		                                                  <tr>
			                                                <td>报警电话:</td>
		                                                 	<td>110</td>
		                                                 	<td>益康药店</td>
		                                                 	<td>光明小巷向西90米路南</td>
		                                                 	<td>654564</td>
	                                                      </tr>
		                                                  <tr>
			                                                <td>急救电话:</td>
			                                                <td>120</td>
			                                                <td>光明政府办事中心</td>
			                                                <td>光明西巷向西100米路南</td>
			                                                <td>646487</td>
		                                                  </tr>
	                                                     </tbody>
                                                     </table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!--信息查询-->
			
			
			
			<!--活动详情-->
			<div class="modal fade" id="cccccc" tabindex="-1" role="dialog">
				<div class="modal-dialoga" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-bodya real-spa">
							<div class="login-gridsa">
								
							<div class="login">
								<div class="login-right">
								<h3>活动详情</h3>
									<table class="layui-hide" id="test" lay-filter="test"></table>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--活动详情-->
			
			
			
			<!--志愿者记录-->
			<div class="modal fade" id="zhiyuanzhe" tabindex="-1" role="dialog">
				<div class="modal-dialogb" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<p style="float:left;color:#ffffff;">志愿服务</p>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-bodya real-spa">
							<div class="login-gridsa">
								<div class="login">
									<div class="login-righta">
										
										<button class="layui-btn" onclick="volunteerTask();">参加志愿服务</button>
										
										<table class="layui-hide" id="test4" lay-filter="test4"></table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	<!--志愿者记录-->
			
			<!--志愿者任务-->
			<!-- 
			<div class="modal fade" id="task_v" tabindex="-1" role="dialog">
				<div class="modal-dialoga" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-bodya real-spa">
							<div class="login-gridsa">
								
							<div class="login">
								<div class="login-right">
										<h3>志愿者任务</h3>
										<table class="layui-hide" id="task" lay-filter="task"></table>
									</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			 -->
	<!--志愿者任务-->
			
				
				<!--用户signin-->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-body real-spa">
							<div class="login-grids">
								<div class="login">
									<div class="login-right">
										<form action="${pageContext.request.contextPath}/before/beforeLogin" method="post">
											<h3>登录</h3>
											<input type="text" name="uname" value="${uname }" placeholder="用户名" required="">	
											<input type="password" name="upassword" value="${upassword }" placeholder="密码" required="">	
											
											<div class="single-bottom">
												<p style="color:red;font-size:18px;text-align:center;">${message_b }</p>
											</div>
											<input type="submit" value="登录" >
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--用户signin-->		
			
			
			<!--Register-->
			<div class="modal fade" id="myModal1" tabindex="-1" role="dialog">
				<div class="modal-dialog" role="document">
					<div class="modal-content modal-info">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
						</div>
						<div class="modal-body real-spa">
							<div class="login-grids">
								<div class="login">
									<div class="login-right">
										<form action="#" method="post">
											<h3>注册</h3>
											<input type="text" name="Name" value="Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Name';}" required="">
											<input type="text" name="Phone" value="Mobile number" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Mobile number';}" required="">
											<input type="text" name="Email" value="Email id" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email id';}" required="">	
											<input type="password" name="Password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}" required="">	
											
											<input type="submit" value="注册" >
										</form>
									</div>
									<div class="clearfix"></div>								
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!--Register-->
		


	<!-- 弹出层表单 -->
 		<jsp:include page="popupForm.jsp"></jsp:include>
 		<jsp:include page="popupForm2.jsp"></jsp:include>
 	<!-- 弹出层表单 -->
</body>
</html>
