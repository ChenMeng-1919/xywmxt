<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<!DOCTYPE html>
<head>
    <title>校园外卖系统 后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content=""/>
    <script type="application/x-javascript"> addEventListener("load", function () {
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
    <!-- font CSS -->
    <!-- font-awesome icons -->
    <link rel="stylesheet" href="htstyle/css/font.css" type="text/css"/>
    <link href="htstyle/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="htstyle/css/morris.css" type="text/css"/>
    <!-- calendar -->
    <link rel="stylesheet" href="htstyle/css/monthly.css">
    <!-- //calendar -->
    <!-- //font-awesome icons -->
    <script src="htstyle/js/jquery2.0.3.min.js"></script>
    <script src="htstyle/js/raphael-min.js"></script>
    <script src="htstyle/js/morris.js"></script>
    <script>
        setInterval(function () {
            $.post("./", "", function () {

            });
        }, 60 * 1000);
    </script>

</head>
<body>
<section id="container">
    <!--header start-->
    <header class="header fixed-top clearfix">
        <!--logo start-->
        <div class="brand">
            <a href="./" class="logo">
                校园外卖系统
            </a>
            <div class="sidebar-toggle-box">
                <div class="fa fa-bars"></div>
            </div>
        </div>
        <!--logo end-->
        <div class="nav notify-row" id="top_menu">
            <!--  notification start -->
            <ul class="nav top-menu">
                <!-- settings start -->
                <li>
                    <a href="./" style="border-radius: 5px" target="_blank">
                        <i class="fa fa-home"></i>
                        网站首页
                    </a>
                </li>
                <li>
                    <a href="logout.jsp" onclick="return confirm('确认退出？此操作将不可恢复')" style="border-radius: 5px">
                        <i class="fa fa-bars"></i>
                        注销
                    </a>
                </li>


                <!-- 以下代码可以做紧急预告 -->
                <!--<li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="fa fa-tasks"></i>
                        <span class="badge bg-success">0</span>
                    </a>
                    <ul class="dropdown-menu extended tasks-bar">
                        <li>
                            <p class="">事件通知</p>
                        </li>
                        <li>
                            <a href="#">
                                <div class="task-info clearfix">
                                    <div class="desc pull-left">
                                        <h5>Target Sell</h5>
                                        <p>25% , Deadline 12 June’13</p>
                                    </div>
                                    <span class="notification-pie-chart pull-right" data-percent="45">
                            <span class="percent"></span>
                            </span>
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>-->
            </ul>
            <!--  notification end -->
        </div>
        <div class="top-nav clearfix">
            <!--search & user info start-->
            <ul class="nav pull-right top-menu">
                <!--<li>
                    <input type="text" class="form-control search" placeholder=" Search">
                </li>-->
                <li style="padding-top: 6px">
               
                </li>
                <li style="padding-top: 6px">
                    权限：<%= request.getSession().getAttribute("cx") != null ? request.getSession().getAttribute("cx") : "" %>
                </li>

                <!-- user login dropdown start-->
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <img alt="" src="htstyle/images/2.png">
                        <span class="username"><%= request.getSession().getAttribute("username") != null ? request.getSession().getAttribute("username") : "" %></span>
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu extended logout">
                        <li><a href="./"><i class=" fa fa-home"></i>网站主页</a></li>
                        <li><a href="logout.jsp"><i class="fa fa-key"></i>退出</a></li>
                    </ul>
                </li>
                <!-- user login dropdown end -->

            </ul>
            <!--search & user info end-->
        </div>
    </header>
    <!--header end-->
    <!--sidebar start-->
    <aside>
        <div id="sidebar" class="nav-collapse">
            <!-- sidebar menu start-->
            <div class="leftside-navigation">
                <ul class="sidebar-menu" id="nav-accordion">

                    <% if ("管理员".equals(request.getSession().getAttribute("cx"))) { %>
                    <%@ include file="left_guanliyuan.jsp" %>
                    <% } %>
                    <% if ("用户".equals(request.getSession().getAttribute("cx"))) { %>
                    <%@ include file="left_yonghu.jsp" %>
                    <% } %>
                    <% if ("骑士".equals(request.getSession().getAttribute("cx"))) { %>
                    <%@ include file="left_qishi.jsp" %>
                    <% } %>

                </ul>
            </div>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->
    <!--main content start-->
    <section id="main-content">
        <iframe src="sy.jsp" scrolling="1" name="main" frameborder="0"></iframe>
        <!-- / footer -->
    </section>
    <!--main content end-->
</section>
<script src="htstyle/js/bootstrap.js"></script>
<script src="htstyle/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="htstyle/js/scripts.js"></script>
<script src="htstyle/js/jquery.slimscroll.js"></script>
<script src="htstyle/js/jquery.nicescroll.js"></script>
<script src="htstyle/js/jquery.scrollTo.js"></script>
<!-- morris JavaScript -->
<script>
    $(document).ready(function () {
        //BOX BUTTON SHOW AND CLOSE
        jQuery('.small-graph-box').hover(function () {
            jQuery(this).find('.box-button').fadeIn('fast');
        }, function () {
            jQuery(this).find('.box-button').fadeOut('fast');
        });
        jQuery('.small-graph-box .box-close').click(function () {
            jQuery(this).closest('.small-graph-box').fadeOut(200);
            return false;
        });

        //CHARTS
        function gd(year, day, month) {
            return new Date(year, month - 1, day).getTime();
        }
    });
</script>
<!-- calendar -->
<script type="text/javascript" src="htstyle/js/monthly.js"></script>
<script src="htstyle/js/clock.js"></script>
<script type="text/javascript">
    $(window).load(function () {

        $('#mycalendar').monthly({
            mode: 'event',

        });

        $('#mycalendar2').monthly({
            mode: 'picker',
            target: '#mytarget',
            setWidth: '250px',
            startHidden: true,
            showTrigger: '#mytarget',
            stylePast: true,
            disablePast: true
        });

        switch (window.location.protocol) {
            case 'http:':
            case 'https:':
                // running on a server, should be good.
                break;
            case 'file:':
                alert('Just a heads-up, events will not work when run locally.');
        }
        showcal('clockTime');
    });
</script>
<!-- //calendar -->
</body>
</html>
