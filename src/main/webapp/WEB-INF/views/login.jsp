<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>battcn - 登录</title>
    <link href="http://static.battcn.com/back/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="http://static.battcn.com/back/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
	<link href="http://static.battcn.com/back/css/animate.min.css" rel="stylesheet">
	<link href="http://static.battcn.com/back/css/style.min.css?v=4.0.0" rel="stylesheet">
	<link href="http://static.battcn.com/back/css/login.min.css" rel="stylesheet">
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>
	<style type="text/css">
	.login-error{font-size: 12px;color:red;}
	</style>
</head>

<body class="signin">
 <div class="signinpanel">
        <div class="row">
            <div class="col-sm-7">
                <div class="signin-info">
                    <div class="logopanel m-b">
                        <h1>[ battcn ]</h1>
                    </div>
                    <div class="m-b"></div>
                    <h4>欢迎使用 <strong>battcn 后台框架</strong></h4>
                    <ul class="m-b">
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势一：调用API，一键增删改查</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势二：集成插件，不在为分页排序烦恼</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势三：平台监控，实时监控服务器</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势四：日志系统，进行数据分析</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势五：持续更新，让系统更加强大</li>
                        <li><i class="fa fa-arrow-circle-o-right m-r-xs"></i> 优势六：界面自适应，兼容各大平台</li>
                    </ul>
                    <strong>还没有账号？ <a href="javascript:void(0);">立即注册&raquo;</a></strong>
                </div>
            </div>
            <div class="col-sm-5">
                <form method="post" action="login.shtml">
                    <p class="m-t-md">登录到battcn后台</p>
                    <input type="text" class="form-control uname" name="accountName" value="admin" placeholder="用户名" />
                    <input type="password" class="form-control pword m-b" name="passWord" value="123456" placeholder="密码" />
                    <a href="install.shtml">初始化系统</a>
                    <p class="login-error">${LOGIN_ERROR_CODE}&nbsp;&nbsp;${LOGIN_ERROR_MESSAGE}</p>
                    <button class="btn btn-success btn-block">登录</button>
                </form>
            </div>
        </div>
        <div class="signup-footer">
            <div class="pull-left">
                &copy; 2015 battcn
            </div>
        </div>
    </div>
</body>

</html>