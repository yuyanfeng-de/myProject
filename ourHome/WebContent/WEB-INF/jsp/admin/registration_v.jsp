<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>访客登记</title>
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
				访客登记
			</h1>
			<ol class="breadcrumb">
				<li><a
					href="${pageContext.request.contextPath}/admin/main"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a href="">社区统计</a></li>
				<li class="active">访客登记</li>
			</ol>
			</section>
		<table class="layui-hide" id="test" lay-filter="test"></table>

		<section class="content"></section>
		
		<script id="toolbarDemo" type="text/html">
    		<button class="layui-btn layui-btn-sm" lay-event="addData">添加</button>
			<div class="layui-inline" title="搜索" style="float:right;height:29px;" lay-event="LAYTABLE_SEARCH"><i class="layui-icon layui-icon-search"></i></div>
			<input type="text" id="search_time" style="width:100px;float:right;height:30px;" placeholder="请输入时间" autocomplete="off" class="layui-input">
			<input type="text" id="search_name" style="width:100px;float:right;height:30px;" placeholder="请输入姓名" autocomplete="off" class="layui-input">
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
	    ,url:'${pageContext.request.contextPath}/mobility/selectMobility_v'
	    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
	   	,page: true
	   	, method: 'post'
	    ,defaultToolbar: ['filter']
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left'}
	      ,{field: 'id_v', title: 'ID', width:50}
	      ,{field: 'name_v', title: '姓名',edit: 'text', width:90}
	      ,{field: 'telephone_v', title: '联系电话',edit: 'text', width:120}
	      ,{field: 'reason_v', title: '来访事由',edit: 'text',event: 'setReason', style:'cursor: pointer;'} 
	      ,{field: 'visit_time', title: '来访时间',edit: 'text',event:'edit_outTime',data_field:'visit_time'
	    	  ,width: 170, templet : "<div>{{layui.util.toDateString(d.visit_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	      ,{field: 'visit_temp', title: '体温',edit: 'text', width: 60}
	      ,{field: 'departure_time', title: '离开时间',edit: 'text',event:'edit_returnTime',data_field:'departure_time'
	    	  ,width: 170,templet : "<div>{{layui.util.toDateString(d.departure_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	      ,{field: 'departure_temp', title: '体温',edit: 'text', width: 60}
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
	                title: '访客登记',
	                shadeClose: true,           //弹出框之外的地方是否可以点击
	                offset: '10%',
	                skin: 'layui-layer-rim', //加上边框
	                area: ['60%', '80%'],
	                content: $("#popupForm")
	            });
		      break;
	      
	      case 'LAYTABLE_SEARCH': //table重载
	    	  var uName = $("#search_name").val();
	      	  var date = $("#search_time").val();
	    	  table.reload('test', { //表格的id
                  url:'${pageContext.request.contextPath}/mobility/selectMobilityByNT_v?name_v='+uName+'&date='+date,
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
		var id = data['id_v'];//获取选中的id
		
	    //console.log(obj)
	    if(obj.event === 'del'){
	      layer.confirm('确定删除吗', function(index){
	        obj.del();
	        window.location.href="${pageContext.request.contextPath}/mobility/delMobility_vById?id_v="+id;
	        layer.close(index);
	      });
	    } else if(obj.event === 'update'){
	    	$.ajax({
				url   :"${pageContext.request.contextPath }/mobility/updateMobility_vById",
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
	    	
	    } else if(obj.event === 'edit_outTime'){
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
	      } else if(obj.event === 'edit_returnTime'){
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
		   } else if(obj.event === 'setReason'){
			      layer.prompt({
			          formType: 2
			          ,title: '来访事由'
			          ,value: data.reason_v
			        }, function(value, index){
			          layer.close(index);
			          //这里一般是发送修改的Ajax请求
			          //同步更新表格和缓存对应的值
			          obj.update({
			        	  reason_v: value
			          });
			        });
		   }
	  });
	 //搜索框绑定日期控件
	  laydate.render({
		  elem: '#search_time'
		  ,type: 'date'
	});
	  
	  laydate.render({
		  elem: '#returnTime'
		  ,type: 'datetime'
	}); 
	  laydate.render({
		  elem: '#outTime'
		  ,type: 'datetime'
	});
	//提交表单
	form.on('submit(demo2)', function (data) {
		$.ajax({
			url   :"${pageContext.request.contextPath }/mobility/insertMobility_v",
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

  <div class="layui-form-item">
    <label class="layui-form-label">访客姓名</label>
    <div class="layui-input-inline">
      <input name="name_v" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">联系电话</label>
    <div class="layui-input-inline">
      <input name="telephone_v" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-inline">
      	<label class="layui-form-label">来访时间</label>
      	<div class="layui-input-block">
        	<input name="visit_time" id="outTime" class="layui-input" type="text" autocomplete="off">
      	</div>
    </div>
    <div class="layui-inline">
     	<label class="layui-form-label">体温</label>
      	<div class="layui-input-inline" style="width: 100px;">
        	<input name="visit_temp" class="layui-input" type="text" autocomplete="off">
      	</div>
     </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-inline">
      	<label class="layui-form-label">离开时间</label>
      	<div class="layui-input-block">
        	<input name="departure_time" id="returnTime" class="layui-input" type="text" autocomplete="off">
      	</div>
    </div>
    <div class="layui-inline">
     	<label class="layui-form-label">体温</label>
      	<div class="layui-input-inline" style="width: 100px;">
        	<input name="departure_temp" class="layui-input" type="text" autocomplete="off">
      	</div>
     </div>
  </div>
  
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">来访事由</label>
    <div class="layui-input-block">
      <textarea name="reason_v" class="layui-textarea" placeholder="请输入内容"></textarea>
    </div>
  </div>
	
	<input name="status" class="layui-input" type="hidden" value="1" autocomplete="off">
  <div class="layui-form-item">
    <button class="layui-btn" lay-filter="demo2" lay-submit="">提交</button>
    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
  </div>
  
  </div>
  </section>
</form>
</body>

</html>