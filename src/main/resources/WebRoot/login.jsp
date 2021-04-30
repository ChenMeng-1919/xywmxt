<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


<!DOCTYPE html>
<head>
    <title>校园外卖系统-后台登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- bootstrap-css -->
    <link rel="stylesheet" href="htstyle/css/bootstrap.min.css">
    <!-- //bootstrap-css -->
    <!-- Custom CSS -->
    <link href="htstyle/css/style.css" rel='stylesheet' type='text/css'/>
    <link href="htstyle/css/style-responsive.css" rel="stylesheet"/>
    <!-- font-awesome icons -->
    <link rel="stylesheet" href="htstyle/css/font.css" type="text/css"/>
    <link href="htstyle/css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons -->
    <script src="htstyle/js/jquery2.0.3.min.js"></script>
    <style>
        option{
            /*Chrome和Firefox里面的边框是不一样的，所以复写了一下*/
            border: none;
            outline: none;
            /*很关键：将默认的select选择框样式清除*/
            appearance:none;
            -moz-appearance:none;
            -webkit-appearance:none;
            /*将背景改为红色*/
            color: #000000;
            background:#fff;
            /*加padding防止文字覆盖*/
            padding-right: .14rem;
        }
    </style>
</head>
<body>
<div class="log-w3">
    <div class="w3layouts-main">
        <h2 style="font-size: 18px">校园外卖系统</h2>
        <form action="login?ac=adminlogin&a=a" method="post">
            <input type="text" class="ggg" name="username" placeholder="用户名" required="">
            <input type="password" class="ggg" name="pwd" placeholder="密码" required="">
            <div class="">
                <input type="text" class="ggg" style="display: inline-block;width: 180px" name="pagerandom" placeholder="验证码" required="">
                <img alt="刷新验证码" onClick="this.src='image.jsp?time='+new Date().getTime();"
                     src="image.jsp" style="cursor:pointer; padding-top:10px; width: 60px;height: 30px">
            </div>
            <select class="form-control" style="background: none;color: #ffffff; height: 45px; border: 1px solid #fff;" name="cx">
                <option value="管理员">管理员</option>  
  <option value="骑士">骑士</option>            </select>
            <div class="clearfix"></div>
            <input type="submit" value="登录" name="login">
        </form>
    </div>
</div>
<script src="htstyle/js/bootstrap.js"></script>
<script src="htstyle/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="htstyle/js/scripts.js"></script>
<script src="htstyle/js/jquery.slimscroll.js"></script>
<script src="htstyle/js/jquery.nicescroll.js"></script>
<script src="htstyle/js/jquery.scrollTo.js"></script>
</body>
</html>
