<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>其他服务安排界面</title>

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

<style type="text/css">
	.layui-table-cell {
     	overflow: visible !important;
         } 
     /* 使得下拉框与单元格刚好合适 */   
     td .layui-form-select{	
     margin-top: -10px;	
     margin-left: -15px;	
     margin-right: -15px;
     }

</style>
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
				志愿服务管理
			</h1>
			<ol class="breadcrumb">
				<li><a
					href="${pageContext.request.contextPath}/admin/main"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a href="">志愿服务管理</a></li>
			</ol>
			</section>
		<table class="layui-hide" id="test" lay-filter="test"></table>
		
		<section class="content"></section>
 
		<script id="toolbarDemo" type="text/html">
			<button class="layui-btn layui-btn-sm" lay-event="addData">添加</button>
    		<div class="layui-inline" title="搜索" style="float:right;height:29px;" lay-event="LAYTABLE_SEARCH"><i class="layui-icon layui-icon-search"></i></div>
			<input type="text" id="search_time" style="width:100px;float:right;height:30px;" placeholder="请输入时间" autocomplete="off" class="layui-input">
			<input type="text" id="search_name" style="width:100px;float:right;height:30px;" placeholder="请输入申请人" autocomplete="off" class="layui-input">
		</script>

		<script id="barDemo" type="text/html">
			{{#  if(d.complete ==0){ }}    
				<a class="layui-btn layui-btn-xs" lay-event="update">更新</a>
				<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>   
			{{# }if(d.complete ==1) { }}    
				<a class="layui-btn layui-btn-xs" lay-event="update_2">完成</a>
 				<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>  
			{{# }if(d.complete ==2) { }}
				<a class="layui-btn layui-btn-xs layui-btn-disabled" disabled>完成</a>
				<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
			{{#  } }}
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

	  var id_v = -1;
	  table.render({
	    elem: '#test'
	    ,url:'${pageContext.request.contextPath}/service/selectAllService'
	    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
	   	,page: true
	   	,height:450
	    ,defaultToolbar: ['filter',{ //自定义头部工具栏右侧图标
	        title: '提示'
		   ,layEvent: 'LAYTABLE_TIPS'
		   ,icon: 'layui-icon-tips'
		 }]
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left'}
	      ,{field: 'id_s', title: 'ID',hide:true}
	      ,{field: 'object', title: '服务对象'}
	      ,{field: 'location', title: '服务地点'}
	      ,{field: 'context', title: '服务内容',event: 'detailed'}
	      ,{field: 'uname', title: '申请人'}
	      ,{field: 'telephone_u', title: '联系电话',width: 100}
	      ,{field: 'id_v', title: '志愿者',templet:'#volunteers_name'}
	      ,{field: 'appoint_time', title: '预约时间',width: 165
	    	  	,templet : "<div>{{layui.util.toDateString(d.appoint_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	      ,{field: 'complete_time', title: '完成时间',width: 165
	    	  	,templet : '#complete_t'}
	      ,{field: 'complete', title: '服务状态',templet:'#setExamine'}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:110}
	    ]]
	    ,done:function(res){
	        tdTitle();
	
	    }
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
		            title: '申请服务',
		            shadeClose: true,         //弹出框之外的地方是否可以点击
		            offset: '10%',
		            skin: 'layui-layer-rim', //加上边框
		            area: ['60%', '80%'],
		            content: $("#popupForm")
		      });
		  break;
	      case 'LAYTABLE_SEARCH': //table重载
	    	  var uName = $("#search_name").val();
	      	  var date = $("#search_time").val();
	      	if(uName >= '0' && uName <= '2'){
	      		var condition = uName;
	    		 table.reload('test', {
	                 url:'${pageContext.request.contextPath}/service/selectComplete?condition='+condition
	             });
	    	 }else{
	    	  	table.reload('test', { //表格的id
                 	 url:'${pageContext.request.contextPath}/service/selectServiceByUT?uname='+uName+'&date='+date, 
              	});
	    	 }
	      break;
	    	 
	      //自定义头工具栏右侧图标 - 提示
	      case 'LAYTABLE_TIPS':
	        layer.alert('可以根据申请人搜索，也可以根据服务状态搜索:0:未进行/1:进行中/2:已完成');
	      break;
	    };
	  });
	  
	  //监听行工具事件
	  table.on('tool(test)', function(obj){
	    var data = obj.data;
		var id_s = data['id_s'];//获取选中的id
		var id_u = data['id_u'];
	    //console.log(obj)
	    if(obj.event === 'del'){
	      layer.confirm('确定删除吗', function(index){
	        obj.del();
	        window.location.href="${pageContext.request.contextPath}/service/delServiceById?id_s="+id_s;
	        layer.close(index);
	      });
	    } else if(obj.event === 'update'){
	    	if(data['id_v'] != 0){
	    		$.ajax({
					url   :"${pageContext.request.contextPath }/service/updateServiceById",
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
	    	}else if(id_v != -1){
	    		data['id_v'] = id_v;
	    		$.ajax({
					url   :"${pageContext.request.contextPath }/service/updateServiceById",
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
	    	}else{
	    		layer.msg('请先安排志愿者',{time: 1500});
	    	}
	     }else if(obj.event === 'update_2'){
                 //window.location.href="${pageContext.request.contextPath}/service/updateService_c?id_s="+id_s;
	    	 $.ajax({
					url   :"${pageContext.request.contextPath }/service/updateService_c",
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
	       }else if(obj.event === 'detailed'){
			      layer.prompt({
			          formType: 2
			          ,title: '服务内容'
			          ,value: data.context
			        }, function(value, index){
			          layer.close(index);
			          //这里一般是发送修改的Ajax请求
			          //同步更新表格和缓存对应的值
			          obj.update({
			        	  context: value
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
		  elem: '#appoint_time'
		  ,type: 'datetime'
	}); 
	
	  //监听下拉框
	  form.on('select(select1)', function (obj) {
          var elem = $(obj.elem);
          var trElem = elem.parents('tr');
          id_v = obj.value;
          form.render('select');
      })
      
      //提交表单
		form.on('submit(demo2)', function (data) {
			$.ajax({
				url   :"${pageContext.request.contextPath }/service/insertService",
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
  function tdTitle(){
	    $('th').each(function(index,element){
	        $(element).attr('title',$(element).text());
	    });
	    $('td').each(function(index,element){
	        $(element).attr('title',$(element).text());
	    });
	};
</script>
<script type="text/html" id="complete_t">
	  {{# if(d.complete_time){}}
	  {{layui.util.toDateString(new Date(d.complete_time).getTime(), "yyyy-MM-dd HH:mm:ss") }}
	  {{#}else{}}
			 <span>{{'暂无数据'}}</span>
      {{# } }}
</script>
<!-- 渲染下拉框 -->
<script type="text/html" id="volunteers_name">
      {{#  if(d.id_v === 0){}}
            <select name='select1' lay-filter='select1' lay-search=''>
			<option value=""></option>
	  {{#  layui.each(d.name_vs, function(index, item){ }}
       		<option value="{{index}}">{{item}}</option>
	  {{#  }); }}
   			</select>
	  {{#  } else {}}
               <span lay-event="verify">{{d.name_v}}</span>
      {{#  } }}
    		
</script>


<!-- 将 complete 状态转为文字信息 -->
<script type="text/html" id="setExamine">
			  {{#  if(d.complete === 0){d.complete = '未进行' }}
                 <span lay-event="verify" class="layui-btn layui-bg-orange layui-btn-xs">{{d.complete}}</span>
              {{#  } else if(d.complete === 1) {d.complete = '进行中'}}
               <span lay-event="verify" class="layui-btn layui-btn-danger layui-btn-xs">{{d.complete}}</span>
			  {{#  } else {d.complete = '已完成'}}
               <span lay-event="verify" class="layui-btn layui-bg-green layui-btn-xs">{{d.complete}}</span>
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

<form style="display:none;" class="layui-form layui-form-pane" id="popupForm" action="">

<section class="content">
<div class="box box-primary">

<input name="id_u" class="layui-input" type="hidden" value="1" autocomplete="off">

<div class="layui-form-item">
    <label class="layui-form-label">服务类型</label>
	<div class="layui-input-inline">
      <select name="type">
      	<option value=""></option>
        <option value="便民利民">便民利民</option>
        <option value="卫生保健">卫生保健</option>
        <option value="宣传教育">宣传教育</option>
        <option value="心理咨询">心理咨询</option>
      </select>
    </div>
 </div>
  <div class="layui-form-item">
    <label class="layui-form-label">服务对象</label>
    <div class="layui-input-inline">
      <input name="object" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
    <label class="layui-form-label">服务地点</label>
    <div class="layui-input-inline">
      <input name="location" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
  </div>

  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">服务内容</label>
    <div class="layui-input-block">
      <textarea name="context" class="layui-textarea"></textarea>
    </div>
  </div>

  <div class="layui-inline">
      	<label class="layui-form-label">预约时间</label>
      	<div class="layui-input-block">
        	<input name="appoint_time" id="appoint_time" class="layui-input" type="text" autocomplete="off">
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