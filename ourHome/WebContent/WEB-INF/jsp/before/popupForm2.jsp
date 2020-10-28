<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="modal fade" id="gerenfenxiang" tabindex="-1" role="dialog">
		<div class="modal-dialogb" role="document">
			<div class="modal-content modal-info">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-bodya real-spa">
					<div class="login-gridsa">
						<div class="login">
							<div class="login-righta">
								<h3>信息分享</h3>
								<table id="nr" class="layui-table">

<!-- 									<thead> -->
<!-- 										<tr> -->
<!-- 											<th>标题</th> -->
<!-- 											<th>发布时间</th> -->
<!-- 										</tr> -->
<!-- 									</thead> -->
<!-- 									<tbody id="tby"> -->
<%-- 										<c:forEach items="${filedqs }" var="filedq"> --%>
<!-- 											<tr > -->
<%-- 												<td style="width: 70%"><a>${filedq.filename }</a></td> --%>
<%-- 												<td>${filedq.filetime }</td> --%>
<!-- 											</tr> -->
<%-- 										</c:forEach> --%>
<!-- 									</tbody> -->
								</table>
<!-- 								<div id="pag"></div> -->
								<a href="#" type="button" class="layui-btn" data-toggle="modal"
									data-target="#fabugerenfenxiang">发布</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(gerenfenxiangjs).one('click',function(){
			 layui.use(["table","layer","form"], function () {
		            var table = layui.table, layer=layui.layer, form=layui.form;
		            var $=layui.$;

		            var table1 = table.render({
		                elem: '#nr'
		                ,url:'${pageContext.request.contextPath}/before/getallname'
		                	// ,height:'full-110'  分页栏距离底部110，这样可以保证分页栏在下面
		                //,cellMinWidth: 80 全局定义常规单元格的最小宽度，layui 2.2.1 新增
		                ,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
		                    layout: [  'prev', 'page', 'next', ] //自定义分页布局
		                }
		                ,limits:[5,10,20]
		                ,cols: [[
		                    {field:'filename', width:'600', title: '标题'}
		                    ,{field:'filetime', width:'200', title: '时间'}
		                ]]
		            });
			 });
// 			$.ajax({
// 				type : "POST",
// 				dataType: "json",
// 				url : "http://localhost:8080/MyWeb/before/getallname",
// 				success : function(data) {
// 					var d = data.data;
// 					layui.use(['laypage', 'layer',], function () {
// 							  var laypage = layui.laypage;
// 							  //执行一个laypage实例
// 							  laypage.render({
// 							 count: data.length,
// 							 limit:'10',
// 							 elem: pag,
// 							 jump: function (obj) {
// 								//模拟渲染
// 								document.getElementById('tby').innerHTML = function () {
// 									var arr = []
// 											,
// 											thisData = d.concat().splice(obj.curr * obj.limit - obj.limit, obj.limit);
// 									layui.each(thisData, function (index, item) {
// 										var filen = "<td style='width: 70%'>"+item.realname +"" + item.filename +"</a></td>";
// 										arr.push('<tr>');
// 										arr.push(filen);
// 										arr.push("<td>" + item.filetime + "</td>");
// 										arr.push('</tr>');

// 									});
// 									return arr.join('');
// 								}();
// 								}
// 							});
// 						});
// 				}
// 				        }); 
	});
		function aClick(obj){
			var realname = $(obj).attr("name");
			var filename = $(obj).html();
			$.ajax({
				url: '${pageContext.request.contextPath}/before/readfile',
				data: {filename: filename, realname: realname},
				dataType:"text",
				type: 'post',
				success: function (d) {
					$("#chakantittle").empty();
					$("#chakantext").empty();
					$("#chakantittle").append(filename);
					$("#chakantext").append(d);
				}
			});
		}
	</script>
	<div class="modal fade" id="fabugerenfenxiang" tabindex="-1" role="dialog">
		<div class="modal-dialogb" role="document">
			<div class="modal-content modal-info">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-bodya real-spa">
					<div class="login-gridsa">
						<div class="login">
							<div class="login-righta">
								<div class="top">
									<fieldset class="layui-elem-field layui-field-title">
										<legend>分享你的新鲜事</legend>
									</fieldset>
								</div>
								<div class="layui-container"
									style="padding-left: 10%; margin-top: 3%">
									<div class="layui-row">
										<div class="layui-col-xs12 layui-col-md8">
											<form class="layui-form" style="margin-top: 30px" data-target="#fabugerenfenxiang">
												<div class="layui-form-item">
													<label class="layui-form-label">标题：</label>
													<div class="layui-input-block">
														<input type="text" id="tittle" name="tittle"  requiredlay-verify="required" placeholder="请输入标题"
															autocomplete="off" class="layui-input">

													</div>
												</div>
												<div>
												<label class="layui-form-label">正文：</label>
													<div id="tb" class="toolbar"></div>
													<div id="tt" class="text"></div>
													<button id="submit" class="layui-btn" type="submit"
														data-toggle="modal"
									data-target="#gerenfenxiang" style="margin-top: 3%; margin-left: 50%"> 发布</button>
												</div>
											</form>
										</div>
									</div>
								</div>
								<script>
    layui.use('element', function () {
        var element = layui.element;

        //一些事件监听
    });
    var E = window.wangEditor
    var editor = new E('#tb', '#tt')
    editor.customConfig.menus = [
        'bold',  // 粗体
        'fontSize',  // 字号
        'fontName',  // 字体
        'italic',  // 斜体
        'underline',  // 下划线
        'foreColor',  // 文字颜色
        'backColor',  // 背景颜色
        'list',  // 列表
        'justify',  // 对齐方式
        'quote',  // 引用
        'emoticon',  // 表情
        'image',  // 插入图片
        'table',  // 表格
    ]
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.create() ;
    document.getElementById('submit').addEventListener('click', function () {
    	            editor.txt.html(content);
    	            var content = editor.txt.html();
    	            // 读取 text
    	            var tet = editor.txt.text();
    				var tit = $("#tittle").val();
    	 $.ajax({
    	        url: '${pageContext.request.contextPath}/before/input',
    	        data: {tittle:tit,tt:tet},
    	    })
    	      }, false)
</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="chakangerenfenxiang" tabindex="-1" role="dialog" >
		<div class="modal-dialogb" role="document">
			<div class="modal-content modal-info">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-bodya real-spa" >
					<div class="login-gridsa">
						<div class="login">
							<div class="login-righta">
								<div class="top">
									<fieldset class="layui-elem-field layui-field-title">
										<legend id="chakantittle"></legend>
									</fieldset>
								</div>
								<div id="chakantext" style="word-wrap: break-word; word-break: normal;" ></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>