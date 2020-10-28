<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>首页</title>

<script 
	src="${pageContext.request.contextPath}/resources/layui/layui.js"></script>
<link rel="stylesheet" 
	href="${pageContext.request.contextPath}/resources/layui/css/layui.css" media="all">
	
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
	href="${pageContext.request.contextPath}/resources/css/my.css">
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

			
			<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md8">
	  
        <div class="layui-row layui-col-space15">
          <div class="layui-col-md6">
            <div class="layui-card">
              <div class="layui-card-header">快捷方式</div>
              <div class="layui-card-body">
                

                  <div carousel-item>
                    <ul class="layui-row layui-col-space10" style="padding: 5px;">
                      <li class="layui-col-xs3">
                        <a href="${pageContext.request.contextPath}/admin/resident">
                          <i class="layui-icon layui-icon-console" id="style2"></i>
                          <p id="style3">出入登记</p>
                        </a>
                      </li>
                      <li class="layui-col-xs3">
                        <a href="${pageContext.request.contextPath}/admin/reportInfo">
                          <i class="layui-icon layui-icon-chart" id="style2"></i>
                          <p id="style3">体温上报</p>
                        </a>
                      </li>
                      <li class="layui-col-xs3">
                        <a href="${pageContext.request.contextPath}/admin/serviceAppoint">
                          <i class="layui-icon layui-icon-template-1" id="style2"></i>
                          <p id="style3">志愿服务</p>
                        </a>
                      </li>
                      
                      <li class="layui-col-xs3">
                        <a href="${pageContext.request.contextPath}/admin/activity-list">
                          <i class="layui-icon layui-icon-find-fill" id="style2"></i>
                          <p id="style3">社区活动</p>
                        </a>
                      </li>
                    </ul>
                    
                  </div>

                
              </div>
            </div>
           </div>
          <div class="layui-col-md6">
            <div class="layui-card">
              <div class="layui-card-header">待办事项</div>
              <div class="layui-card-body">


                  <div carousel-item>
                    <ul class="layui-row layui-col-space10" style="padding: 5px;">
                      
<!--                        <li class="layui-col-xs6" id="style1"> 
                        <a lay-href="#">
                          <h4>普通审核</h4>
                          <p><cite style="color:#009688;font-size:30px;">${count }</cite></p>
                        </a>
                      </li>
                      <li class="layui-col-xs6" id="style1">
                        <a lay-href="#">
                          <h4>认证审核</h4>
                          <p><cite style="color:#009688;font-size:30px;">${count2 }</cite></p>
                        </a>
                      </li>--> 
                      <li class="layui-col-xs6" id="style1">
                        <a lay-href="template/goodslist.html">
                          <h4>代购安排</h4>
                          <p><cite style="color:#009688;font-size:30px;">${count4 }</cite></p>
                        </a>
                      </li>
                      <li class="layui-col-xs6" id="style1">
                        <a href="javascript:;" onclick="layer.tips('不跳转', this, {tips: 3});">
                          <h4>服务安排</h4>
                          <p><cite style="color:#009688;font-size:30px;">${count3 }</cite></p>
                        </a>
                      </li>
                    </ul>

                  </div>

              </div>
            </div>
          </div>
          <div class="layui-col-md12">
            <div class="layui-card">
              <div class="layui-card-header">数据统计</div>
              <div class="layui-card-body">
                <table class="layui-hide" id="test6" lay-filter="test6"></table>
                
              </div>
            </div>
            
			
          </div>
        </div>
      </div>
      
      <div class="layui-col-md4">
        <div class="layui-card">
          <div class="layui-card-header">活动提醒</div>
          <div class="layui-card-body layui-text">
            <table class="layui-hide" id="test" lay-filter="test"></table>
          </div>
        </div>
        
        <div class="layui-card">
          <div class="layui-card-header">近期公告</div>
          <div class="layui-card-body layadmin-takerates">
           <table class="layui-hide" id="test2" lay-filter="test2"></table>
          </div>
        </div>
        

      </div>
      
    </div>
  </div>
		

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
	    ,url:'${pageContext.request.contextPath}/activity/selectActivity_main'
	   	, method: 'post'
	    ,cols: [[
           {field: 'theme',fixed: 'left', title: '主题',align:'center'}
           ,{field: 'service_time', title: '开始时间',align:'center'
 	    	  ,width: 165, templet : "<div>{{layui.util.toDateString(d.service_time, 'yyyy-MM-dd HH:mm')}}</div>"}
          ,{title: '状态', width: 75,align:'center',templet:'#setExamine',fixed: 'right'}
	    ]]
	  });
	  
	  table.render({
		    elem: '#test2'
		    ,url:'${pageContext.request.contextPath}/notice/selectNotice_main'
		   	, method: 'post'
		    ,cols: [[
		    	 {field: 'tittle', title: '标题',edit: 'text', width:150,align:'center'}
		    	,{field: 'publishTime', title: '发布时间',align:'center',event:'editTime',data_field:'publishTime'
			      ,templet : "<div>{{layui.util.toDateString(d.publishTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
			      
		    ]]
		   ,done:function(d){
		    $('th').css({'background-color': '#009688', 'color': '#fff','font-weight':'bold'})
		    }
		  });
	  
	  table.render({
		    elem: '#test6'
		    ,url:'${pageContext.request.contextPath}/report/selectCount_T'
		   	, method: 'post'
		    ,cols: [[
		    	  {field: 'report_time',fixed: 'left', title: '日期'
			    	  , templet : "<div>{{layui.util.toDateString(d.report_time, 'yyyy-MM-dd')}}</div>"}
		    	  //,{field: 'min', title: '最低温度'}
		    	  //,{field: 'max', title: '最高温度'}
		    	 ,{field: 'count_r', title: '流动人数'}
			     ,{field: 'count', title: '流动车辆数'}
			     ,{field: 'count', title: '非正常范围体温人数',fixed:'right'}
			      ]]
			,done:function(d){
		    $('th').css({'background-color': '#009688', 'color': '#fff','font-weight':'bold'})
		    }
		  });
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
</body>

</html>