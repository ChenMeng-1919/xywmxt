<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>




    

<div class="jm-header">
        <div class="top-bar animate-dropdown">
            <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

                <div class="header-top-inner">
                    <div class="cnt-account">
                        <ul class="list-unstyled">
                            <% if( request.getSession().getAttribute("username") != null && !("".equals( request.getSession().getAttribute("username") )) ){ %>
                            <li><a href="main.jsp"><i class="icon fa fa-user"></i>个人中心</a></li>
                            <li><a href="logout.jsp" onclick="return confirm('确定退出？')"><i class="icon fa fa-sign-out"></i>退出</a></li>
                            <% } else { %>
                            <li><a href="#" data-toggle="modal" data-target="#loginModel"><i class="icon fa fa-lock"></i>系统登录</a></li>
                                                        <% } %>
                        </ul>
                    </div>
                    <!-- /.cnt-account -->
                    <!-- /.cnt-cart -->
                    <div class="clearfix"></div>
                </div>
                <!-- /.header-top-inner -->
            
<!-- container定宽，并剧中结束 --></div>
            <!-- /.container -->
        </div>


        <div class="main-header">
            <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

                <div class="row" gutter="20">
    

                    <div class="col-xs-12 col-sm-12 col-md-7 logo-holder">
    
                        <!-- ============================================================= LOGO ============================================================= -->
                        <div class="logo"><a href="./"> 校园外卖系统 </a></div>
                        <!-- /.logo -->
                        <!-- ============================================================= LOGO : END ============================================================= -->
                    
</div>
                    <!-- /.logo-holder -->

                    
                    <!-- /.top-search-holder -->
                    <!-- /.top-cart-row -->
                
</div>
                <!-- /.row -->
            
<!-- container定宽，并剧中结束 --></div>
            <!-- /.container -->
        </div>

        <div class="header-nav">
            <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

                <div class="nav-list clearfix">
                    <ul class="clearfix" id="navbar-str">
                        <li>
<a href="./">首页
</a>
</li>
<li>
<a href="shangpinlist.jsp">菜单
</a>
<ul class="nav-child">
                    <% 
 List<HashMap> mapshangpinfenlei1 = new CommDAO().select("SELECT id,fenlei FROM shangpinfenlei"); 
 %>
<%  for(HashMap m:mapshangpinfenlei1){  %>
<li><a href="shangpinlist.jsp?fenlei=<%= m.get("id") %>"><%= m.get("fenlei") %></a></li>
<% } %>
</ul>
</li>
<li>
<a href="yonghuadd.jsp">用户注册
</a>
</li>
<li>
<a href="login.jsp">后台登录
</a>
</li>                    </ul>
                </div>
            
<!-- container定宽，并剧中结束 --></div>
        </div>

        <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="0" id="loginModel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="0">登录</h4>
            </div>
            <div class="modal-body">
                <div class="pa10">
                    
            <form action="login?ac=login&a=a" method="post"><!-- form 标签开始 -->
    
                <div class="form-group">
    
    
                    <input type="text" class="form-control" name="username" placeholder="输入帐号"/>
                
</div>
                <div class="form-group">
    
    
                    <input type="password" class="form-control" name="pwd" placeholder="密码"/>
                
</div>
                <div class="form-group">
    
    
                    <select class="form-control" name="cx">

                        <option value="用户">用户</option>  
  <option value="骑士">骑士</option>                    
</select>
                
</div>
                <div class="form-group">
    
    
                    <div class="input-group">
    
                        <input type="text" class="form-control" name="pagerandom" placeholder="输入验证码"/>
                        
                    
    <span class="input-group-addon"><img src="image.jsp" style="width: 60px;height: 20px;max-width: none; max-height: none;" onclick="this.src='image.jsp?rand='+new Date().getTime()"/></span>
</div>
                
</div>
                <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
        <div class="col-sm-10">
            
                    <button type="submit" class="btn btn-primary">
    登录
</button>
                
        </div>
        
    </div>
</div>
            
<!--form标签结束--></form>
        
                </div>
            </div>
        </div>
    </div>
</div>

    </div>



