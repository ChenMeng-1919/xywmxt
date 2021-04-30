<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%@ include file="head.jsp" %>

<div style="padding: 10px" class="admin-content">

<% HashMap map = Query.make("shangpin").where("id", request.getParameter("id")).find(); %><div class="admin-detail">
    <table class="table table-detail">
        <tr>

                                    <td width="180">
                商品编号            </td>
            <td><%= map.get("shangpinbianhao") %></td>
            
                                    <td width="180">
                商品名称            </td>
            <td><%= map.get("shangpinmingcheng") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                商品图片            </td>
            <td><img src="<%= map.get("shangpintupian") %>" style="width: 350px"/></td>
            
                                    <td width="180">
                分类            </td>
            <td><% 
 HashMap mapshangpinfenlei5 = new CommDAO().find("SELECT fenlei FROM shangpinfenlei where id='"+map.get("fenlei")+"'"); 
 %><%= mapshangpinfenlei5.get("fenlei") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                库存            </td>
            <td><%= map.get("kucun") %></td>
            
                                    <td width="180">
                送餐费            </td>
            <td><%= map.get("songcanfei") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                价格            </td>
            <td><%= map.get("jiage") %></td>
            
                                    <td width="180">
                销量            </td>
            <td><%= map.get("xiaoliang") %></td>
                    </tr>
        <tr>
            
                                    <td width="180">
                内容            </td>
            <td><%= map.get("neirong") %></td>
            
                                    <td width="180">
                添加时间            </td>
            <td><%= map.get("addtime") %></td>
                    </tr>
        <tr>
            
                    </tr>
    </table>
</div>


<div class="button-list">
    <div class="">
        <button onclick="history.go(-1);"
                style="background: #07de19; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">返回
        </button>
        <button onclick="window.print()"
                style="background: #4961de; border: 1px solid #9a9a9a;border-top-width: 2px;border-left: 2px; ">打印本页
        </button>
    </div>
</div>
</div>
<%@ include file="foot.jsp" %>
