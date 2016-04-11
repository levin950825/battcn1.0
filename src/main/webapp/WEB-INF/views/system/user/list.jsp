<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="wrapper wrapper-content animated fadeInRight"
	style="height: 100%">
	<div class="ibox float-e-margins">
		<div class="ibox-content">
			<div class="doc-buttons">
				<c:forEach items="${res}" var="key">
					${key.description}
				</c:forEach>
			</div>
			<form role="form" class="form-inline" id="userSearchForm">
				<div class="input-group">
					<input type="text" placeholder="请输入账号" name="accountName" id="accountName"
						class="input form-control"> <span class="input-group-btn">
						<button type="button" class="btn btn btn-primary"
							onclick="javascript:userSearch();">
							<i class="fa fa-search"></i> 搜索
						</button>
					</span>
				</div>
			</form>
			<div class="table-responsive">
				<table id="userTable" data-toolbar="#toolbar"
					data-show-refresh="true" data-show-toggle="true"
					data-show-columns="true" data-show-export="true"
					data-show-footer="false" data-mobile-responsive="true">
				</table>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	function getUserIdSelections() {
		return $.map($("#userTable").bootstrapTable('getSelections'), function(
				row) {
			return row.id
		});
	}

	function userPermissions() {
		var cbox = getUserIdSelections();
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
			href : rootPath + '/resources/permissions.shtml?userId=' + cbox,
			width : '60%',
			height : '80%',
			okhandler : function() {
				sub();
			}
		});
	}

	function delUser() {
		var cbox = getUserIdSelections();
		if (cbox == "") {
			layer.msg("请选择删除项！！");
			return;
		}
		layer.confirm('是否删除？', function(index) {
			var url = rootPath + '/user/batchDelete.shtml';
			var result = CommnUtil.ajax(url, {
				ids : cbox.join(",")
			});
			if (result == "success") {
				$('#userTable').bootstrapTable('refresh');
				layer.msg('删除成功');
			} else {
				layer.msg('删除失败');
			}
		});
	}

	function addUser() {
		battcn.ajaxOpen({
			title : '添加用户',
			href : rootPath + '/user/editUI.shtml',
			width : '40%',
			height : '80%',
			okhandler : function() {
				save();
			}
		});
	}
	function editUser() {
		var cbox = getUserIdSelections();
		if (cbox == "") {
			layer.msg("请选择编辑项！！");
			return;
		}
		battcn.ajaxOpen({
			title : '编辑用户',
			href : rootPath + '/user/editUI.shtml?id=' + cbox,
			width : '40%',
			height : '80%',
			okhandler : function() {
				save();
			}
		});
	}
	
	//查询:目前只用一个参数,如果多个 请用 $("#A").val() !='' ||$("#B").val() !=''....
	function userSearch() {
		$('#userTable').bootstrapTable('refresh');
	}
	//重写参数传递
	function queryParams(params) {
		var accountName = $("#accountName").val();
		var pageSize = params.limit;
		var sort = params.sort;
		var offset = params.offset;
		var order = params.order;
		var pageNum = offset / pageSize + 1;
		return {
			pageSize : pageSize,
			pageNum : pageNum,
			sort : sort,
			order : order,
			accountName : accountName
		}
	}
	
	$('#userTable').bootstrapTable({
		url : rootPath + '/user/queryUserForList.shtml',
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
			field : 'userName',
			title : '名称',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'accountName',
			title : '账号',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'passWord',
			title : '密码',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'email',
			title : '邮箱',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'tel',
			title : '电话',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'locked',
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
		} ]
	});
	function enabledFormatter(value) {
		return value == 1 ? '启用' : '禁用';
	}
</script>