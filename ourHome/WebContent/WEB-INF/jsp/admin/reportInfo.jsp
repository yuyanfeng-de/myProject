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
				上报信息
			</h1>
			<ol class="breadcrumb">
				<li><a
					href="${pageContext.request.contextPath}/admin/main"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a href="">信息管理</a></li>
				<li class="active">上报信息</li>
			</ol>
			</section>
		<table class="layui-hide" id="test" lay-filter="test"></table>
		
		<section class="content"></section>

		<script id="toolbarDemo" type="text/html">
			<button class="layui-btn layui-btn-sm" lay-event="select">筛选体温异常人员</button>
    		<div class="layui-inline" title="搜索" style="float:right;height:29px;" lay-event="LAYTABLE_SEARCH"><i class="layui-icon layui-icon-search"></i></div>
			<input type="text" id="search_time" style="width:100px;float:right;height:30px;" placeholder="请输入时间" autocomplete="off" class="layui-input">
			<input type="text" id="search_name" style="width:100px;float:right;height:30px;" placeholder="请输入姓名" autocomplete="off" class="layui-input">
		</script>
		<script id="barDemo" type="text/html">
			 <a class="layui-btn layui-btn-xs" lay-event="detailed">详情</a>
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
	    ,url:'${pageContext.request.contextPath}/report/selectAllReport'
	    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
	   	,page: true
	    ,defaultToolbar: ['filter']
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left'}
	      ,{field: 'id_t', title: 'ID', width:60,hide:true}
	      ,{field: 'uname', title: '姓名'}
	      ,{field: 'telephone_u', title: '联系电话'}
	      ,{field: 'health', title: '身体状况', width: 130}
	      ,{field: 'temperature', title: '体温', width: 130,templet:'#setStyle'}
	      ,{field: 'report_time', title: '上报时间',width: 180
	    	  	,templet : "<div>{{layui.util.toDateString(d.report_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	      ,{field: 'uaddress', title: '住址'}
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
	      case 'select':
	      table.reload('test', { //表格的id
          	url:'${pageContext.request.contextPath}/report/selectTemp_h', 
        });
		    break;
	      case 'LAYTABLE_SEARCH': //table重载
	    	  var uName = $("#search_name").val();
	      	  var date = $("#search_time").val();
	      	  table.reload('test', { //表格的id
                	url:'${pageContext.request.contextPath}/report/selectReportByUT?uname='+uName+'&date='+date, 
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
		var id = data['id_t'];//获取选中的id
	    //console.log(obj)
	    if(obj.event === 'del'){
	      layer.confirm('确定删除吗', function(index){
	        obj.del();
	        window.location.href="${pageContext.request.contextPath}/report/delReportById?id_t="+id;
	        layer.close(index);
	      });
	    } else if(obj.event === 'detailed'){
	    	
	    	form.val('popupForm', {
    	      "uname": data['uname']
	    	  ,"health": data['health']
    	      ,"temperature": data['temperature']
    	      ,"contact" : data['contact']
	    	  ,"difficulty" : data['difficulty']
	    	  ,"outplan" : data['outplan']
	    	  ,"report_time": layui.util.toDateString(data['report_time'], 'yyyy-MM-dd HH:mm:ss')
    	      ,"uaddress" :data['uaddress']
    	      ,"telephone_u" :data['telephone_u']
	    	    });
	    	
	    	layer.open({
                type: 1,
                title: '详细信息',
                shadeClose: true,         //弹出框之外的地方是否可以点击
                offset: '10%',
                skin: 'layui-layer-rim', //加上边框
                area: ['60%', '80%'],
                content: $("#popupForm")
            });
	    }
		
	  });
	  
	//搜索框绑定日期控件
	  laydate.render({
		  elem: '#search_time'
		  ,type: 'date'
	});
	
	});
</script>	

<script type="text/html" id="setStyle">
			  {{#  if(d.temperature >= 36.3 && d.temperature<=37.2){}}
                 <span lay-event="verify">{{d.temperature}}</span>
			  {{#  } else {}}
               <span lay-event="verify"  style="color:red;">{{d.temperature}}</span>
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
	
<form style="display:none;" class="layui-form layui-form-pane" lay-filter="popupForm" id="popupForm" action="">

<section class="content">
<div class="box box-primary">

  <div class="layui-form-item">
    <label class="layui-form-label" style="width:80px">姓名</label>
    <div class="layui-input-inline" style="width:100px">
      <input name="uname" class="layui-input" type="text" autocomplete="off" lay-verify="required">
    </div>
  </div>
<div class="layui-form-item">
    <label class="layui-form-label" style="width: 130px;">本人健康情况</label>
	   <div class="layui-input-inline"  style="width: 100px;">
	      <select name="health">
	     	<option value="">请选择</option>
	        <option value="健康">健康</option>
	        <option value="发热">发热</option>
	        <option value="疑似">疑似</option>
	        <option value="确诊">确诊</option>
	        <option value="已治愈">已治愈</option>
	        <option value="其他">其他</option>
	      </select>
	    </div>
	    
	 <label class="layui-form-label">体温</label>
    <div class="layui-input-inline" style="width: 100px;">
      <input name="temperature" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
  </div>

	<div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">14天内是否接触过疑似或确诊人员</label>
	    <div class="layui-input-block">
	      <input name="contact" title="是" type="radio" value="1">
	      <input name="contact" title="否" type="radio" value="0">
	    </div>
	 </div>
	 
	 <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">生活是否有困难</label>
	    <div class="layui-input-block">
	      <input name="difficulty" title="是" type="radio" value="1">
	      <input name="difficulty" title="否" type="radio" value="0">
	    </div>
	 </div>
	 
	 <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">近期是否有外出计划</label>
	    <div class="layui-input-block">
	      <input name="outplan" title="是" type="radio" value="1">
	      <input name="outplan" title="否" type="radio" value="0">
	    </div>
	 </div>
	 <div class="layui-form-item layui-form-text">
	    <label class="layui-form-label">上报时间</label>
	    <div class="layui-input-block">
	      <input name="report_time" class="layui-input" type="text">
	    </div>
	 </div>
<div class="layui-form-item">
    <label class="layui-form-label" style="width:100px">联系方式</label>
    <div class="layui-input-inline" style="width:150px">
      <input name="telephone_u" class="layui-input" type="text" autocomplete="off" lay-verify="required">
    </div>
    <label class="layui-form-label" style="width:100px">住址</label>
    <div class="layui-input-inline" style="width:150px">
      <input name="uaddress" class="layui-input" type="text" autocomplete="off" lay-verify="required">
    </div>
  </div>
  
  </div>
  </section>
</form>
</body>

</html>