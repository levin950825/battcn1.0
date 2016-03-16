<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/common/monitor.js"></script>
<script type="text/javascript">
	function modifySer(key) {
		$.ajax({
			async : false,
			url : "${pageContext.request.contextPath}/sys/modifySer.shtml",
			data : {
				"key" : key,
				"value" : $("#" + key).val()
			},
			dataType : "json",
			success : function(data) {
				if (data.flag) {
					layer.alert("更新成功！");
				} else {
					layer.alert("更新失败！");
				}
			}
		});
	}
</script>
<div class="wrapper wrapper-content animated fadeInRight"	style="height: 100%">
	<div class="col-sm-12 col-md-12">
		<section class="panel panel-success portlet-item">
			<header class="panel-heading">
				<i class="fa fa-briefcase"></i> 警告设置
			</header>
			<table class="table table-striped table-bordered table-hover"
				width="100%" style="vertical-align: middle;">
				<thead>
					<tr style="background-color: #faebcc; text-align: center;">
						<td>名称</td>
						<td>参数</td>
						<td>预警设置</td>
						<td>邮箱设置</td>
					</tr>
				</thead>
				<tbody id="tbody" align="center">
					<tr align="center">
						<td style='text-align: left; vertical-align: middle;'>CPU</td>
						<td style='text-align: left; vertical-align: middle;'>当前使用率：<span
							id="td_cpuUsage" style="color: red;">50</span> %
						</td>
						<td align="center">
							<table>
								<tr>
									<td>使用率超出&nbsp;&nbsp;</td>
									<td><input class='inputclass' name='cpu' id='cpu'
										type='text' value='${cpu}' /> % &nbsp;</td>
									<td><a class='btn btn-info' href='javascript:void(0)'
										onclick='modifySer("cpu");'> 修改 </a></td>
								</tr>
							</table>
						</td>
						<td rowspan='3' align="center" style="vertical-align: middle;"><input
							class='inputclass' style='width: 250px; height: 32px;'
							name='toEmail' id='toEmail' type='text' value='${toEmail}' /> <a
							class='btn btn-info' href='javascript:void(0)'
							onclick='modifySer("toEmail");'> 修改 </a></td>
					</tr>
					<tr>
						<td style='text-align: left; vertical-align: middle;'>服务器内存</td>
						<td style='text-align: left; vertical-align: middle;'>当前使用率：<span
							id="td_serverUsage" style="color: blue;">50</span> % &nbsp;
						</td>
						<td align="center">
							<table>
								<tr>
									<td>使用率超出&nbsp;&nbsp;</td>
									<td><input class='inputclass' name='ram' id='ram'
										type='text' value='${ram}' /> % &nbsp;</td>
									<td><a class='btn btn-info' href='javascript:void(0)'
										onclick='modifySer("ram");'> 修改 </a></td>
								</tr>
							</table>

						</td>
					</tr>
					<tr>
						<td style='text-align: left; vertical-align: middle;'>JVM内存</td>
						<td style='text-align: left; vertical-align: middle;'>当前使用率：<span
							id="td_jvmUsage" style="color: green;">50</span> % &nbsp;
						</td>
						<td align="center">
							<table>
								<tr>
									<td>使用率超出&nbsp;&nbsp;</td>
									<td><input class='inputclass' name='jvm' id='jvm'
										type='text' value='${jvm}' /> % &nbsp;</td>
									<td><a class='btn btn-info' href='javascript:void(0)'
										onclick='modifySer("jvm");'> 修改 </a></td>
								</tr>
							</table>
					</tr>
				</tbody>
			</table>
		</section>
	</div>
	<div class="col-md-6">
		<section class="panel panel-info portlet-item">
			<header class="panel-heading">
				<i class="fa fa-th-list"></i> 服务器信息
			</header>
			<div class="panel-body" style="padding: 0px"
				data-url="/sys/info.shtml"></div>
		</section>
	</div>
	<div class="col-md-6">
		<section class="panel panel-danger portlet-item">
			<header class="panel-heading">
				<i class="fa fa-fire"></i> 实时监控
			</header>

			<div class="panel-body">
				<div id="main_two" style="height: 320px;"></div>
			</div>
		</section>
	</div>
	<!-- /.span -->
	<div class="col-md-12" style="margin-top: 10px; height: 330px">
		<section class="panel panel-primary portlet-item">
			<header class="panel-heading">
				<i class="fa fa-rss-square"></i> 实时监控
			</header>
			<div class="panel-body">
				<div id="main_one" class="col-sm-6 col-md-6" style="height: 240px;"></div>
				<div id="main_three" class="col-sm-6 col-md-6"
					style="height: 240px;"></div>
			</div>
		</section>
	</div>
</div>
