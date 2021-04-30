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
        HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "paisong");
    %>


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">
                编辑派送:
            </div>
            <div class="panel-body">
                <form action="paisong.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->

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
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">下单人</label>
                            <div class="col-sm-10">

                                <%= mmm.get("xiadanren") %><input type="hidden" id="xiadanren" name="xiadanren"
                                                                  value="<%= Info.html(mmm.get("xiadanren")) %>"/>
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
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">派送姓名</label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control" placeholder="输入派送姓名" style="width:150px;"
                                       id="paisongxingming" name="paisongxingming"
                                       value="<%= Info.html(mmm.get("paisongxingming")) %>"/>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">派送电话</label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control" placeholder="输入派送电话" style="width:150px;"
                                       phone="true" data-msg-phone="请输入正确手机号码" id="paisongdianhua" name="paisongdianhua"
                                       value="<%= Info.html(mmm.get("paisongdianhua")) %>"/>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">派送人</label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control" placeholder="输入派送人" style="width:150px;"
                                       readonly="readonly" id="paisongren" name="paisongren"
                                       value="<%= mmm.get("paisongren") %>"/>
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
