<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="head.jsp" %>

<div style="padding: 10px" class="admin-content">
    <%
        //------------------------------------------------
        String orderby = util.Request.get("order", "id");  // 获取搜索框中的排序字段、默认为发布时间
        String sort = util.Request.get("sort", "desc");   // 获取搜索框中的排序类型、默认为倒序

        String where = " 1=1 ";   // 防止sql 搜索条件为： where and a=b 这样的错误


// 以下是检测搜索框中是否填写了或者选择了什么，则写入sql 语句中


        if (request.getParameter("dingdanid") != null && !"".equals(request.getParameter("dingdanid"))) {
            where += " AND dingdanid='" + request.getParameter("dingdanid") + "' ";

        }
        if (request.getParameter("dingdanbianhao") != null && !"".equals(request.getParameter("dingdanbianhao"))) {
            where += " AND dingdanbianhao LIKE '%" + request.getParameter("dingdanbianhao") + "%'";
        }

        List<HashMap> list = Query.make("paisong").where(where).order(orderby + " " + sort).page(15);

    %>


    <div class="panel panel-default">
        <div class="panel-heading">
        <span class="module-name">
            派送        </span>
            <span>列表</span>
        </div>
        <div class="panel-body">
            <div class="pa10 bg-warning">
                <form class="form-inline" id="formSearch" action="?"><!-- form 标签开始 -->

                    <div class="form-group">


                        <i class="glyphicon glyphicon-search"></i>

                    </div>

                    <div class="form-group">
                        订单编号

                        <input type="text" class="form-control" style="" name="dingdanbianhao"
                               value="<%= request.getParameter("dingdanbianhao") !=null ? request.getParameter("dingdanbianhao") : "" %>"/>
                    </div>
                    <div class="form-group">
                        姓名

                        <input type="text" class="form-control" style="" name="xingming"
                               value="<%= request.getParameter("xingming") !=null ? request.getParameter("xingming") : "" %>"/>
                    </div>
                    <div class="form-group">
                        电话

                        <input type="text" class="form-control" style="" name="dianhua"
                               value="<%= request.getParameter("dianhua") !=null ? request.getParameter("dianhua") : "" %>"/>
                    </div>
                    <select class="form-control" name="order" id="orderby">

                        <option value="id">按发布时间</option>
                        <option value="dingdanjine">
                            按订单金额
                        </option>

                    </select>
                    <select class="form-control" name="sort" id="sort">

                        <option value="desc">倒序</option>
                        <option value="asc">升序</option>

                    </select>
                    <script>$("#orderby").val("<%= orderby %>");
                    $("#sort").val("<%= sort %>");</script>
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
                        <th> 订单编号</th>
                        <th> 订单金额</th>
                        <th> 下单人</th>
                        <th> 姓名</th>
                        <th> 电话</th>
                        <th> 地址</th>
                        <th> 派送姓名</th>
                        <th> 派送电话</th>
                        <th> 派送人</th>
                        <th> 添加时间</th>
                        <th width="220" data-field="handler">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        int i = 0;
                        for (HashMap map : list) {
                            i++;
                    %>
                    <tr id="<%= map.get("id") %>" pid="">
                        <td width="30" align="center">
                            <label>
                                <%= i %>
                            </label>
                        </td>
                        <td><%= map.get("dingdanbianhao") %>
                        </td>
                        <td><%= map.get("dingdanjine") %>
                        </td>
                        <td><%= map.get("xiadanren") %>
                        </td>
                        <td><%= map.get("xingming") %>
                        </td>
                        <td><%= map.get("dianhua") %>
                        </td>
                        <td><%= map.get("dizhi") %>
                        </td>
                        <td><%= map.get("paisongxingming") %>
                        </td>
                        <td><%= map.get("paisongdianhua") %>
                        </td>
                        <td><%= map.get("paisongren") %>
                        </td>
                        <td><%= Info.subStr(map.get("addtime"), 19, "") %>
                        </td>
                        <td align="center">


                            <a href="paisong_detail.jsp?id=<%= map.get("id") %>">详情</a>


                            <% if ("管理员".equals(request.getSession().getAttribute("cx"))) { %>
                            <a href="paisong_updt.jsp?id=<%= map.get("id") %>">编辑</a>
                            <a href="paisong.jsp?a=delete&id=<%= map.get("id") %>"
                               onclick="return confirm('确定要删除？')">删除</a>
                            <% } %>


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
