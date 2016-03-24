 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
</head>
<body class="fixed-sidebar full-height-layout gray-bg pace-done skin-1">
	<div id="wrapper">
		<!--左侧导航开始-->
		<nav class="navbar-default navbar-static-side" role="navigation"
			style="height: 100%; position: fixed !important;">
			<div class="nav-close">
				<i class="fa fa-times-circle"></i>
			</div>
			<div class="sidebar-collapse">
				<ul class="nav" id="side-menu">
					<li class="nav-header">
						<div class="dropdown profile-element">
							<span><img alt="image" class="img-circle"
								src="${ctx}/${USER_SESSION_KEY.photo}" width="64px" height="64px"/></span> <a
								data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
								class="clear"> <span class="block m-t-xs"><strong
										class="font-bold">${USER_SESSION_KEY.userName}</strong></span> <span
									class="text-muted text-xs block">超级管理员<b class="caret"></b></span>
							</span>
							</a>
							<ul class="dropdown-menu animated fadeInRight m-t-xs">
								<li><a class="J_menuItem" href="${ctx}/user/profile.shtml">修改头像</a>
								</li>
								<li><a class="J_menuItem">个人资料</a></li>
								<li><a class="J_menuItem">联系我们</a></li>
								<li class="divider"></li>
								<li><a href="${ctx}/logout.shtml">安全退出</a></li>
							</ul>
						</div>
						<div class="logo-element">battcn</div>
					</li>
					<c:forEach items="${list}" var="rs">
						<li><a href="#"> <i class="${rs.icon}"></i> <span
								class="nav-label">${rs.name}</span> <span class="fa arrow"></span>
						</a>
							<ul class="nav nav-second-level">
								<c:forEach items="${rs.children}" var="ch">
									<li><a title="${ch.description}" class="J_menuItem"
										href="${ctx}${ch.resUrl}?id=${ch.id}">${ch.name}</a></li>
								</c:forEach>
							</ul></li>
					</c:forEach>
					<!-- 该功能可选：方便管理登陆用户而已 -->
					<li><a title="Session管理" class="J_menuItem"
										href="${ctx}/session/list.shtml"><i class="fa fa-database"></i>Session管理</a></li>
				</ul>
			</div>
		</nav>
		<!--左侧导航结束-->
		<!--右侧部分开始-->
		<div id="page-wrapper" class="gray-bg dashbard-1" style="min-height: 643px;">
			<div class="row content-tabs">
				<button class="roll-nav roll-left J_tabLeft">
					<i class="fa fa-backward"></i>
				</button>
				<nav class="page-tabs J_menuTabs">
					<div class="page-tabs-content">
						<a href="javascript:void(0);" class="J_menuTab active main"
							id="main" data-id="main.shtml">首页</a>
					</div>
				</nav>
				<button class="roll-nav roll-right J_tabRight">
					<i class="fa fa-forward"></i>
				</button>
				<div class="btn-group roll-nav roll-right">
					<button class="dropdown J_tabClose" data-toggle="dropdown">
						关闭操作<span class="caret"></span>
					</button>
					<ul role="menu" class="dropdown-menu dropdown-menu-right">
						<li class="J_tabShowActive"><a class="navbar-minimalize "
							href="#">  关闭左侧菜单</a>
						</li>
						
						<li class="divider"></li>
						<li class="J_tabCloseAll"><a>关闭全部选项卡</a></li>
						<li class="J_tabCloseOther"><a>关闭其他选项卡</a></li>
					</ul>
				</div>
				<a href="${ctx}/logout.shtml" class="roll-nav roll-right J_tabExit"><i
					class="fa fa fa-sign-out"></i> 退出</a>
			</div>

			<div class="row J_mainContent bbg" id="content-main">
				<div class="J_box smartmenu index" width="100%" name="iframe0"
					data-id="main.shtml" height="100%" src="${ctx}/main.shtml"></div>
			</div>
			<div class="footer">
				<div class="my-pull-right">
					&copy; 2014-2015 <a href="javascript:void(0);">Bleak.Tang</a>
				</div>
			</div>
		</div>
		<!--右侧部分结束-->
	</div>
</body>

</html>