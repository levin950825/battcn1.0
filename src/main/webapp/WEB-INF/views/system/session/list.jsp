<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="wrapper wrapper-content animated fadeInRight"
	style="height: 100%">
	<div class="ibox float-e-margins">
		<div class="ibox-content">
			<div class="table-responsive">
				<table id="sessionTable" data-toolbar="#toolbar"
					data-show-refresh="true" data-show-toggle="true"
					data-show-columns="true" data-show-export="true"
					data-show-footer="false" data-mobile-responsive="true">
				</table>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

	$('#sessionTable').bootstrapTable({
		url : rootPath + '/session/querySessionForList.shtml',
		height : '100%',
		showColumns : true,
		striped : true,
		pagination : true,
		pageNumber : 1,
		pageSize : 10,
		pageList : "[10,20,30,All]",
		search : true,
		sidePagination : 'client',//服务端分页  client //客户端分页
		idField : 'id',
		uniqueId : 'id',
		minimumCountColumns : 2,
		columns : [ {
			checkbox : true
		}, {
			field : 'accountName',
			title : '登陆账号',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'userName',
			title : '名称',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'host',
			title : '主机地址',
			align : 'center',
			valign : 'middle'
		}, {
			field : 'startTimestamp',
			title : '开始访问时间',
			align : 'center',
			valign : 'middle',
			formatter:function(value,row,index){return new Date(value).pattern("yyyy-MM-dd HH:mm:ss");  }
		}, {
			field : 'lastAccessTime',
			title : '最后访问时间',
			align : 'center',
			valign : 'middle'
			/* formatter:function(value,row,index){return new Date(value).pattern("yyyy-MM-dd HH:mm:ss");  }*/ 
		},
        {
            title: '操作',
            align: 'center',
            formatter: function(){
            	return '<a class = "remove" href="javascript:void(0)">删除</a>';
            },
            events: 'operateEvents'
        }]
	});
	
	window.operateEvents = {
	    'click .remove': function (e, value, row, index) {
	        $.ajax({
	            type: "post",
	            data: row,
	            url: rootPath+'/session/forceLogout.shtml?sessionId='+row.id,
	            success: function (data) {
	            	$('#sessionTable').bootstrapTable('removeByUniqueId', row.id);
	                layer.alert('强制剔除');
	            }
	        });
	    }
	};
	
</script>