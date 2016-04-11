<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="wrapper wrapper-content animated fadeInRight"
	style="height: 100%">
	<div class="ibox float-e-margins">
		<div class="ibox-content">
			<div class="input-group">
                   <div class="input-group">
	                   <input type="text" placeholder="账户名" name="accountName" class="input form-control col-sm-6">
	                   <span class="input-group-btn">
	                   		<button type="button" class="btn btn btn-primary"> <i class="fa fa-search"></i> 搜索</button>
	                   </span>
                   </div>
            </div>
            <div class="table-responsive">
				<table id="logTable" data-toolbar="#toolbar" 
					data-show-refresh="true"
					data-show-toggle="true" data-show-columns="true"
					data-show-export="true" data-show-footer="false"
					data-mobile-responsive="true">
				</table>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
		$('#logTable').bootstrapTable({
			url : rootPath+'/log/queryLogForList.shtml',
			height : '100%',
			sortName : 'date',
			sortOrder : 'desc',
			showColumns : true,
			showExport : true,
			striped : true,
			pagination : true,
			pageNumber : 1,
			pageSize : 10,
			pageList : "[10,20,30,All]",
			search : false,
			sidePagination : 'server',//服务端分页  client //客户端分页
			idField : 'id',
			uniqueId : 'id',
			responseHandler : responseHandler, //处理分页函数
			queryParams : queryParams,//参数处理函数
			minimumCountColumns : 2,
			columns : [ {
				checkbox : true
			}, {
				field : 'accountName',
				title : '账户名',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'module',
				title : '请求模块',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'methods',
				title : '请求方法',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'url',
				title : '请求地址',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'ip',
				title : 'IP',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'description',
				title : '描述',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'actionTime',
				title : '执行时间',
				align : 'center',
				valign : 'middle',
				sortable : true
			}, {
				field : 'date',
				title : '添加时间',
				align : 'center',
				valign : 'middle',
				sortable : true
			}]
		});
</script>