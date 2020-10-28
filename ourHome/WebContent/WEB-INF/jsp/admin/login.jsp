<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>光明社区综合信息服务系统</title>

<link rel="stylesheet" media="screen"
	href="${pageContext.request.contextPath}/resources/css/login.css"/>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css" />
</head>

<body onkeydown="keyLogin();">
	<div id="particles-js">
		<div class="login">
			<div class="login-top">光明社区综合信息服务系统</div>
			<p style="color:red;font-size:18px;text-align:center;">${message}</p>
			<div class="login-center clearfix">
				<div class="login-center-img">
					<img src="${pageContext.request.contextPath}/resources/img/name.png" />
				</div>
				<div class="login-center-input">
					<input type="text" id="adminName" name="" value="${loginName }" placeholder="请输入您的用户名"
						onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的用户名'" />
					<div class="login-center-input-text">用户名</div>
				</div>
			</div>
			<div class="login-center clearfix">
				<div class="login-center-img">
					<img src="${pageContext.request.contextPath}/resources/img/password.png" />
				</div>
				<div class="login-center-input">
					<input type="password" id="password" name="" value="${password }" placeholder="请输入您的密码"
						onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'" />
					<div class="login-center-input-text">密码</div>
				</div>
			</div>
			<div class="login-button" id="login_button">登录</div>
		</div>
		
		<div class="sk-rotating-plane"></div>
	</div>

	<!-- scripts -->
	<script src="${pageContext.request.contextPath}/resources/js/particles.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
	<script type="text/javascript">
	/**
     *捕获enter键盘事件绑定到登录按钮 
     */
    function keyLogin() {
        if (event.keyCode == 13) {
            document.getElementById("login_button").click();           
        }
    }
		function hasClass(elem, cls) {
			cls = cls || '';
			if (cls.replace(/\s/g, '').length == 0)
				return false; //当cls没有参数时，返回false
			return new RegExp(' ' + cls + ' ').test(' ' + elem.className + ' ');
		}

		function addClass(ele, cls) {
			if (!hasClass(ele, cls)) {
				ele.className = ele.className == '' ? cls : ele.className + ' '
						+ cls;
			}
		}

		function removeClass(ele, cls) {
			if (hasClass(ele, cls)) {
				var newClass = ' ' + ele.className.replace(/[\t\r\n]/g, '')
						+ ' ';
				while (newClass.indexOf(' ' + cls + ' ') >= 0) {
					newClass = newClass.replace(' ' + cls + ' ', ' ');
				}
				ele.className = newClass.replace(/^\s+|\s+$/g, '');
			}
		}
		document.querySelector(".login-button").onclick = function() {
			
			addClass(document.querySelector(".login"), "active")
			setTimeout(
					function() {
						addClass(document.querySelector(".sk-rotating-plane"),
								"active")
						document.querySelector(".login").style.display = "none"
					}, 800)
			setTimeout(function() {
				removeClass(document.querySelector(".login"), "active")
				removeClass(document.querySelector(".sk-rotating-plane"),
						"active")
			 	document.querySelector(".login").style.display = "block"
			 	//获得用户名和密码
			 	var loginName=document.getElementById("adminName").value;
				var password=document.getElementById("password").value;
			 	window.location.href="${pageContext.request.contextPath}/admin/AdminLogin?loginName="+loginName+"&password="+password;

			}, 2000) 
		}
	</script>
	<div style="text-align: center;">
</body>

</html>