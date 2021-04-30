<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


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


<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>



<div >

    

<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

                    

    

<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

                            
    
<!-- container定宽，并剧中结束 --></div>






    

<div class="title-modelbox-widget" style="margin:15px 0 0 0;box-shadow:0px 0px 2px 2px #BBBBBB">
        <h3 class="section-title">
                        菜单列表        </h3>
        <div class="sidebar-widget-body">
            

    

<div class="fengjing clearfix">
                            <div style="margin-bottom: 20px">
                

    

<form action="?" class="search">
                <table class="jd-search">
            <tbody>
                        <tr>
                <td class="label1">
                    商品名称                </td>
                <td>
                    
                    <input type="text" class="form-control" style="width: 150px" name="shangpinmingcheng" value="<%= request.getParameter("shangpinmingcheng") !=null ? request.getParameter("shangpinmingcheng") : "" %>" placeholder="请输入关键词"/>

                                                            </td>
            </tr>
                        <tr>
                <td class="label1">
                    分类                </td>
                <td>
                                            <p class="search-radio">
                        <input type="hidden" name="fenlei" value="<%= request.getParameter("fenlei") !=null ? request.getParameter("fenlei") : "" %>"/>
                        <% if( request.getParameter("fenlei") == null || "".equals( request.getParameter("fenlei") ) ){ %>
                        <a href="javascript:;" data-value="" onclick="selectRadio(this)" class="active">全部</a>
                        <% } else { %>
                        <a href="javascript:;" data-value="" onclick="selectRadio(this)">全部</a>
                        <% } %>
                                                <% 
 List<HashMap> mapshangpinfenlei3 = new CommDAO().select("SELECT id,fenlei FROM shangpinfenlei"); 
 %>                    <%  for(HashMap r:mapshangpinfenlei3){  %>
                    <% if( r.get("id").equals( request.getParameter("fenlei") ) ){ %>
                        <a href="javascript:;" data-value="<%= r.get("id") %>" onclick="selectRadio(this)" class="active"><%= r.get("fenlei") %></a>
                        <% } else { %>
                        <a href="javascript:;" data-value="<%= r.get("id") %>" onclick="selectRadio(this)"><%= r.get("fenlei") %></a>
                    <% } %>
                        <% } %>
                                            </p>
                                    </td>
            </tr>
                                    <tr>
                <td></td>
                <td><button type="submit" class="btn btn-default">
    搜索
</button></td>
            </tr>
                        </tbody>
        </table>
    </form>



            </div>
                <div class="row">
    
            <%  for(HashMap r:list){  %>
            <div class="col-md-3">
    
                <div class="card">
                    <a href="shangpindetail.jsp?id=<%= r.get("id") %>">
                        <div class="img-box pb100">
                            <div class="img card-img-top" style="background-image: url('<%= r.get("shangpintupian") %>')"></div>
                        </div>
                    </a>
                    <div class="card-body">
                        <div class="feng">
                            <div class="feng-left">
                                <a href="shangpindetail.jsp?id=<%= r.get("id") %>">
                                    <h5><%= Info.subStr(r.get("shangpinmingcheng"), 15) %></h5>
                                </a>
                            </div>
                                                            <div class="feng-right">
                                    <div class="property-price">
                                        <h3>￥<%= r.get("jiage") %></h3>
                                    </div>
                                </div>
                                                    </div>
                    </div>
                </div>
            
</div>
            <% } %>
        
</div>

    </div>




        </div>
        <!-- /.sidebar-widget-body -->
    </div>



        
    
<!-- container定宽，并剧中结束 --></div>



</div>
<%@ include file="footer.jsp" %>
<%@ include file="foot.jsp" %>