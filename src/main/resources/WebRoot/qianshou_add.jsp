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



    
    <% if( null == request.getParameter("id") || "".equals( request.getParameter("id") ) ){ %>        <script>
            alert('非法操作');
            history.go(-1);
        </script>
    <% out.close(); %>
    <% } %>        <% HashMap readMap = Query.make("dingdan").where("id", request.getParameter("id")).find(); %>





<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            添加签收:
        </div>
        <div class="panel-body">
            <form action="qianshou.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                    <input type="hidden" name="dingdanid" value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>"/>                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">订单编号</label>
        <div class="col-sm-10">
            
                                                    <%= readMap.get("dingdanbianhao") %><input type="hidden" id="dingdanbianhao" name="dingdanbianhao" value="<%= Info.html(readMap.get("dingdanbianhao")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">订单金额</label>
        <div class="col-sm-10">
            
                                                    <%= readMap.get("dingdanjine") %><input type="hidden" id="dingdanjine" name="dingdanjine" value="<%= Info.html(readMap.get("dingdanjine")) %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">收货地址</label>
        <div class="col-sm-10">
            
                                                    <input type="hidden" name="shouhuodizhi" id="shouhuodizhi" value="<%= readMap.get("shouhuodizhi") %>"/><table class="table">

            <tr>

            <td colspan="2">
收货地址：
</td>


</tr><tr>
<td style="width: 130px">
姓名
</td><td>
<%= readMap.get("xingming") %><input type="hidden" id="xingming" name="xingming" value="<%= Info.html(readMap.get("xingming")) %>"/>
</td>

</tr><tr>
<td style="width: 130px">
电话
</td><td>
<%= readMap.get("dianhua") %><input type="hidden" id="dianhua" name="dianhua" value="<%= Info.html(readMap.get("dianhua")) %>"/>
</td>

</tr><tr>
<td style="width: 130px">
地址
</td><td>
<%= readMap.get("dizhi") %><input type="hidden" id="dizhi" name="dizhi" value="<%= Info.html(readMap.get("dizhi")) %>"/>
</td>

</tr>
</table>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">备注</label>
        <div class="col-sm-10">
            
                                                    <textarea style="width: 80%;height: 120px" class="form-control" placeholder="输入备注" id="beizhu" name="beizhu"></textarea>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">签收人</label>
        <div class="col-sm-10">
            
                                                    <input type="text" class="form-control" placeholder="输入签收人" style="width:150px;" readonly="readonly" id="qianshouren" name="qianshouren" value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>                                            
        </div>
        
    </div>
</div>
                                                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
        <div class="col-sm-10">
            
                                                                <input name="referer" value="<%=request.getHeader("referer")%>" type="hidden"/>
                    
                                                                                                                
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
