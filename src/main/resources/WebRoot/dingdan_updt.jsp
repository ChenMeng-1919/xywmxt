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


    <%
        // 获取需要编辑的数据
        String updtself = "0"; // 设置更新
        HashMap mmm = new CommDAO().getmap(request.getParameter("id"), "dingdan");
    %>


    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

        <div class="panel panel-default">
            <div class="panel-heading">
                编辑订单:
            </div>
            <div class="panel-body">
                <form action="dingdan.jsp?a=update" method="post" name="form1" id="form1"><!-- form 标签开始 -->

                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">订单编号</label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control" placeholder="输入订单编号" style="width:150px;"
                                       readonly="readonly" id="dingdanbianhao" name="dingdanbianhao"
                                       value="<%= Info.html(mmm.get("dingdanbianhao")) %>"/>
                            </div>

                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">订单信息</label>
                            <div class="col-sm-10">

                                <div id="dataListdingdanxinxi"><%= mmm.get("dingdanxinxi") %>
                                </div>
                                <input id="dingdanxinxi" name="dingdanxinxi" type="hidden"
                                       value="<%= Info.html(mmm.get("dingdanxinxi")) %>"/>
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
                                       data-msg-number="输入一个有效数字" id="dingdanjine" name="dingdanjine"
                                       value="<%= Info.html(mmm.get("dingdanjine")) %>"/>
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
                                                   name="xingming" value="<%= Info.html(mmm.get("xingming")) %>"/></td>
                                    </tr>
                                    <tr>
                                        <td width="120">电话</td>
                                        <td><input type="text" class="form-control" placeholder="输入电话"
                                                   style="width:150px;" readonly="readonly" id="dianhua" name="dianhua"
                                                   value="<%= Info.html(mmm.get("dianhua")) %>"/></td>
                                    </tr>
                                    <tr>
                                        <td width="120">地址</td>
                                        <td><input type="text" class="form-control" placeholder="输入地址"
                                                   style="width:150px;" readonly="readonly" id="dizhi" name="dizhi"
                                                   value="<%= Info.html(mmm.get("dizhi")) %>"/></td>
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
                            <label style="text-align: right" class="col-sm-2 hiddex-xs">下单人</label>
                            <div class="col-sm-10">

                                <input type="text" class="form-control" placeholder="输入下单人" style="width:150px;"
                                       readonly="readonly" id="xiadanren" name="xiadanren"
                                       value="<%= mmm.get("xiadanren") %>"/>
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
