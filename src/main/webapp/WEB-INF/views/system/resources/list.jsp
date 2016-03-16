<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.table-bordered>thead>tr>td, .table-bordered>thead>tr>th{background-color: #FFF;}
</style>
<div class="wrapper wrapper-content animated fadeInRight"
	style="height: 100%">
	<div class="ibox float-e-margins">
		<div class="ibox-content">
			<button class="btn btn-info" type="button" onclick="addResources()"><i class="fa fa-edit"></i> 新增</button>
			<button class="btn btn-success" type="button" onclick="editResources()"><i class="fa fa-paste"></i> 编辑</button>
			<button class="btn btn btn-danger" type="button" onclick="delResources()"><i class="fa fa-remove"></i> 删除</button>
            <div class="table-responsive" style="margin-top: 20px;">
            	<form role="form" class="form-inline" action="${ctx}/resources/list.shtml">
	                <table class="table table table-striped table-bordered table-hover" id="resourcesTable">
	                     <thead>
	                         <tr>
	                          	 <th><input type="checkbox"  onclick="$('.ii-checks').prop('checked',($(this).prop('checked') ? true : false ))" name="input[]"></th>
	                             <th>菜单名称</th>
	                             <th>菜单类型</th>
	                             <th>请求地址</th>
	                             <th>图标</th>
	                             <th>时间</th>
	                         </tr>
	                     </thead>
	                     <tbody>
	                     	<c:forEach items="${pageInfo.list}" var="tree">
		                         <tr class="treegrid-${tree.id} <c:if test="${tree.parentId != 0}">treegrid-parent-${tree.parentId}</c:if>">
		                             <td>
		                                 <input type="checkbox" class="ii-checks" name="check" value="${tree.id}">
		                             </td>
		                             <td>${tree.name}</td>
		                             <td>
		                             	<c:if test="${tree.type eq 0 }">父级菜单</c:if>
		                             	<c:if test="${tree.type eq 1 }">子级菜单</c:if>
		                             	<c:if test="${tree.type eq 2 }">菜单按钮</c:if>
		                             </td>
		                             <td>${tree.resUrl}</td>
		                             <td><i class="${tree.icon}"></i></td>
		                             <td>${tree.date}</td>
		                         </tr>
	                         </c:forEach>
	                     </tbody>
	                 </table>
	                 	<div class="fixed-table-pagination" style="display: block;margin-top: -50px;"  >
	                 		<div class="pull-left pagination-detail"><span class="pagination-info">显示第 ${pageInfo.pageNum}  到第 ${pageInfo.pageNum * pageInfo.pageSize } 条记录，总共${pageInfo.total}条记录</span>
		                 		<span class="page-list">每页显示<span class="btn-group dropup">
		                 		<button type="button" class="btn btn-default  dropdown-toggle" data-toggle="dropdown">
		                 			<span class="page-size">${pageInfo.pageSize}</span> <span class="caret"></span>
		                 		</button>
	                 			<ul class="dropdown-menu" role="menu" id="resources_meny">
	                 				<li><a href="javascript:void(0)">10</a></li>
	                 				<li><a href="javascript:void(0)">30</a></li>
	                 				<li><a href="javascript:void(0)">50</a></li>
	                 			</ul></span> 条记录</span>
	                 		</div>
			                <div class="pull-right pagination ${pageInfo.pageSize >= pageInfo.total ? 'hidden' : null}" >
				                 <ul class="pagination">
				                 	<li class="page-first ${pageInfo.pageNum == pageInfo.firstPage ? 'disabled' : null}" onclick="loadResources(1)"><a href="javascript:void(0)">«</a></li>
				                 	<li class="page-pre ${pageInfo.pageNum == pageInfo.firstPage ? 'disabled' : null}" onclick="loadResources(${pageInfo.pageNum-1})"><a href="javascript:void(0)">‹</a></li>
				                 	<c:forEach begin="1" end="${pageInfo.pages}" varStatus="k">
				                 		<li class="page-number ${pageInfo.pageNum == k.index ? 'active' : null}" onclick="loadResources(${k.index})" ><a href="javascript:void(0)">${k.index}</a></li>
				                 	</c:forEach>
				                 	<li class="page-next ${pageInfo.pageNum == pageInfo.lastPage ? 'disabled' : null}" onclick="loadResources(${pageInfo.pageNum+1})"><a href="javascript:void(0)">›</a></li>
				                 	<li class="page-last ${pageInfo.pageNum == pageInfo.lastPage ? 'disabled' : null}" onclick="loadResources(${pageInfo.lastPage})"><a href="javascript:void(0)">»</a></li>
				                 </ul>
				            </div>
		            	</div>
	            	</form>
             </div>
		</div>
	</div>
</div>

<script type="text/javascript">

	function getResourcesIdSelections()
	{
		var index = 0;
		var ids = new Array();
		$("input[name='check']").each(function(){
		    if(true == $(this).is(':checked'))
		    {
		    	ids[index] = $(this).val();
		    	index ++;
		    }
		});
		return ids;
	}
	$('#resourcesTable').treegrid({
	  	expanderExpandedClass: 'glyphicon glyphicon-minus',
			expanderCollapsedClass: 'glyphicon glyphicon-plus'
	});
	$("#resources_meny>li").click(function(){
		$(".J_mainContent div.J_box:visible").loadUrl(rootPath+"/resources/list.shtml?pageSize="+$(this).text());
	});
	function loadResources(pageNum)
	{
		$(".J_mainContent div.J_box:visible").loadUrl(rootPath+"/resources/list.shtml?pageNum="+pageNum);
	}
	
	function delResources() {
		var cbox = getResourcesIdSelections();
		if (cbox == "") {
			layer.msg("请选择删除项！！");
			return;
		}
		layer.confirm('是否删除？', function(index) {
			var url = rootPath + '/resources/batchDelete.shtml';
			var result = CommnUtil.ajax(url, {ids : cbox.join(",")});
			if (result == "success") {
				layer.msg('删除成功');
				$(".J_mainContent div.J_box:visible").loadUrl(rootPath+"/resources/list.shtml");
			} else {
				layer.msg('删除失败');
			}
		});
	}

	function addResources() {
		battcn.ajaxOpen({
			title :'添加菜单',
			href : rootPath + '/resources/editUI.shtml',
			width : '40%',
			height : '70%',
			okhandler : function() {
				save();
			}
		});
	}
	
	function editResources() {
		var cbox = getResourcesIdSelections();
		if (cbox == "") {
			layer.msg("请选择编辑项！！");
			return;
		}
		if (cbox.length > 1) {
			layer.msg("只能选中一个");
			return;
		}
		battcn.ajaxOpen({
			title : '编辑菜单',
			href : rootPath+ '/resources/editUI.shtml?id=' + cbox,
			width : '40%',
			height : '70%',
			okhandler : function() {
				save();
			}
		});
	}
	
</script>