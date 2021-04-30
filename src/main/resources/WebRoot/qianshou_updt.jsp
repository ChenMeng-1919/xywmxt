<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>

<div style="padding: 10px" class="admin-content">


    <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>
    <script>
        alert('对不起,请您先登陆!');
        location.href = 'login.jsp';
    </script>
    <%
            return;
        } %>


    <%
        // 获取需要编辑的数据
        String updtself = "0"; // 设置更新
        HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "qianshou");
    %>


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">
                编辑签收:
            </div>
            <div class="panel-body">
                <form action="qianshou.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->

                    <input type="hidden" name="dingdanid" value="<%= mmm.get("dingdanid") %>"/>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">订单编号</label>
                            <div class="col-sm-10">

                                <%= mmm.get("dingdanbianhao") %><input type="hidden" id="dingdanbianhao"
                                                                       name="dingdanbianhao"
                                                                       value="<%= Info.html(mmm.get("dingdanbianhao")) %>"/>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">订单金额</label>
                            <div class="col-sm-10">

                                <%= mmm.get("dingdanjine") %><input type="hidden" id="dingdanjine" name="dingdanjine"
                                                                    value="<%= Info.html(mmm.get("dingdanjine")) %>"/>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">收货地址</label>
                            <div class="col-sm-10">

                                <input type="hidden" name="shouhuodizhi" id="shouhuodizhi"
                                       value="<%= mmm.get("shouhuodizhi") %>"/>
                                <table class="table">

                                    <tr>

                                        <td colspan="2">
                                            收货地址：
                                        </td>


                                    </tr>
                                    <tr>
                                        <td style="width: 130px">
                                            姓名
                                        </td>
                                        <td>
                                            <%= mmm.get("xingming") %><input type="hidden" id="xingming" name="xingming"
                                                                             value="<%= Info.html(mmm.get("xingming")) %>"/>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td style="width: 130px">
                                            电话
                                        </td>
                                        <td>
                                            <%= mmm.get("dianhua") %><input type="hidden" id="dianhua" name="dianhua"
                                                                            value="<%= Info.html(mmm.get("dianhua")) %>"/>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td style="width: 130px">
                                            地址
                                        </td>
                                        <td>
                                            <%= mmm.get("dizhi") %><input type="hidden" id="dizhi" name="dizhi"
                                                                          value="<%= Info.html(mmm.get("dizhi")) %>"/>
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

                                <textarea style="width: 80%;height: 120px" class="form-control" placeholder="输入备注"
                                          id="beizhu" name="beizhu"><%= Info.html(mmm.get("beizhu")) %></textarea>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">签收人</label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control" placeholder="输入签收人" style="width:150px;"
                                       readonly="readonly" id="qianshouren" name="qianshouren"
                                       value="<%= mmm.get("qianshouren") %>"/>
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
