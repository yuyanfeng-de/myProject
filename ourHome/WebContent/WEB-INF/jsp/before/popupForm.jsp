<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script id="barDemo" type="text/html">
			    {{#  if(d.complete ==0){ }}    
				<a class="layui-btn layui-btn-xs" lay-event="update">领取</a>
				{{# }if(d.complete ==1) { }}
				<a class="layui-btn layui-btn-xs" lay-event="update_2">完成</a>
 				{{# }if(d.complete ==2) { }}
				<a class="layui-btn layui-btn-xs layui-btn-disabled" disabled>完成</a>
				{{#  } }}
</script>
<script id="barDemo5" type="text/html">
			{{#  if(d.complete_b ==0){ }}    
				<a class="layui-btn layui-btn-xs" lay-event="update">更新</a>  
			{{# }if(d.complete_b ==1) { }}    
				<a class="layui-btn layui-btn-xs" lay-event="update_2">完成</a>
			{{# }if(d.complete_b ==2) { }}
				<a class="layui-btn layui-btn-xs layui-btn-disabled" disabled>完成</a>
			{{#  } }}
</script>
<script type="text/html" id="setExamine3">
			  {{#  if(d.complete_b === 0){d.complete_b = '未进行' }}
                 <span lay-event="verify" class="layui-btn layui-bg-orange layui-btn-xs">{{d.complete_b}}</span>
              {{#  } else if(d.complete_b === 1) {d.complete_b = '进行中'}}
               <span lay-event="verify" class="layui-btn layui-btn-danger layui-btn-xs">{{d.complete_b}}</span>
			  {{#  } else {d.complete_b = '已完成'}}
               <span lay-event="verify" class="layui-btn layui-bg-green layui-btn-xs">{{d.complete_b}}</span>
              {{#  } }}
</script>	
<script>
var uid = '${User.uid}';
layui.use(['table','form','laydate','element'], function(){
	var table = layui.table;
	var form = layui.form;
	var laydate = layui.laydate;
	var element = layui.element;
	
	table.render({
	    elem: '#test'
	    ,url:'${pageContext.request.contextPath}/activity/selectActivity_main'
	   	, method: 'post'
	    ,cols: [[
 		   {field: 'theme', title: '活动主题',fixed: 'left'}
	      ,{field: 'object', title: '服务对象'}
	      ,{field: 'location', title: '服务地点'}
	      ,{field: 'describe', title: '活动描述', width:110}
	      ,{field: 'service_time', title: '开始时间'
	    	  ,width: 165, templet : "<div>{{layui.util.toDateString(d.service_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	      ,{field: 'end_time', title: '结束时间'
	    	  ,width: 165, templet : "<div>{{layui.util.toDateString(d.end_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	      ,{title: '状态',width: 130,align:'center',templet:'#setExamine',fixed: 'right'}
	    ]]
		,done:function(d){
	    $('th').css({'background-color': '#009688', 'color': '#fff','font-weight':'bold'});
	    }
	  });
	
	//渲染公告表单
	table.render({
	    elem: '#test2'
	    ,url:'${pageContext.request.contextPath}/notice/selectNotice_main'
	   	, method: 'post'
	    ,cols: [[
			   {field: 'tittle', title: '标题',edit: 'text', width:150, fixed: 'left'}
		      ,{field: 'context', title: '公告内容',edit: 'text',event: 'setContext'} 
		      ,{field: 'publishTime', title: '发布时间',edit: 'text',event:'editTime',data_field:'publishTime',fixed: 'right'
		    	  ,width: 180, templet : "<div>{{layui.util.toDateString(d.publishTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	    ]]
		,done:function(d){
	    $('th').css({'background-color': '#009688', 'color': '#fff','font-weight':'bold'})
	    }
	  });
	
	//渲染志愿者记录表单
	table.render({
	    elem: '#test4'
	    ,url:'${pageContext.request.contextPath}/service/selectComplete_2'
	    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
	   	,page: true
	    ,defaultToolbar: ['filter','print']
	    ,cols: [[
	       {field: 'object', title: '服务对象',fixed: 'left'}
	      ,{field: 'location', title: '服务地点',hide:true}
	      ,{field: 'context', title: '服务内容',event: 'detailed'}
	      ,{field: 'uname', title: '申请人'}
	      ,{field: 'telephone_u', title: '联系电话'}
	      ,{field: 'name_v', title: '志愿者'}
	      ,{field: 'appoint_time', title: '预约时间',width: 165
	    	  	,templet : "<div>{{layui.util.toDateString(d.appoint_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	      ,{field: 'complete_time', title: '完成时间',width: 165
	    	  	,templet : "<div>{{layui.util.toDateString(d.complete_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	    ]]
	    ,done:function(res){
	    	$('th').css({'background-color': '#009688', 'color': '#fff','font-weight':'bold'});
	        tdTitle();
	
	    }
	  });

	if('${User.uid}' != null && '${User.uid}' !=''){
	table.render({
	    elem: '#task'
	    ,url:'${pageContext.request.contextPath}/service/selectServiceById_v?uid='+'${User.uid}'
	    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
	    ,defaultToolbar: ['filter','print']
	    ,cols: [[
	       {field: 'id_s', title: 'ID',hide:true,fixed: 'left'}
	      ,{field: 'object', title: '服务对象'}
	      ,{field: 'location', title: '服务地点'}
	      ,{field: 'context', title: '服务内容',event: 'detailed'}
	      ,{field: 'uname', title: '申请人'}
	      ,{field: 'telephone_u', title: '联系电话',width: 100}
	      ,{field: 'name_v', title: '志愿者',hide:true}
	      ,{field: 'appoint_time', title: '预约时间',width: 165
	    	  	,templet : "<div>{{layui.util.toDateString(d.appoint_time, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
	      ,{field: 'complete_time', title: '完成时间',width: 165
	    	  	,templet : '#complete_t'}
	      ,{field: 'complete', title: '服务状态',templet:'#setExamine2'}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo'}
	    ]]
	    ,done:function(data){
	    	$('th').css({'background-color': '#009688', 'color': '#fff','font-weight':'bold'});
	        tdTitle();
	    }
	  });
		
	table.render({
	    elem: '#task2'
	    ,url:'${pageContext.request.contextPath}/purchase/selectAllbuyById?uid='+'${User.uid}'
	    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
	    ,cols: [[
	       {field: 'id_b', title: 'ID',hide:true}
	      ,{field: 'describe', title: '所需物品',event: 'detailed2'}
	      ,{field: 'name_v', title: '志愿者',templet:'#volunteers_name',hide:true}
	      ,{field: 'abtime', title: '完成时间',width: 165
	    	  	,templet : '#complete_p'}
	      ,{field: 'complete_b', title: '服务状态',templet:'#setExamine3'}
	      ,{fixed: 'right', title:'操作', toolbar: '#barDemo5'}
	    ]]
	    ,done:function(res){
	        tdTitle();
	
	    }
	  });
	}
	
	table.render({
	    elem: '#test6'
	    ,url:'${pageContext.request.contextPath}/report/selectCount_T'
	   	, method: 'post'
	    ,cols: [[
	    	  {field: 'report_time',fixed: 'left', title: '日期'
		    	  , templet : "<div>{{layui.util.toDateString(d.report_time, 'yyyy-MM-dd')}}</div>"}
	    	  //,{field: 'min', title: '最低温度'}
	    	  //,{field: 'max', title: '最高温度'}
	    	  ,{field: 'count_r', title: '进入人数'}
		      ,{field: 'count', title: '进出车辆数',fixed:'right'}
		      ]]
		,done:function(d){
	    $('th').css({'background-color': '#009688', 'color': '#fff','font-weight':'bold'})
	    }
	  });
	
	
	//监听行工具事件
	table.on('tool(task2)', function(obj){
		  var data = obj.data;
		  if(obj.event === 'update_2'){
			  $.ajax({
					url   :"${pageContext.request.contextPath }/purchase/updateComplete_b",
					type  :"post",
					data  :JSON.stringify(data),
					contentType :"application/json",
					dataType :"json",
					success :function(d){
						if(d!=null){
							layer.msg('更新成功',{time: 1500});
							location.reload();
						}
					}
				});
			  } else if(obj.event === 'detailed2'){
			      layer.prompt({
			          formType: 2
			          ,title: '所需物品'
			          ,value: data.describe
			        }, function(value, index){
			          layer.close(index);
			          //这里一般是发送修改的Ajax请求
			          //同步更新表格和缓存对应的值
			          obj.update({
			        	  describe: value
			          });
			        });
		   		} else if(obj.event === 'update'){
		   			data.vtid=${User.uid};
		   			$.ajax({
						url   :"${pageContext.request.contextPath }/purchase/updatePurchase2",
						type  :"post",
						data  :JSON.stringify(data),
						contentType :"application/json",
						dataType :"json",
						success :function(d){
							if(d!=null){
								layer.msg('更新成功',{time: 1500});
								location.reload();
							}
						}
					});
		   		}
		  
	  });
	  table.on('tool(task)', function(obj){
		  var data = obj.data;
		  if(obj.event === 'update_2'){
			  $.ajax({
					url   :"${pageContext.request.contextPath }/service/updateCompleteBefore",
					type  :"post",
					data  :JSON.stringify(data),
					contentType :"application/json",
					dataType :"json",
					success :function(d){
						if(d!=null){
							layer.msg('更新成功',{time: 1500});
							location.reload();
						}
					}
				});
			  } else if(obj.event === 'detailed'){
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
		   		} else if(obj.event === 'update'){
		   			data.id_v=${User.uid};
		   			$.ajax({
						url   :"${pageContext.request.contextPath }/service/updateServiceById2",
						type  :"post",
						data  :JSON.stringify(data),
						contentType :"application/json",
						dataType :"json",
						success :function(d){
							if(d!=null){
								layer.msg('更新成功',{time: 1500});
								location.reload();
							}
						}
					});
		   		}
		  
	  });
	//监听行工具事件
	  table.on('tool(test4)', function(obj){
		  
		  if(obj.event === 'detailed'){
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

	//提交孤寡老人验证表单
	form.on('submit(demo2)', function (data) {
		$.ajax({
			url   :"${pageContext.request.contextPath }/before/insertVerfy_e",
			type  :"post",
			data  :JSON.stringify(data.field),
			contentType :"application/json",
			dataType :"json",
			success :function(d){
				if(d!=null){
					layer.msg('提交成功',{time: 1500});
				}
			}
		});
	})
	//提交志愿者验证表单
	form.on('submit(demo3)', function (data) {
		$.ajax({
			url   :"${pageContext.request.contextPath }/before/insertVerfy_v",
			type  :"post",
			data  :JSON.stringify(data.field),
			contentType :"application/json",
			dataType :"json",
			success :function(d){
				if(d!=null){
					layer.msg('提交成功',{time: 1500});
				}
			}
		});
	})
	
	//为绑定元素赋值当前时间
	  laydate.render({
		  elem: '#now_time'
		  ,type: 'datetime'
		  ,value: new Date()
	  });
	 laydate.render({
		  elem: '#appoint_time'
		  ,type: 'datetime'
	}); 
	//提交上报信息表单
	form.on('submit(demo4)', function (data) {
		$.ajax({
			url   :"${pageContext.request.contextPath }/report/insertReport",
			type  :"post",
			data  :JSON.stringify(data.field),
			contentType :"application/json",
			dataType :"json",
			success :function(d){
				if(d!=null){
					layer.msg('提交成功',{time: 1500});
				}
			}
		});
	})

	  //提交申报服务表单
		form.on('submit(demo5)', function (data) {
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

function identity(){
	
	layer.open({
		type: 1,
		title: ' 认证类型',
		shadeClose: true,
		skin: 'layui-layer-rim',
		area: ['300px', '200px'],
		content: $('#detail').html()
	});
	
 }

function statistics(){
	layer.open({
		type: 1,
		title: '统计结果',
		shadeClose: true,
		skin: 'layui-layer-rim',
		area: ['60%', '65%'],
		content: $('#statistics_1')
	});
}

//志愿者认证表
function volunteer(){
	 layer.open({
	        type: 1,
	        title: '志愿者认证',
	        shadeClose: true,         //弹出框之外的地方是否可以点击
	        offset: '10%',
	        skin: 'layui-layer-rim', //加上边框
	        area: ['60%', '65%'],
	        content: $("#volunteerForm")
	    });
}
 //孤寡老人认证表
 function elderly(){
	 layer.open({
	        type: 1,
	        title: '孤寡老人认证',
	        shadeClose: true,         //弹出框之外的地方是否可以点击
	        offset: '10%',
	        skin: 'layui-layer-rim', //加上边框
	        area: ['60%', '65%'],
	        content: $("#elderlyForm")
	    });
 }
 
 //信息上报
 function reportInfo(){
		
		layer.open({
			type: 1,
			title: '体温上报',
			shadeClose: true,
			skin: 'layui-layer-rim',
			area: ['60%', '65%'],
			content: $('#reportInfoForm')
		});
		
	 }
 
 //申报服务
 function service(){
	 layer.open({
         type: 1,
         title: '申报服务',
         shadeClose: true,         //弹出框之外的地方是否可以点击
         offset: '10%',
         skin: 'layui-layer-rim', //加上边框
         area: ['60%', '80%'],
         content: $("#serviceForm")
   });
 }
 
//  修改密码
 function changePassword(){
	 layer.open({
         type: 1,
         title: '修改密码',
         shadeClose: true,         //弹出框之外的地方是否可以点击
         offset: '10%',
         skin: 'layui-layer-rim', //加上边框
         area: ['60%', '80%'],
         content: $("#changePasswordForm")
   });
 }
 //修改个人信息
 function updateInfo(){
	 layer.open({
         type: 1,
         title: '个人信息',
         shadeClose: true,         //弹出框之外的地方是否可以点击
         offset: '10%',
         skin: 'layui-layer-rim', //加上边框
         area: ['60%', '80%'],
         content: $("#updateInfoForm")
     });
 }
 function volunteer_v(){
	 $('#zhiyuanzhe').modal('show');
 }
 function volunteerTask(){
	 layer.open({
			type: 1,
			title: '服务类型',
			shadeClose: true,
			skin: 'layui-layer-rim',
			area: ['300px', '200px'],
			content: $('#detail3').html()
		});  
	 //$('#task_v').modal('show');
 }
 function task1(){
	 layer.open({
			type: 1,
			title: '普通服务',
			shadeClose: true,
			skin: 'layui-layer-rim',
			area: ['60%', '65%'],
			content: $('#task_v')
		});
 }
 function task2(){
	 layer.open({
			type: 1,
			title: '代购服务',
			shadeClose: true,
			skin: 'layui-layer-rim',
			area: ['60%', '65%'],
			content: $('#task_2')
		});
 }
 function tdTitle(){
	    $('th').each(function(index,element){
	        $(element).attr('title',$(element).text());
	    });
	    $('td').each(function(index,element){
	        $(element).attr('title',$(element).text());
	    });
}
</script>
<script type="text/html" id="complete_t">
	  {{# if(d.complete_time){}}
	  {{layui.util.toDateString(new Date(d.complete_time).getTime(), "yyyy-MM-dd HH:mm:ss") }}
	  {{#}else{}}
			 <span>{{'暂无数据'}}</span>
      {{# } }}
</script>
<script type="text/html" id="complete_p">
	  {{# if(d.abtime){}}
	  {{layui.util.toDateString(new Date(d.abtime).getTime(), "yyyy-MM-dd HH:mm:ss") }}
	  {{#}else{}}
			 <span>{{'暂无数据'}}</span>
      {{# } }}
</script>
<script type="text/html" id="setExamine2">
			  {{#  if(d.complete === 0){d.complete = '未进行' }}
                 <span lay-event="verify" class="layui-btn layui-bg-orange layui-btn-xs">{{d.complete}}</span>
              {{#  } else if(d.complete === 1) {d.complete = '进行中'}}
               <span lay-event="verify" class="layui-btn layui-btn-danger layui-btn-xs">{{d.complete}}</span>
			  {{#  } else {d.complete = '已完成'}}
               <span lay-event="verify" class="layui-btn layui-bg-green layui-btn-xs">{{d.complete}}</span>
              {{#  } }}
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

<script type="text/html" id="detail3">
<div style="text-align: center;vertical-align: middle;">
	<div style="margin:20px 20px;">
		<button class="layui-btn" style="width:150px;" onclick="task1();">普通服务</button>
	</div>
	<div style="margin:20px 20px;">
		<button class="layui-btn" style="width:150px;" onclick="task2();">代购服务</button>
	</div>
</div>
</script>

<script type="text/html" id="detail">
<div style="text-align: center;vertical-align: middle;">
	<div style="margin:20px 20px;">
		<button class="layui-btn" style="width:150px;" onclick="volunteer();">志愿者认证</button>
	</div>
	<div style="margin:20px 20px;">
		<button class="layui-btn" style="width:150px;" onclick="elderly();">孤寡老人认证</button>
	</div>
</div>
</script>

<div id="statistics_1" style="display:none;">
<div class="login-gridsa">
		<div class="login">
			<div class="login-right">
				<h3>详情</h3>
					<table class="layui-hide" id="test6" lay-filter="test6"></table>
				</div>
				</div>
		</div>
</div>

<div id="task_v" style="display:none;">
<div class="login-gridsa">
		<div class="login">
			<div class="login-right">
				<h3>普通服务</h3>
					<table class="layui-hide" id="task" lay-filter="task"></table>
					</div>
				</div>
		</div>
</div>

<div id="task_2" style="display:none;">
<div class="login-gridsa">
		<div class="login">
			<div class="login-right">
				<h3>代购服务</h3>
					<table class="layui-hide" id="task2" lay-filter="task2"></table>
					</div>
				</div>
		</div>
</div>
<!-- 孤寡老人验证弹出框 -->
<form style="display:none;" class="layui-form layui-form-pane" id="elderlyForm" action="">

<section class="content">
<div class="box box-primary">

  <input name="id_u" class="layui-input" value="${User.uid }" type="hidden" autocomplete="off">
  <div class="layui-form-item">
    <label class="layui-form-label">年龄</label>
    <div class="layui-input-inline" style="width: 100px;">
      <input name="age" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
  </div>

  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">申请理由</label>
    <div class="layui-input-block">
      <textarea name="reason" class="layui-textarea"></textarea>
    </div>
  </div>
  
  <input name="examine_e" id="examine_e"  class="layui-input" type="hidden" value="0" autocomplete="off">
  <input name="estatus" class="layui-input" type="hidden" value="1" autocomplete="off">
  <div class="layui-form-item">
    <button class="layui-btn" lay-filter="demo2" lay-submit="">提交</button>
    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
  </div>
  
  </div>
  </section>
</form>

<!-- 志愿者验证弹出框 -->
<form style="display:none;" class="layui-form layui-form-pane" lay-filter="volunteerForm" id="volunteerForm" action="">

<section class="content">
<div class="box box-primary">

<input name="id_u" class="layui-input" type="hidden" value="${User.uid }" autocomplete="off">

  <div class="layui-form-item">
    <label class="layui-form-label">职业</label>
    <div class="layui-input-inline" style="width: 200px;">
      <input name="occupation" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">特长</label>
    <div class="layui-input-inline" style="width:400px">
      <input name="specialty" class="layui-input" type="text" autocomplete="off" lay-verify="required">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">服务意向</label>
    <div class="layui-input-inline" style="width:400px">
      <input name="intention" class="layui-input" type="text" autocomplete="off" lay-verify="required">
    </div>
  </div>

  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">相关工作经历</label>
    <div class="layui-input-block">
      <textarea name="experience" class="layui-textarea"></textarea>
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">其他说明及要求</label>
    <div class="layui-input-block">
      <textarea name="other" class="layui-textarea"></textarea>
    </div>
  </div>
  
  <input name="examine_v" id="examine_v" class="layui-input" type="hidden" value="0" autocomplete="off">

  
  <div class="layui-form-item">
    <button class="layui-btn" lay-filter="demo3" lay-submit="">提交</button>
    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
  </div>
  
  </div>
  </section>
</form>

<!-- 体温上报弹框 -->
<form style="display:none;" class="layui-form layui-form-pane" lay-filter="popupForm" id="reportInfoForm" action="">

<section class="content">
<!-- <div class="box box-primary"> -->

<input name="id_u" class="layui-input" type="hidden" value="${User.uid }" autocomplete="off">
<div style="margin-top:10px;" class="layui-form-item">
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
	 
 <input name="report_time" id="now_time" type="hidden" class="layui-input" autocomplete="off">
  <div class="layui-form-item" style="float:right;">
    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
     <button class="layui-btn" lay-filter="demo4" lay-submit="">提交</button>
  </div>
  
<!--   </div> -->
  </section>
</form>

<!-- 申请服务 -->
<form style="display:none;" class="layui-form layui-form-pane" id="serviceForm" action="">

<section class="content">
<div class="box box-primary">

<input name="id_u" class="layui-input" type="hidden" value="${User.uid }" autocomplete="off">

<div class="layui-form-item">
    <label class="layui-form-label">服务类型</label>
    <div class="layui-input-inline">
      <input name="type" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
 </div>
  <div class="layui-form-item">
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
  <div class="layui-form-item" style="float:right;">
    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
     <button class="layui-btn" lay-filter="demo5" lay-submit="">提交</button>
  </div>
  
</div>
</section>
</form>

<!-- 修改密码 -->
<form style="display:none;" id="changePasswordForm" action="${pageContext.request.contextPath}/before/updatePassword" method="post">
		<!-- 正文区域 -->
		<section class="content">

		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">修改用户密码</h3>
			</div>
			<!-- 表单内容 -->
			<div style="width:40%; margin: 0 auto; padding-bottom: 20px;">
			<p style="text-align: center; color:red; font-size:16px;">${message_p}</p>
			<!--tab内容-->
			<div class="tab-content">
				<!--label显示的内容-->
				<div class="tab-pane active" id="tab-label">
					<div class="row data-type">
						<div class="col-md-3 title">原始密码</div>
						<div class="col-md-9 data">
							<input type="password" name="password" class="form-control"
								placeholder="请输入密码" value="${password}">
						</div>
						<div class="col-md-3 title">新密码</div>
						<div class="col-md-9 data">
							<input type="password" name="npassword" class="form-control"
								placeholder="请输入新密码" value="${npassword }">
						</div>
						<div class="col-md-3 title">确认新密码</div>
						<div class="col-md-9 data">
							<input type="password" name="rpassword" class="form-control"
								placeholder="请输入新密码" value="${rpassword }">
						</div>
					</div>
				</div>
				</div>
			
				<!--订单信息/-->
				<!--工具栏-->
				<div class="box-tools text-center">
					<button type="submit" class="btn bg-maroon">保存</button>
					<button type="button" class="btn bg-default"
						onclick="history.back(-1);">返回</button>
				</div>
				<!--工具栏/-->
		</section>
		<!-- 正文区域 /-->
</form>

<!-- 个人资料表单 -->
<form style="display:none;" class="layui-form layui-form-pane"  id="updateInfoForm" action="">

<input name="uid" class="layui-input" value="${User.uid }" type="hidden" autocomplete="off">
<section class="content">
<div class="box box-primary">

  <div class="layui-form-item">
    <label class="layui-form-label">用户名</label>
    <div class="layui-input-inline">
      <input name="uname" value="${User.uname }" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-inline">
      <input name="upassword" value="${User.upassword }" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
  </div>
	
 <div class="layui-form-item">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block" style="width:80px">
      <input name="usex" class="layui-input" type="text" value="${User.usex }">
    </div>
 </div>
<div class="layui-form-item">
	<label class="layui-form-label">学历</label>
	<div class="layui-input-inline" style="width: 115px;">
      <input name="ueducation" value="${User.ueducation }"  class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
	<label class="layui-form-label">政治面貌</label>
	<div class="layui-input-inline"  style="width: 100px;">
      <select name="upolitic">
        <option value="${User.upolitic }">${User.upolitic }</option>
      </select>
    </div>
    </div>
  <div class="layui-form-item">
    <label class="layui-form-label">身份证号</label>
    <div class="layui-input-inline" style="width: 200px;">
      <input name="uidcard" value="${User.uidcard }" class="layui-input" type="text" placeholder="请输入" autocomplete="off" lay-verify="required">
    </div>
  </div>
  <div class="layui-form-item">
	<label class="layui-form-label">住址</label>
	    <div class="layui-input-inline">
	      <input name="uaddress" value="${User.uaddress }" class="layui-input" type="text" placeholder="如:A栋404" autocomplete="off" lay-verify="required">
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
      <input name="telephone_u" value="${User.telephone_u }" class="layui-input" type="text" autocomplete="off" lay-verify="required">
    </div>
  </div>
  <input name="apply_time" id="now_time" type="hidden" class="layui-input" autocomplete="off">
  <input name="ustatus" class="layui-input" type="hidden" value="1" autocomplete="off">
  <input name="examine" class="layui-input" type="hidden" value="1" autocomplete="off">
  <div class="layui-form-item">
    <button class="layui-btn" lay-filter="demo6" lay-submit="">修改</button>
  </div>
  
  </div>
  </section>
</form>
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
