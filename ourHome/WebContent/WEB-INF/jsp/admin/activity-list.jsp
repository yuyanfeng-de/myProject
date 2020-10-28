<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>社区活动管理</title>
<script 
	src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
	
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
<script
	src="${pageContext.request.contextPath}/resources/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/plugins/jQueryUI/jquery-ui.min.js"></script>

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
				社区活动管理
			</h1>
			<ol class="breadcrumb">
				<li><a
					href="${pageContext.request.contextPath}/admin/main"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a href="">社区活动管理</a></li>
			</ol>
			</section>
		<table class="layui-hide" id="test" lay-filter="test"></table>

		<section class="content"></section>
		
		<script id="toolbarDemo" type="text/html">
    		<button class="layui-btn layui-btn-sm" lay-event="addData">添加</button>
			<div class="layui-inline" title="搜索" style="float:right;height:29px;" lay-event="LAYTABLE_SEARCH"><i class="layui-icon layui-icon-search"></i></div>
			<input type="text" id="search_time" style="width:100px;float:right;height:30px;" placeholder="请输入时间" autocomplete="off" class="layui-input">
			<input type="text" id="search_theme" style="width:100px;float:right;height:30px;" placeholder="请输入主题" autocomplete="off" class="layui-input">
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
	
<script>
  layui.use(['laydate','table','form'], function(){
	  var table = layui.table;
	  var laydate = layui.laydate;
	  var form = layui.form;
	  
	  table.render({
	    elem: '#test'
	    ,url:'${pageContext.request.contextPath}/activity/selectAllActivity'
	    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
	   	,page: true
	   	, method: 'post'
	    ,defaultToolbar: ['filter',{ //自定义头部工具栏右侧图标
	         title: '提示'
		    ,layEvent: 'LAYTABLE_TIPS'
		    ,icon: 'layui-icon-tips'
		  }]
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left'}
	      ,{field: 'id_a', title: 'ID', width:50,hide:true}
	      ,{field: 'theme', title: '活动主题',edit: 'text'}
	      ,{field: 'object', title: '服务对象',edit: 'text'}
	      ,{field: 'location', title: '服务地点',edit: 'text',event: 'setLocation'}
	      ,{field: 'describe', title: '活动描述',edit: 'text',event: 'setDescribe'}
	      ,{field: 'service_time', title: '开始时间',edit: 'text',event:'editTime',data_field:'service_time'
	    	  ,width: 165, templet : "<div>{{layui.util.toDateString(d.service_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	      ,{field: 'end_time', title: '结束时间',edit: 'text',event:'editTime',data_field:'end_time'
	    	  ,width: 165, templet : "<div>{{layui.util.toDateString(d.end_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	      ,{field: 'publishTime', title: '发布时间',edit: 'text',event:'editTime',data_field:'publishTime',hide:true
	    	  ,width: 165, templet : "<div>{{layui.util.toDateString(d.publishTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	      ,{title: '活动状态', width: 90,templet:'#setExamine'}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:138}
	    ]]
	    
	  });
	  
	  
	  //头工具栏事件
	  table.on('toolbar(test)', function(obj){
	    var checkStatus = table.checkStatus(obj.config.id);
	    switch(obj.event){
	      case 'addData':
	    	  layer.open({
	                type: 1,
	                title: '活动发布',
	                shadeClose: true,           //弹出框之外的地方是否可以点击
	                offset: '10%',
	                skin: 'layui-layer-rim', //加上边框
	                area: ['60%', '80%'],
	                content: $("#popupForm")
	            });
		      break;
	      
	      case 'LAYTABLE_SEARCH': //table重载
	    	  var theme = $("#search_theme").val();
	      	  var date = $("#search_time").val();
	      	if(theme >= '0' && theme <= '2'){
	      		if(theme == '0'){
	    		  	table.reload('test', {
	                     url:'${pageContext.request.contextPath}/activity/selectActivity_0',
	                 });
	      		} else if(theme == '1'){
	      			table.reload('test', {
		                 url:'${pageContext.request.contextPath}/activity/selectActivity_1',
		             });
	      		} else{
	      			table.reload('test', {
		                 url:'${pageContext.request.contextPath}/activity/selectActivity_2',
		             });
	      		}
	    	 } else{
	    	  	 table.reload('test', { //表格的id
                  	 url:'${pageContext.request.contextPath}/activity/selectActivityByTT?theme='+theme+'&date='+date,
                 });
	        }
	      break; 
	      //自定义头工具栏右侧图标 - 提示
	      case 'LAYTABLE_TIPS':
	        layer.alert('特别提醒，可以在主题搜索框中根据活动状态查询:0未进行/1已进行/2进行中');
	      break;
	    };
	  });
	  
	  //监听行工具事件
	  table.on('tool(test)', function(obj){
	    var data = obj.data;
		var id = data['id_a'];//获取选中的id

	    //console.log(obj)
	    if(obj.event === 'del'){
	      layer.confirm('确定删除吗', function(index){
	        obj.del();
	        window.location.href="${pageContext.request.contextPath}/activity/delActivityById?id_a="+id;
	        layer.close(index);
	      });
	    } else if(obj.event === 'update'){
	    	$.ajax({
				url   :"${pageContext.request.contextPath }/activity/updateActivity",
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
	    	
	    } else if(obj.event === 'editTime'){
	    	var field = $(this).data('field');
	    	laydate.render({ 
	    		 elem: this.firstChild
                 , show: true //直接显示
                 , closeStop: this
                 , type: 'datetime'
                 , done: function (value, date) {
                     data[field] = value;
                     obj.update(data);
                 }
	    		});
	      }  else if(obj.event === 'setLocation'){
			      layer.prompt({
			          formType: 2
			          ,title: '服务地点'
			          ,value: data.location
			        }, function(value, index){
			          layer.close(index);
			          //这里一般是发送修改的Ajax请求
			          //同步更新表格和缓存对应的值
			          obj.update({
			        	  location: value
			          });
			        });
		   }else if(obj.event === 'setDescribe'){
			      layer.prompt({
			          formType: 2
			          ,title: '活动描述'
			          ,value: data.describe
			          ,area: ['350px', '300px']
			        }, function(value, index){
			          layer.close(index);
			          //这里一般是发送修改的Ajax请求
			          //同步更新表格和缓存对应的值
			          obj.update({
			        	  describe: value
			          });
			        });
		   }
	  });
	 //搜索框绑定日期控件
	  laydate.render({
		  elem: '#search_time'
		  ,type: 'date'
	});
	 
	//为绑定元素赋值当前时间
	  laydate.render({
		  elem: '#now_time'
		  ,type: 'datetime'
		  ,value: new Date()
	  });
	  laydate.render({
		  elem: '#serviceTime'
		  ,type: 'datetime'
	  }); 
	  laydate.render({
		  elem: '#endTime'
		  ,type: 'datetime'
	  });

	//提交表单
	form.on('submit(demo2)', function (data) {
		$.ajax({
			url   :"${pageContext.request.contextPath }/activity/insertActivity",
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
<script type="text/html" id="setExamine">

			  {{#  if(Date.parse(d.service_time)-Date.parse(new Date())>0){}}
                 <span lay-event="verify" class="layui-btn layui-bg-orange layui-btn-xs">{{'未进行'}}</span>
              {{#  } else if(Date.parse(d.end_time)-Date.parse(new Date())<0) {}}
               <span lay-event="verify" class="layui-btn layui-bg-green layui-btn-xs">{{'已进行'}}</span>
			  {{#  } else {}}
               <span lay-event="verify" class="layui-btn layui-btn-danger layui-btn-xs">{{'进行中'}}</span>
              {{#  } }}
</script>
	
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
	
<!--弹出层表单	 -->
<form style="display:none;" class="layui-form layui-form-pane" id="popupForm" action="">
  
<section class="content">
<div class="box box-primary">

  <div class="layui-form-item" style="text_align:center;">
    <label class="layui-form-label">活动主题</label>
    <div class="layui-input-inline">
      <input name="theme" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
  </div>
  <div class="layui-form-item" style="text_align:center;">
    <label class="layui-form-label">服务对象</label>
    <div class="layui-input-inline">
      <input name="object" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
   
  </div>
  <div class="layui-form-item">
   <label class="layui-form-label">服务地点</label>
    <div class="layui-input-inline">
      <input name="location" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
    </div>
 <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">活动时间</label>
      <div class="layui-input-inline" style="width: 200px;">
        <input name="service_time" id="serviceTime" class="layui-input" type="text" placeholder="请输入" autocomplete="off">
      </div>
      <div class="layui-form-mid">-</div>
      <div class="layui-input-inline" style="width: 200px;">
        <input name="end_time" id="endTime" class="layui-input" type="text" placeholder="请输入" autocomplete="off">
      </div>
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">活动描述</label>
    <div class="layui-input-block">
      <textarea name="describe" class="layui-textarea"></textarea>
    </div>
  </div>
   
	<input name="publishTime" id="now_time" type="hidden" class="layui-input" autocomplete="off">
  <div class="layui-form-item">
    <button class="layui-btn" lay-filter="demo2" lay-submit="">发布</button>
    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
  </div>
  
  </div>
  </section>
</form>
</body>

</html>