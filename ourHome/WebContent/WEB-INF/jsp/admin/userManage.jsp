<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>居民注册信息界面</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/bootstrap-slider/slider.css">

<link rel="stylesheet" 
	href="${pageContext.request.contextPath}/resources/layui/css/layui.css" media="all">
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="header.jsp"></jsp:include>
			<!-- 页面头部 /-->

		<!-- 导航侧栏 -->
		<jsp:include page="aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">
		
		<section class="content-header">
			<h1>
				居民注册信息
			</h1>
			<ol class="breadcrumb">
				<li><a
					href="${pageContext.request.contextPath}/admin/main"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a href="">居民注册信息</a></li>
			</ol>
			</section>
		<table class="layui-hide" id="test" lay-filter="test"></table>
		
		<section class="content"></section>

		<script id="toolbarDemo" type="text/html">
    		<button class="layui-btn layui-btn-sm" lay-event="addData">添加</button>
			<div class="layui-inline" title="搜索" style="float:right;height:29px;" lay-event="LAYTABLE_SEARCH"><i class="layui-icon layui-icon-search"></i></div>
			<input type="text" id="search" style="width:200px;float:right;height:30px;" placeholder="请输入查询条件" autocomplete="off" class="layui-input">
		</script>
		<script id="barDemo" type="text/html">
  			 <a class="layui-btn layui-btn-xs" lay-event="update">更新</a>
 			 <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- 底部导航 /-->

	</div>
	
<script src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<script>
  layui.use(['table','form','laydate'], function(){
	  var table = layui.table;
	  var form = layui.form;
	  var laydate = layui.laydate;
	  
	  table.render({
	    elem: '#test'
	    ,url:'${pageContext.request.contextPath}/user/selectAllUser'
	    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
	   	,page: true
	    ,defaultToolbar: ['filter',{ //自定义头部工具栏右侧图标
	        title: '提示'
	           ,layEvent: 'LAYTABLE_TIPS'
	           ,icon: 'layui-icon-tips'
	        }]
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left'}
	      ,{field: 'uid', title: 'ID', width:50}
	      ,{field: 'uname', title: '用户名',edit: 'text', width:90}
	      ,{field: 'upassword', title: '密码',edit: 'text', width:90,hide:true}
	      ,{field: 'usex', title: '性别',edit: 'text', width:60} 
	      ,{field: 'uidcard', title: '身份证号',edit: 'text', width: 180}
	      ,{field: 'upolitic', title: '政治面貌',edit: 'text'}
	      ,{field: 'ueducation', title: '学历',edit: 'text', width: 100}
	      ,{field: 'uaddress', title: '住址',edit: 'text'}
	      ,{field: 'telephone_u', title: '联系电话',edit: 'text', width: 130}
	      ,{field: 'root_name', title: '身份',edit: 'text'} 
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:130}
	    ]]
	    
	  });
	  
	  
	  //头工具栏事件
	  table.on('toolbar(test)', function(obj){
	    var checkStatus = table.checkStatus(obj.config.id);
	    switch(obj.event){
	      case 'getCheckData':
	        var data = checkStatus.data;
	        layer.alert(JSON.stringify(data));
	        break;
	      case 'addData':
	    	 layer.open({
	               type: 1,
	               title: '用户录入',
	               shadeClose: true,         //弹出框之外的地方是否可以点击
	               offset: '10%',
	               skin: 'layui-layer-rim', //加上边框
	               area: ['60%', '80%'],
	               content: $("#popupForm")
	           });
		     break;
	      case 'LAYTABLE_SEARCH': //table重载
	    	 var condition = $("#search").val();
	    	 if(condition >= '1' && condition <= '3'){
	    		 table.reload('test', {
	                 url:'${pageContext.request.contextPath}/user/selectRole?condition='+condition
	             });
	    	 }else{
	    		 table.reload('test', { //表格的id
	                 url:'${pageContext.request.contextPath}/user/selectUserByInfo?condition='+condition 
	             });
	    	 }
	        break;
	    	 
	      //自定义头工具栏右侧图标 - 提示
	      case 'LAYTABLE_TIPS':
	         layer.alert('可以根据用户相关信息搜索，也可按角色分类进行搜索，1:普通居民/2:志愿者/3:孤寡老人');
	        break;
	    };
	  });
	  
	  //监听行工具事件
	  table.on('tool(test)', function(obj){ 
	    var data = obj.data;
		var id = data['uid'];//获取选中的id
	    //console.log(obj)
	    if(obj.event === 'del'){
	      layer.confirm('确定删除吗', function(index){
	        obj.del();
	        window.location.href="${pageContext.request.contextPath}/user/delUser?uid="+id;
	        layer.close(index);
	      });
	    } else if(obj.event === 'update'){
	    	$.ajax({
				url   :"${pageContext.request.contextPath }/user/updateUserById",
				type  :"post",
				data  :JSON.stringify(data),
				contentType :"application/json",
				dataType :"json",
				success :function(d){
					if(d!=null){
						layer.msg('更新成功',{time: 1500});
					}
				}
			});
	     }
	  });
	  
	  //为绑定元素赋值当前时间
	  laydate.render({
		  elem: '#now_time'
		  ,type: 'datetime'
		  ,value: new Date()
	  });
	  
		//提交表单
		form.on('submit(demo2)', function (data) {
			$.ajax({
				url   :"${pageContext.request.contextPath }/user/insertUser",
				type  :"post",
				data  :JSON.stringify(data.field),
				contentType :"application/json",
				dataType :"json",
				success :function(d){
					if(d!=null){
						layer.msg('添加成功',{time: 1500});
					}
				}
			});		
		})
	});
</script>	

	<script
		src="${pageContext.request.contextPath}/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/raphael/raphael-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/morris/morris.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/knob/jquery.knob.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/iCheck/icheck.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/adminLTE/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/treeTable/jquery.treetable.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/select2/select2.full.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/ckeditor/ckeditor.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/chartjs/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/flot/jquery.flot.categories.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script>
		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
		});

		// 设置激活菜单
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}

		$(document).ready(function() {
			// 激活导航位置
			setSidebarActive("admin-index");
		});
	</script>
	
<form style="display:none;" class="layui-form layui-form-pane" id="popupForm" action="">

<section class="content">
<div class="box box-primary">

  <div class="layui-form-item">
    <label class="layui-form-label">用户名</label>
    <div class="layui-input-inline">
      <input name="uname" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input name="upassword" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
  </div>
	
 <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block">
      <input name="usex" title="男" type="radio" checked="" value="男">
      <input name="usex" title="女" type="radio" value="女">
    </div>
 </div>
<div class="layui-form-item">
	<label class="layui-form-label">学历</label>
	<div class="layui-input-inline" style="width: 115px;">
      <input name="ueducation" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
	<label class="layui-form-label">政治面貌</label>
	<div class="layui-input-inline"  style="width: 100px;">
      <select name="upolitic">
        <option value="群从">群众</option>
        <option value="共青团员">共青团员</option>
        <option value="党员">党员</option>
      </select>
    </div>
    </div>
  <div class="layui-form-item">
    <label class="layui-form-label">身份证号</label>
    <div class="layui-input-inline" style="width: 200px;">
      <input name="uidcard" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
  </div>
  <div class="layui-form-item">
	<label class="layui-form-label">住址</label>
	    <div class="layui-input-inline">
	      <input name="uaddress" class="layui-input" type="text" placeholder="如:A栋404" autocomplete="off" lay-verify="required">
	    </div>
    <label class="layui-form-label">角色</label>
	   <div class="layui-input-inline"  style="width: 100px;">
	      <select name="root">
	        <option value="1">普通居民</option>
	        <option value="2">志愿者</option>
	        <option value="3">孤寡老人</option>
	      </select>
	    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">联系电话</label>
    <div class="layui-input-inline">
      <input name="telephone_u" class="layui-input" type="text" autocomplete="off" lay-verify="required">
    </div>
  </div>
  <input name="apply_time" id="now_time" type="hidden" class="layui-input" autocomplete="off">
  <input name="ustatus" class="layui-input" type="hidden" value="1" autocomplete="off">
  <input name="examine" class="layui-input" type="hidden" value="1" autocomplete="off">
  <div class="layui-form-item">
    <button class="layui-btn" lay-filter="demo2" lay-submit="">提交</button>
    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
  </div>
  
  </div>
  </section>
</form>
</body>

</html>