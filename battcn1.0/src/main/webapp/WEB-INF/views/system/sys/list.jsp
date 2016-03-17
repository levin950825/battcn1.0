<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="wrapper wrapper-content animated fadeInRight" style="height: 100%">
	<div class="ibox float-e-margins">
		<div class="ibox-content">
			<div class="table-responsive">
				<table id="monitorTable" data-toolbar="#toolbar"
					data-show-refresh="true" data-show-toggle="true"
					data-show-columns="true" data-show-export="true"
					data-show-footer="false" data-mobile-responsive="true">
				</table>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	function getRoleIdSelections() {
		return $.map($("#monitorTable").bootstrapTable('getSelections'), function(
				row) {
			return row.id
		});
	}

	$('#monitorTable').bootstrapTable({
		url : rootPath + '/sys/queryMonitorForList.shtml',
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
			field : 'cpuUsage',
			title : 'cpu使用率',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'setCpuUsage',
			title : '预设cpu使用率',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'jvmUsage',
			title : 'Jvm使用率',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'setJvmUsage',
			title : '预设Jvm使用率',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'ramUsage',
			title : 'Ram使用率',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'setRamUsage',
			title : '预设Ram使用率',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'email',
			title : '邮件',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'mark',
			title : '备注',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'date',
			title : '发送 时间',
			align : 'center',
			valign : 'middle',
			sortable : true
		}]
	});
</script>