<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>普通信息审核界面</title>

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
				普通信息审核
			</h1>
			<ol class="breadcrumb">
				<li><a
					href="${pageContext.request.contextPath}/admin/main"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a href="">信息审核</a></li>
				<li class="active">普通信息审核</li>
			</ol>
			</section>
		<table class="layui-hide" id="test" lay-filter="test"></table>
		
		<section class="content"></section>

		<script id="toolbarDemo" type="text/html">
    		<div class="layui-inline" title="搜索" style="float:right;height:29px;" lay-event="LAYTABLE_SEARCH"><i class="layui-icon layui-icon-search"></i></div>
			<input type="text" id="search" style="width:200px;float:right;height:30px;" placeholder="请输入申请人" autocomplete="off" class="layui-input">
		</script>
		<script id="barDemo" type="text/html">
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
	    ,url:'${pageContext.request.contextPath}/user/selectUserByExamine'
	    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
	   	,page: true
	    ,defaultToolbar: ['filter']
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left'}
	      ,{field: 'uid', title: 'ID', width:60}
	      ,{field: 'uname', title: '申请人'}
	      ,{field: 'telephone_u', title: '联系电话', width: 157}
	      ,{field: 'root_name', title: '身份', width: 130}
	      ,{field: 'uaddress', title: '住址', width: 135}
	      ,{field: 'apply_time', title: '申请时间',width: 180
	    	  	,templet : "<div>{{layui.util.toDateString(d.apply_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	      ,{field: 'examine', title: '审核状态', width: 120,templet: '#status'}
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
	      
	      case 'LAYTABLE_SEARCH': //table重载
	    	  var uName = $("#search").val();
	    	  table.reload('test', { //表格的id
                  url:'${pageContext.request.contextPath}/user/selectUserByName2?uname='+uName, 
              });
	      break;
	    	 
	      //自定义头工具栏右侧图标 - 提示
	      case 'LAYTABLE_TIPS':
	        layer.alert('这是工具栏右侧自定义的一个图标按钮');
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
	        window.location.href="${pageContext.request.contextPath}/user/delUser2?uid="+id;
	        layer.close(index);
	      });
	    } else if(obj.event === 'verify'){
	    //将对应的信息渲染到审核表单
	    	if(data['examine'] == 0 || data['examine'] == 2){
	    	form.val('popupForm', {
	    		   "uid": data['uid']
	    	      ,"uname": data['uname']
	    	      ,"upassword": data['upassword']
	    	      ,"usex": data['usex']
	    	      ,"ueducation": data['ueducation']
	    	      ,"upolitic": data['upolitic']
	    	      ,"uidcard" : data['uidcard']
	    	      ,"uaddress" :data['uaddress']
	    	      ,"telephone_u" :data['telephone_u']
	    	      ,"apply_time":data['apply_time']
	    	      ,"root": data['root']
	    	      ,"close": false //开关状态
	    	    });
	    	}else{
	    		form.val('popupForm', {
	    			  "uid": data['uid']
		    	      ,"uname": data['uname']
		    	      ,"upassword": data['upassword']
		    	      ,"usex": data['usex']
		    	      ,"ueducation": data['ueducation']
		    	      ,"upolitic": data['upolitic']
		    	      ,"uidcard" : data['uidcard']
		    	      ,"uaddress" :data['uaddress']
		    	      ,"telephone_u" :data['telephone_u']
		    	      ,"apply_time":data['apply_time']
		    	      ,"root": data['root']
		    	      ,"close": true //开关状态
		    	    });
	    	}
	    	  layer.open({
	                type: 1,
	                title: '信息审核',
	                shadeClose: true,         //弹出框之外的地方是否可以点击
	                offset: '10%',
	                skin: 'layui-layer-rim', //加上边框
	                area: ['60%', '80%'],
	                content: $("#popupForm")
	            });
	    	  
	      }
	  });
	  
	  //监听指定开关
	  form.on('switch(switchListener)', function(data){
		  var checked = data.elem.checked;
          //当审核通过时，标识 1（已审核）
          if(checked){
        	  form.val('popupForm', {
    			  "examine": 1
	    	    });
          } 
	  });
	  
		//提交表单
		form.on('submit(demo2)', function (data) {
			//审核标识 通过审核的数据更新到user表,否则更新表user2中的examine状态
			var examine = document.getElementById("examine").value;
			if(examine == 1){
				$.ajax({
					url   :"${pageContext.request.contextPath }/user/updateUserById3",
					type  :"post",
					data  :JSON.stringify(data.field),
					contentType :"application/json",
					dataType :"json",
					success :function(d){
							layer.msg('通过审核',{time: 1500});
					}
				});
			} else{
				$.ajax({
					url   :"${pageContext.request.contextPath }/user/updateUserById2",
					type  :"post",
					data  :JSON.stringify(data.field),
					contentType :"application/json",
					dataType :"json",
					success :function(d){
							layer.msg('未通过审核',{time: 1500});
					}
				});
			}
			
		})
	});
</script>	

<!-- 将 exmine 状态转为文字信息 -->
 <script type="text/html" id="status">
              {{#  if(d.examine === 0){d.examine = '未审核' }}
                 <span lay-event="verify" class="layui-btn layui-bg-orange layui-btn-xs">{{d.examine}}</span>
              {{#  } else if(d.examine === 2) { d.examine = '审核未通过'}}
               <span lay-event="verify" class="layui-btn layui-btn-danger layui-btn-xs">{{d.examine}}</span>
			  {{#  } else { d.examine = '已审核'}}
               <span lay-event="verify" class="layui-btn layui-bg-green layui-btn-xs">{{d.examine}}</span>
              {{#  } }}
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

<!-- 弹出层表单 -->
<form style="display:none;" class="layui-form layui-form-pane" lay-filter="popupForm" id="popupForm" action="">

<section class="content">
<div class="box box-primary">

<input name="uid" class="layui-input" type="hidden" autocomplete="off">
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
        <option value="群众">群众</option>
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

  <input name="ustatus" class="layui-input" type="hidden" value="1" autocomplete="off">
  <input name="examine" id="examine" class="layui-input" type="hidden" value="2" autocomplete="off">
  
  <div class="layui-form-item">
    <label class="layui-form-label">审核状态</label>
    <div class="layui-input-block">
      <input name="close" type="checkbox" lay-filter="switchListener" lay-skin="switch" lay-text="通过|未通过">
    </div>
  </div>
  <div class="layui-form-item">
    <button class="layui-btn" lay-filter="demo2" lay-submit="">提交</button>
    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
  </div>
  
  </div>
  </section>
</form>
</body>

</html>