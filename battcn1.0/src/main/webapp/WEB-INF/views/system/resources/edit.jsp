<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="ibox float-e-margins">
	<div class="ibox-content">
		<form class="form-horizontal m-t required-validate" id="resourcesForm">
			<input type="hidden" name="id" value="${resources.id}"/>
			<div class="form-group">
				<label class="col-sm-3 control-label">资源名称：</label>
				<div class="col-sm-8">
					<input  type="text" class="form-control" 
						placeholder="请填写资源名称"  value="${resources.name}" id="name" name="name"  
						validate="{required:true,messages:{required:'请填写资源名称'}}">
						<span class="help-block m-b-none">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">上级菜单</label>
				<div class="col-sm-8">
					<select id="parentId" name="parentId" class="form-control m-b" tabindex="-1">
						<option value='0' selected="${resources == null ? 'selected' : null}">- - - - 顶级目录 - - - -</option>
						<c:forEach items="${list}" var="k">
							<option value="${k.id}" <c:if test="${resources.parentId == k.id}">selected="selected"</c:if>>
								<c:forEach begin="1" end="${k.nlevel == 0  ?  3 : k.nlevel * 3 + 3 }"> -</c:forEach> + ${k.name}
							</option>
						</c:forEach>
					</select>
					<span class="help-block m-b-none">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">菜单类型：</label>
				<div class="col-sm-8">
					<select id="type" name="type" class="form-control m-b" tabindex="-1" onchange="but()">
							<option value="0">------ 目录 ------</option>
							<option value="1">------ 菜单 ------</option>
							<option value="2">------ 按扭 ------</option>
					</select>
                    <span class="help-block m-b-none">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">资源地址：</label>
				<div class="col-sm-8">
					<input type="text" class="form-control"
						placeholder="请填写资源地址" name="resUrl" id="resUrl"  value="${resources.resUrl}">
						<span class="help-block m-b-none">
				</div>
			</div>
			
			<div class="form-group" id="divbut">
				<label class="col-sm-3 control-label">选择</label>
				<div class="col-sm-8">
					<div id="but" class="doc-buttons">
						
					</div>
					<font color="red">可自定义填入html代码</font>
					<span class="help-block m-b-none">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">图标</label>
				<div class="col-sm-8">
					<input type="text" class="form-control checkacc"
						placeholder="请输入icon" name="icon" id="icon" value="${resources.icon}">
						<span class="help-block m-b-none">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">资源描述</label>
				<div class="col-sm-8">
					<input type="text" class="form-control"
						placeholder="请输入资源描述" name="description" id="description"  value="${resources.description}">
						<span class="help-block m-b-none">
				</div>
			</div>
		</form>
	</div>
</div>


<script type="text/javascript">
var v = $("#type").val(CommnUtil.notNull("${resources.type}") ? "${resources.type}" : 0);

function but(){
	if(v.val()==2){
		showBut();
	}else{
		$("#divbut").css("display","none");
	}
}
$("#type").trigger("change");

function toBut(b){
	$("#description").val($("#"+b.id).html());
}

function showBut(){
	$("#divbut").css("display","block");
	var url = rootPath + '/resources/findByButtom.shtml';
	var data = CommnUtil.ajax(url, null,"json");
	if (data != null) {
		var bb = $("#but");
		bb.html('');
		for ( var i = 0; i < data.length; i++) 
		{
			bb.append("<span onclick=\"toBut(this)\" id=\"span_"+data[i].id+"\">"+ data[i].buttom+"</span> &nbsp;");
		}
	} else {
		layer.msg("获取按扭列表失败！");
	}
}









$(function(){
  	save = function(obj) {
  		if($("#resourcesForm").valid()){
  			$.ajax({
				type: "POST", 
				url: rootPath+"/resources/saveForm.shtml",
				data: $('#resourcesForm').serializeArray(),
				success: function(data){
					if(data == "success") {
						layer.confirm('保存成功!是否关闭窗口?', function(index) {
							battcn.closeWindow();
				        	return false;
 						});
					}
					battcn.toastrsAlert({
		       		     code: data.success ? 'success' :'error',
		       		     msg: data.success ? '成功' :'失败'
		       		});
				}
			});
  		}
	}
 });
</script>