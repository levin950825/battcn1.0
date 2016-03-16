<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<div class="ibox float-e-margins">
	<div class="ibox-content">
		<form class="form-horizontal m-t required-validate" id="roleForm">
			<input type="hidden" name="id" value="${role.id}"/>
			<div class="form-group">
				<label class="col-sm-3 control-label">角色名：</label>
				<div class="col-sm-8">
					<input id="roleName" name="roleName"  class="form-control" type="text" value="${role.roleName}"
						validate="{required:true,messages:{required:'请填写角色名'}}">
						<span class="help-block m-b-none">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">描述：</label>
				<div class="col-sm-8">
					<input id="description" name="description"  class="form-control" type="text" value="${role.description}">
						<span class="help-block m-b-none">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">是否启用：</label>
				<div class="col-sm-8">
					<div class="radio i-checks">
                      	<label><input type="radio" value="0" checked="checked" name="isEnabled"> <i></i> 禁用</label>
                      	<label><input type="radio" value="1" ${role.isEnabled == 1 ? 'checked="checked" ' : null} name="isEnabled"> <i></i> 启用</label>
                    </div>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
   $(document).ready(function(){$(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})});
</script>

<script type="text/javascript">

$(function(){
  	save = function(obj) {
  		if($("#roleForm").valid()){
  			$.ajax({
				type: "POST", 
				url: rootPath + "/role/saveForm.shtml",
				data: $('#roleForm').serializeArray(),
				success: function(data){
					if(data == "success") {
						layer.confirm('保存成功!是否关闭窗口?', function(index) {
							battcn.closeWindow();
							$('#roleTable').bootstrapTable('refresh');
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