<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>




    

<div class="footer mt10">
                <% ArrayList<HashMap> likeList = Query.make("youqinglianjie").order("id desc").select(); %>

        <div class="copyrightnr link">
            友情链接 
            <%  for(HashMap v:likeList){  %>
            <a href="<%= v.get("wangzhi") %>" target="_blank"><%= v.get("wangzhanmingcheng") %></a>  
            <% } %>
        </div>
        
        <div class="copyrightnr">
            地址：xxxxxxxxxxxxx　　电话：0000-00000000　　手机：12312312312
            <br></br>
            版权所有：校园外卖系统 　　ICP备********号        </div>
    </div>



