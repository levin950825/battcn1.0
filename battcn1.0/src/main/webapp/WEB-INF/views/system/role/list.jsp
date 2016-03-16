<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="wrapper wrapper-content animated fadeInRight" style="height: 100%">
	<div class="ibox float-e-margins">
		<div class="ibox-content">
			<div class="doc-buttons">
				<c:forEach items="${res}" var="key">
					${key.description}
				</c:forEach>
				<button type="button" class="btn btn-outline btn-default"
					onClick="doExport('角色信息','当前角色','#roleTable', {type: 'excel'});">
					导出当前页面的Excel</button>
			</div>
			<div class="table-responsive">
				<table id="roleTable" data-toolbar="#toolbar"
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
		return $.map($("#roleTable").bootstrapTable('getSelections'), function(
				row) {
			return row.id
		});
	}
	function rolePermissions()
	{
		var cbox = getRoleIdSelections();
		if (cbox == "") {
			layer.msg("请选择角色项！！");
			return;
		}
		if (cbox.length > 1) {
			layer.msg("只能选中一个");
			return;
		}
		battcn.ajaxOpen({
			title : '分配权限',
			href : rootPath + '/resources/permissions.shtml?roleId='+cbox,
			width : '60%',
			height : '80%',
			okhandler : function() {
				sub();
			}
		});
	}

	function delRole() {
		var cbox = getRoleIdSelections();
		if (cbox == "") {
			layer.msg("请选择删除项！！");
			return;
		}
		layer.confirm('是否删除？', function(index) {
			var url = rootPath + '/role/batchDelete.shtml';
			var result = CommnUtil.ajax(url, {ids : cbox.join(",")});
			if (result == "success") {
				$('#roleTable').bootstrapTable('refresh');
				layer.msg('删除成功');
			} else {
				layer.msg('删除失败');
			}
		});
	}

	function addRole() {
		battcn.ajaxOpen({
			title : '添加角色',
			href : rootPath + '/role/editUI.shtml',
			width : '40%',
			height : '50%',
			okhandler : function() {
				save();
			}
		});
	}
	function editRole() {
		var cbox = getRoleIdSelections();
		if (cbox == "") {
			layer.msg("请选择删除项！！");
			return;
		}
		if (cbox.length > 1) {
			layer.msg("只能选一个！！");
			return;
		}
		battcn.ajaxOpen({
			title : '编辑角色',
			href : rootPath+ '/role/editUI.shtml?id=' + cbox,
			width : '40%',
			height : '50%',
			okhandler : function() {
				save();
			}
		});
	}
	
	function enabledFormatter(value)
	{
		return value == 1 ?  '启用' : '禁用';
	}

	$('#roleTable').bootstrapTable({
		url : rootPath + '/role/queryLogForList.shtml',
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
			field : 'roleName',
			title : '角色名',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'description',
			title : '描述',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'isEnabled',
			title : '是否禁用',
			align : 'center',
			valign : 'middle',
			formatter : enabledFormatter
		}, {
			field : 'date',
			title : '添加时间',
			align : 'center',
			valign : 'middle',
			sortable : true
		}]
	});
</script>