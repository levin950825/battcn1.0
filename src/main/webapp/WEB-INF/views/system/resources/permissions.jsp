<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">

#mytable {
 width: 100%;
 padding: 0;
 margin: 0;
}

caption {
 padding: 0 0 5px 0;
 width: 100%;
 font: italic 13px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
 text-align: right;
}

th {
 font: bold 13px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
 color: #4f6b72;
 border-right: 1px solid #C1DAD7;
 border-bottom: 1px solid #C1DAD7;
 border-top: 1px solid #C1DAD7;
 letter-spacing: 2px;
 text-transform: uppercase;
 text-align: left;
 padding: 6px 6px 6px 12px;
}

th.nobg {
 border-top: 0;
 border-left: 0;
 border-right: 1px solid #C1DAD7;
 system: none;
}

#mytable td {
 border-right: 1px solid #C1DAD7;
 border-bottom: 1px solid #C1DAD7;
 system: #fff;
 font-size:11px;
 padding: 6px 6px 6px 12px;
 color: #4f6b72;
}

.fruit_bb{
border-bottom: 1px solid #C1DAD7;
}

td.alt {
 system: #F5FAFA;
 color: #797268;
}

th.spec {
 border-left: 1px solid #C1DAD7;
 border-top: 0;
 system: #fff ;
 font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}

th.specalt {
 border-left: 1px solid #C1DAD7;
 border-top: 1px solid #C1DAD7;
 system: #f5fafa ;
 font: bold 13px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
 color: #797268;
}
/*---------for IE 5.x bug*/
html>body td{ font-size:13px;}
</style>
<script type="text/javascript">
function smenu(obj,id){  
	  $("input[_key='menu_1_"+id+"']").each(function(){
	   $(this).prop("checked",obj.checked);
	  });
	  $("input[_key='menu_1_1_"+id+"']").each(function(){
		   $(this).prop("checked",obj.checked);
		  });
};
function menu_1(obj,id,pid){  
	  $("input[_key_2='menu_1_1_"+id+"']").each(function(){
		   $(this).prop("checked",obj.checked);
	});
	  if(obj.checked==true){
		  $("input[_key='menu_"+pid+"']").each(function(){
			   $(this).prop("checked",obj.checked);
		});
	  }
};
function menu_1_1(obj,id,pid){  
	if(obj.checked==true){
		  $("input[_key_1='menu_1_1_"+id+"']").each(function(){
			   $(this).prop("checked",obj.checked);
		});
		  $("input[_key='menu_"+pid+"']").each(function(){
			   $(this).prop("checked",obj.checked);
		});
	}
}
function sub(){
		battcn.ajax({
			async : false, //请勿改成异步，下面有些程序依赖此请数据
			type : "POST",
			data : $("#from").serializeArray(),
			url : rootPath + '/resources/roleRes.shtml',
			success : function(json) {
				if (json == "success") {
						layer.confirm('分配成功！是否关闭窗口？', function(index) {
				        	battcn.closeWindow();
				        	return false;
 						 });
				} else {
					layer.alert(json,{icon: 2,offset: '-100px'});
				}
				;
			}
		});
}
</script>
<form method="post" id="from" name="form">
<input id='userId' name="userId" type="hidden" value="${param.userId}">
<input id='roleId' name="roleId" type="hidden" value="${param.roleId}">
<table id="mytable" cellspacing="0" summary="The technical specifications of the Apple PowerMac G5 series">
 <tr>
    <th scope="row" abbr="L2 Cache" class="specalt">一级菜单</th>
    <th scope="row" abbr="L2 Cache" class="specalt"><span>二级菜单</span>
    <span style="float: right;margin-right: 150px;">按扭</span></th>
  </tr>
  <c:forEach items="${permissions}" var="k">
  <tr>
    <th scope="row" abbr="L2 Cache" class="specalt">
    <input type="checkbox" name="resId" id="menu" _key="menu_${k.id}" onclick="smenu(this,'${k.id}')" value="${k.id}">
    ${k.name}
    </th>
    <th scope="row" abbr="L2 Cache" class="specalt">
    <table id="mytable" cellspacing="0" summary="The technical specifications of the Apple PowerMac G5 series" style="width: 100%;height: 100%;">
    <c:forEach items="${k.children}" var="kc">
    <tr>
    <th scope="row" abbr="L2 Cache" class="specalt">
    <input type="checkbox"  name="resId" id="menu" _key="menu_1_${k.id}" _key_1="menu_1_1_${kc.id}" onclick="menu_1(this,'${kc.id}','${k.id}')"  value="${kc.id}">
    ${kc.name}
    </th>
     <th>
    <c:if test="${not empty kc.children}">
   
    <table id="mytable" cellspacing="0" summary="The technical specifications of the Apple PowerMac G5 series" style="width: 100%;height: 100%;">
    <c:forEach items="${kc.children}" var="kcc">
    <tr>
    <th scope="row" abbr="L2 Cache" class="specalt">
    <input type="checkbox"  name="resId" id="menu" _key="menu_1_1_${k.id}" _key_2="menu_1_1_${kc.id}" onclick="menu_1_1(this,'${kc.id}','${k.id}')" value="${kcc.id}">
    ${kcc.name}
    </th>
     </tr>
    </c:forEach>
   
    </table>
    
    </c:if>
    </th>
     </tr>
    </c:forEach>
   
    </table>
    </th>
  </tr>
</c:forEach>
</table>
</form>
<script type="text/javascript">
$.ajax({
	type : "POST",
	data : {
		"userId" : "${param.userId}",
		"roleId" : "${param.roleId}"
	},
	url : rootPath + '/resources/findRes.shtml',
	dataType : 'json',
	success : function(json) 
	{
		for (index in json)
		{
			$("input[name='resId']:checkbox[value='" + json[index].id + "']").prop('checked', 'true');
		}
	}
});
</script>
