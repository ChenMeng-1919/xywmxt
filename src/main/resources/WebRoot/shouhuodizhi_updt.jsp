<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">


    <% if( request.getSession().getAttribute("username") == null || "".equals( request.getSession().getAttribute("username") ) ){ %>
    <script>
        alert('对不起,请您先登陆!');
        location.href='login.jsp';
    </script>
    <%
        return;
    } %>


<%
        // 获取需要编辑的数据
    String updtself="0"; // 设置更新
    HashMap mmm = new CommDAO().getmap(request.getParameter("id") , "shouhuodizhi");
    %>








<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            编辑收货地址:
        </div>
        <div class="panel-body">
            <form action="shouhuodizhi.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">姓名</label>
        <div class="col-sm-10">
            
                                                    <input type="text" class="form-control" placeholder="输入姓名" style="width:150px;" id="xingming" name="xingming" value="<%= Info.html(mmm.get("xingming")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">电话</label>
        <div class="col-sm-10">
            
                                                    <input type="text" class="form-control" placeholder="输入电话" style="width:150px;" id="dianhua" name="dianhua" value="<%= Info.html(mmm.get("dianhua")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">地址</label>
        <div class="col-sm-10">
            
                                                    <input type="text" class="form-control" placeholder="输入地址" style="width:150px;" id="dizhi" name="dizhi" value="<%= Info.html(mmm.get("dizhi")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">添加人</label>
        <div class="col-sm-10">
            
                                                    <input type="text" class="form-control" placeholder="输入添加人" style="width:150px;" readonly="readonly" id="tianjiaren" name="tianjiaren" value="<%= mmm.get("tianjiaren") %>"/>                                            
        </div>
        
    </div>
</div>
                                                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
        <div class="col-sm-10">
            
                                            <input name="id" value="<%= mmm.get("id") %>" type="hidden"/>
                        <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                        <input name="updtself" value="<%= updtself %>" type="hidden"/>
                                        
                    
                    <button type="submit" class="btn btn-primary" name="Submit">
    提交
</button>
                    <button type="reset" class="btn btn-default" name="Submit2">
    重置
</button>

                
        </div>
        
    </div>
</div>
            
<!--form标签结束--></form>
        </div>
    </div>

<!-- container定宽，并剧中结束 --></div>





<script>
    $(function () {
        $('#form1').validate();
    });
</script>



</div>
<%@ include file="foot.jsp" %>
