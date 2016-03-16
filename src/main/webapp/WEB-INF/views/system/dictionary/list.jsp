<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id='tree'>
1111111
</div>

<script>
function getTree(){
	var _array = [];
	$.ajax({
		url:'/dictionary/select.shtml',
		async:false,
		success:function(_data){
			getSons(0,_array,_data)
		}
	})
	
	return _array;
}
function getSons(_pid,_array,_data){
	$.each(_data,function(_index,_row){
		if(!_row){
			return;
		}
		if(_row.parentId==_pid){
			_array.push(_row)
			_data.splice(_index,1);
			_row.nodes = [];
			getSons(_row.id,_row.nodes,_data);
		}
	})
}
$(function(){
	$('#tree').treeview({data: getTree()});
})

</script>