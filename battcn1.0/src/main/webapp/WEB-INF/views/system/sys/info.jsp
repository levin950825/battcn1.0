<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table class="table table-striped table-bordered table-hover" style="margin: 0px;">
	<tbody>
		<tr>
			<td class="left">ip地址</td>
			<td id="hostIp" class="left">${info.hostIp}</td>
		</tr>
		<tr>
			<td class="left">主机名</td>

			<td class="left" id="hostName">${info.hostName}</td>
		</tr>
		<tr>
			<td class="left">操作系统的名称</td>

			<td class="left" id="osName">${info.osName}</td>
		</tr>
		<tr>
			<td class="left">操作系统的构架</td>

			<td class="left" id="arch">${info.arch}</td>
		</tr>
		<tr>
			<td class="left">操作系统的版本</td>

			<td class="left" id="osVersion">${info.osVersion}</td>
		</tr>
		<tr>
			<td class="left">处理器个数</td>

			<td class="left" id="processors">${info.processors}</td>
		</tr>
		<tr>
			<td class="left">Java的运行环境版本</td>

			<td class="left" id="javaVersion">${info.javaVersion}</td>
		</tr>
		<tr>
			<td class="left">Java供应商的URL</td>

			<td class="left" id="javaUrl">${info.javaUrl}</td>
		</tr>
		<tr>
			<td class="left">Java的安装路径</td>

			<td class="left" id="javaHome">${info.javaHome}</td>
		</tr>
		<tr>
			<td class="left">临时文件路径</td>

			<td class="left" id="tmpdir">${info.tmpdir}</td>
		</tr>
	</tbody>
</table>