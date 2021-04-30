<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px" class="admin-content">
<%
//------------------------------------------------
String orderby = util.Request.get("order" , "id");  // 获取搜索框中的排序字段、默认为发布时间
String sort  = util.Request.get("sort" , "desc");   // 获取搜索框中的排序类型、默认为倒序

String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误



// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中



             if(request.getParameter("shangpinbianhao") != null && !"".equals( request.getParameter("shangpinbianhao") )){ where+=" AND shangpinbianhao LIKE '%"+request.getParameter("shangpinbianhao")+"%'"; } 
                 if(request.getParameter("shangpinmingcheng") != null && !"".equals( request.getParameter("shangpinmingcheng") )){ where+=" AND shangpinmingcheng LIKE '%"+request.getParameter("shangpinmingcheng")+"%'"; } 
                     if(request.getParameter("fenlei") != null && !"".equals( request.getParameter("fenlei") )){ 
where+=" AND fenlei ='"+request.getParameter("fenlei")+"'"; } 
                            
List<HashMap> list = Query.make("shangpin").where(where).order(orderby+" "+sort).page(15);

        %>






<div class="panel panel-default">
    <div class="panel-heading">
        <span class="module-name">
            商品        </span>
        <span>列表</span>
    </div>
    <div class="panel-body">
        <div class="pa10 bg-warning">
            <form class="form-inline" id="formSearch" action="?"><!-- form 标签开始 -->
    
                <div class="form-group">
    
    
                    <i class="glyphicon glyphicon-search"></i>
                
</div>
                                
                                                            <div class="form-group">
    商品编号
    
                            <input type="text" class="form-control" style="" name="shangpinbianhao" value="<%= request.getParameter("shangpinbianhao") !=null ? request.getParameter("shangpinbianhao") : "" %>"/>                        
</div>
                                                                <div class="form-group">
    商品名称
    
                            <input type="text" class="form-control" style="" name="shangpinmingcheng" value="<%= request.getParameter("shangpinmingcheng") !=null ? request.getParameter("shangpinmingcheng") : "" %>"/>                        
</div>
                                                                                    <div class="form-group">
    分类
    
                            <select class="form-control class_fenlei6" data-value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>" id="fenlei" name="fenlei">
<option value="">请选择</option><% 
 List<HashMap> select = new CommDAO().select("SELECT * FROM shangpinfenlei ORDER BY id desc"); 
 %>
<%  for(HashMap m:select){  %>
<option value="<%= m.get("id") %>"><%= m.get("fenlei") %></option>
<% } %>

</select>
<script>
$(".class_fenlei6").val($(".class_fenlei6").attr("data-value"))</script>
                        
</div>
                                                                                                                                                            <select class="form-control" name="order" id="orderby">

                    <option value="id">按发布时间</option>
                                                <option value="kucun">
                                按库存                            </option>
                                                    <option value="jiage">
                                按价格                            </option>
                                        
</select>
                <select class="form-control" name="sort" id="sort">

                    <option value="desc">倒序</option>
                    <option value="asc">升序</option>
                
</select>
                <script>$("#orderby").val("<%= orderby %>");$("#sort").val("<%= sort %>");</script>
                <button type="submit" class="btn btn-default">
    搜索
</button>

                
            
<!--form标签结束--></form>
        </div>



        
                    <div class="list-table">
                <table width="100%" border="1" class="table table-list table-bordered table-hover">
                    <thead>
                    <tr align="center">
                        <th width="60" data-field="item">序号</th>
                        <th> 商品编号  </th>
<th> 商品名称  </th>
<th> 商品图片  </th>
<th> 分类  </th>
<th> 库存  </th>
<th> 送餐费  </th>
<th> 价格  </th>
<th> 销量  </th>
<th> 添加时间  </th>
                                                                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% 
                int i= 0;
                for(HashMap map:list){
                i++;
                 %>
                    <tr id="<%= map.get("id") %>" pid="">
                        <td width="30" align="center">
                            <label>
                                                                <%= i %>
                            </label>
                        </td>
                        <td> <%= map.get("shangpinbianhao") %> </td>
<td> <%= map.get("shangpinmingcheng") %> </td>
<td> <% if( "".equals( map.get("shangpintupian") ) ){ %>-<% } else { %><img width="100" src="<%= map.get("shangpintupian") %>"/><% } %> </td>
<td> <% 
 HashMap mapshangpinfenlei2 = new CommDAO().find("SELECT fenlei FROM shangpinfenlei where id='"+map.get("fenlei")+"'"); 
 %><%= mapshangpinfenlei2.get("fenlei") %> </td>
<td> <%= map.get("kucun") %> </td>
<td> <%= map.get("songcanfei") %> </td>
<td> <%= map.get("jiage") %> </td>
<td> <%= map.get("xiaoliang") %> </td>
<td> <%= Info.subStr(map.get("addtime") , 19 , "") %> </td>
                                                                        <td align="center">

                            
                                                        
                            

                                                                <a href="shangpin_detail.jsp?id=<%= map.get("id") %>">详情</a>
                                                                <a href="shangpin_updt.jsp?id=<%= map.get("id") %>">编辑</a>
                                                                <a href="shangpin.jsp?a=delete&id=<%= map.get("id") %>" onclick="return confirm('确定要删除？')">删除</a>
                                                        <!--qiatnalijne-->
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
            
        ${page.info}
            </div>



</div>








</div>
<%@ include file="foot.jsp" %>
