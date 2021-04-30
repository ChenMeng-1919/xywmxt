<%@ page language="java" import="dao.*" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.*" %>
<%@page import="util.*" %>


<%@ include file="head.jsp" %>
<script src="js/jquery.validate.js"></script>
<script>
    window.searchSelectUrl = "ajax.jsp?a=selectUpdate";
    window.selectUpdateUrl = "ajax.jsp?a=table";
</script>
<script src="js/selectUpdate.js"></script>

<div style="padding: 10px" class="admin-content">


    <% if (request.getSession().getAttribute("username") == null || "".equals(request.getSession().getAttribute("username"))) { %>
    <script>
        alert('对不起,请您先登陆!');
        location.href = 'login.jsp';
    </script>
    <%
            return;
        } %>


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">
                添加订单:
            </div>
            <div class="panel-body">
                <form action="dingdan.jsp?a=insert" method="post" name="form1" id="form1"><!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">订单编号</label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control" placeholder="输入订单编号" style="width:150px;"
                                       readonly="readonly" id="dingdanbianhao" name="dingdanbianhao"
                                       value="<%= Info.getID() %>"/>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">订单信息</label>
                            <div class="col-sm-10">

                                <%
                                    List<HashMap> dataListdingdanxinxi = new CommDAO().select("SELECT * FROM diancan WHERE goumairen='" + request.getSession().getAttribute("username") + "' ORDER BY id desc");
                                %>
                                <div id="dataListdingdanxinxi" style="text-align: left;">
                                    <table class="table">
                                        <thead>
                                        <tr>
                                            <td>商品编号</td>
                                            <td>商品名称</td>
                                            <td>商品图片</td>
                                            <td>分类</td>
                                            <td>价格</td>
                                            <td>购买数量</td>
                                            <td>送餐费</td>
                                            <td>小计</td>
                                            <td>购买人</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr><% for (HashMap dataMap : dataListdingdanxinxi) { %>
                                            <td><%= dataMap.get("shangpinbianhao") %>
                                            </td>
                                            <td><%= dataMap.get("shangpinmingcheng") %>
                                            </td>
                                            <td><% if ("".equals(dataMap.get("shangpintupian"))) { %>-<% } else { %><img
                                                    width="100" src="<%= dataMap.get("shangpintupian") %>"/><% } %></td>
                                            <td><%
                                                HashMap mapshangpinfenlei14 = new CommDAO().find("SELECT fenlei FROM shangpinfenlei where id='" + dataMap.get("fenlei") + "'");
                                            %><%= mapshangpinfenlei14.get("fenlei") %>
                                            </td>
                                            <td><%= dataMap.get("jiage") %>
                                            </td>
                                            <td><%= dataMap.get("goumaishuliang") %>
                                            </td>
                                            <td><%= dataMap.get("songcanfei") %>
                                            </td>
                                            <td><%= dataMap.get("xiaoji") %>
                                            </td>
                                            <td><%= dataMap.get("goumairen") %>
                                            </td>
                                        </tr>
                                        </tbody>
                                        <% } %>
                                    </table>
                                </div>
                                <input id="dingdanxinxi" name="dingdanxinxi" type="hidden"/>
                                <script>$("#dingdanxinxi").val($("#dataListdingdanxinxi").html());</script>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">订单金额<span
                                    style="color: red;">*</span></label>
                            <div class="col-sm-10">

                                <input type="number" class="form-control" placeholder="输入订单金额" style="width:150px;"
                                       step="0.01" data-rule-required="true" data-msg-required="请填写订单金额" number="true"
                                       data-msg-number="输入一个有效数字" id="dingdanjine" name="dingdanjine" readonly value="<%=request.getParameter("xiaoji")%>"/>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">收货地址</label>
                            <div class="col-sm-10">

                                <div class="form-inline"><select id="shouhuodizhi" name="shouhuodizhi"
                                                                 onchange="getAjaxData('shouhuodizhi' , this.value,'xingming,dianhua,dizhi')">
                                    <option value="">请选择收货地址</option>
                                    <%
                                        List<HashMap> shouhuodizhiList = new CommDAO().select("SELECT * FROM shouhuodizhi ORDER BY id desc");
                                    %><% for (HashMap tempMap : shouhuodizhiList) { %>
                                    <option value="<%= tempMap.get("id") %>"><%= tempMap.get("xingming") %>
                                        - <%= tempMap.get("dianhua") %> - <%= tempMap.get("dizhi") %>
                                    </option>
                                    <% } %></select>
<%--                                    关键词：<input type="text" id="shouhuodizhi_keyword" value=""/>--%>
<%--                                    <button type="button" onclick="shouhuodizhi_select_update()">搜索</button>--%>
                                    <script>
                                        function shouhuodizhi_select_update() {
                                            var keyword = $('#shouhuodizhi_keyword').val();
                                            var where = {};
                                            searchSelect('shouhuodizhi', 'shouhuodizhi', keyword, where, 'xingming,dianhua,dizhi'.split(','), "".split(","));
                                        }
                                    </script>
                                </div>
                                <table>
                                    <tr>
                                        <td width="120">姓名</td>
                                        <td><input type="text" class="form-control" placeholder="输入姓名"
                                                   style="width:150px;" readonly="readonly" id="xingming"
                                                   name="xingming" value=""/></td>
                                    </tr>
                                    <tr>
                                        <td width="120">电话</td>
                                        <td><input type="text" class="form-control" placeholder="输入电话"
                                                   style="width:150px;" readonly="readonly" id="dianhua" name="dianhua"
                                                   value=""/></td>
                                    </tr>
                                    <tr>
                                        <td width="120">地址</td>
                                        <td><input type="text" class="form-control" placeholder="输入地址"
                                                   style="width:150px;" readonly="readonly" id="dizhi" name="dizhi"
                                                   value=""/></td>
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
                                          id="beizhu" name="beizhu"></textarea>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">下单人</label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control" placeholder="输入下单人" style="width:150px;"
                                       readonly="readonly" id="xiadanren" name="xiadanren"
                                       value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs"> </label>
                            <div class="col-sm-10">

                                <input type="hidden" name="referer" value="dingdan_list_xiadanren.jsp">
                                <input type="hidden" name="zhuangtai" id="zhuangtai" value="未支付"/>
                                <input type="hidden" name="iszf" value="否"/>

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
