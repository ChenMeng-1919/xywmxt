<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>
<link rel="stylesheet" href="js/layer/theme/default/layer.css"/>
<script src="js/layer/layer.js"></script>
<link rel="stylesheet" href="js/umeditor/themes/default/css/umeditor.css"/>
<script src="js/umeditor/umeditor.config.js"></script>
<script src="js/umeditor/umeditor.min.js"></script>

<div style="padding: 10px" class="admin-content">


    <% if( request.getSession().getAttribute("username") == null || "".equals( request.getSession().getAttribute("username") ) ){ %>
    <script>
        alert('对不起,请您先登陆!');
        location.href='login.jsp';
    </script>
    <%
        return;
    } %>









<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

    <div class="panel panel-default">
        <div class="panel-heading">
            添加商品:
        </div>
        <div class="panel-body">
            <form action="shangpin.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->
    
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">商品编号</label>
        <div class="col-sm-10">
            
                                                    <input type="text" class="form-control" placeholder="输入商品编号" style="width:150px;" readonly="readonly" id="shangpinbianhao" name="shangpinbianhao" value="<%= Info.getID() %>"/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">商品名称</label>
        <div class="col-sm-10">
            
                                                    <input type="text" class="form-control" placeholder="输入商品名称" style="width:250px;" id="shangpinmingcheng" name="shangpinmingcheng" value=""/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">商品图片</label>
        <div class="col-sm-10">
            
                                                    <div class="input-group" style="width:250px">
    <input type="text" class="form-control" id="shangpintupian" name="shangpintupian" value=""/>

    <span class="input-group-btn"><button type="button" class="btn btn-default" onclick="layer.open({type:2,title:'上传图片',fixed:true,shadeClose:true,shade:0.5,area:['320px','150px'],content:'upload.html?result=shangpintupian'})">
    上传图片
</button></span>
</div>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">分类</label>
        <div class="col-sm-10">
            
                                                    <select class="form-control class_fenlei7" data-value="" id="fenlei" name="fenlei" style="width:250px">
<% 
 List<HashMap> select = new CommDAO().select("SELECT * FROM shangpinfenlei ORDER BY id desc"); 
 %>
<%  for(HashMap m:select){  %>
<option value="<%= m.get("id") %>"><%= m.get("fenlei") %></option>
<% } %>

</select>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">库存<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                                                    <input type="number" class="form-control" placeholder="输入库存" style="width:150px;" data-rule-required="true" data-msg-required="请填写库存" number="true" data-msg-number="输入一个有效数字" id="kucun" name="kucun" value=""/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">送餐费</label>
        <div class="col-sm-10">
            
                                                    <input type="number" class="form-control" placeholder="输入送餐费" style="width:150px;" step="0.01" number="true" data-msg-number="输入一个有效数字" id="songcanfei" name="songcanfei" value=""/>                                            
        </div>
        
    </div>
</div>
                                                        <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">价格<span style="color: red;">*</span></label>
        <div class="col-sm-10">
            
                                                    <input type="number" class="form-control" placeholder="输入价格" style="width:150px;" step="0.01" data-rule-required="true" data-msg-required="请填写价格" number="true" data-msg-number="输入一个有效数字" id="jiage" name="jiage" value=""/>                                            
        </div>
        
    </div>
</div>
                                                                            <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs">内容</label>
        <div class="col-sm-10">
            
                                                    <textarea id="neirong" name="neirong" style="max-width: 750px;width:100%; height: 300px;"></textarea><script>
            (function(){
                var um = UM.getEditor('neirong');
            })();
            </script>                                            
        </div>
        
    </div>
</div>
                                                    <div class="form-group">
    <div class="row">
        <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
        <div class="col-sm-10">
            
                                        
                                                                                                                
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
