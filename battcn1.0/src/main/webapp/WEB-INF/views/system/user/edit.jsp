<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="ibox float-e-margins">
	<div class="ibox-content">
		<form class="form-horizontal m-t required-validate" id="userForm">
			<input type="hidden" name="id" value="${user.id}"/>
			<div class="form-group">
				<label class="col-sm-3 control-label">名称：</label>
				<div class="col-sm-8">
					<input id="userName" name="userName"  class="form-control" type="text" value="${user.userName}"
						validate="{required:true,messages:{required:'请填写名称'}}">
						<span class="help-block m-b-none">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">账号：</label>
				<div class="col-sm-8">
					<input id="accountName" name="accountName"  class="form-control" type="text" value="${user.accountName}"
						validate="{required:true,messages:{required:'请填写帐号'}}">
						<span class="help-block m-b-none">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">密码：</label>
				<div class="col-sm-8">
					<input id="passWord" name="passWord"  class="form-control" type="text" value="${user.passWord}"
						<c:if test="${user.passWord != null and user.passWord != ''}">disabled="disabled"</c:if>
						validate="{required:true,messages:{required:'请填写密码'}}">
						<span class="help-block m-b-none">
				</div>
			</div>
			<div id="selGroup"
				data-url="/role/selRole.shtml?userId=${user.id}"></div>
				
			<div class="form-group">
				<label class="col-sm-3 control-label">邮箱：</label>
				<div class="col-sm-8">
					<input id="email" name="email"  class="form-control" type="email" value="${user.email}"
						validate="{required:true,email:true,messages:{required:'请填写邮箱',email:'请输入正确格式的电子邮箱'}}">
						<span class="help-block m-b-none">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">联系电话：</label>
				<div class="col-sm-8">
					<input id="tel" name="tel"  class="form-control" type="tel" value="${user.tel}"
						validate="{required:true,messages:{required:'请填写手机号码'}}">
						<span class="help-block m-b-none">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">是否启用：</label>
				<div class="col-sm-8">
					<div class="radio i-checks">
                      	<label><input type="radio" value="0" checked="checked" name="locked"> <i></i> 禁用</label>
                      	<label><input type="radio" value="1" ${user.locked == 1 ? 'checked="checked" ' : null} name="locked"> <i></i> 启用</label>
                    </div>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
   $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
   onloadurl();
</script>

<script type="text/javascript">

$(function(){
  	save = function() {
  		if($("#userForm").valid()){
  			$.ajax({
				type: "POST", 
				url: rootPath+"/user/saveForm.shtml",
				data: $('#userForm').serializeArray(),
				success: function(data){
					if(data == "success") {
						layer.confirm('保存成功!是否关闭窗口?', function(index) {
							battcn.closeWindow();
							$('#userTable').bootstrapTable('refresh');
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