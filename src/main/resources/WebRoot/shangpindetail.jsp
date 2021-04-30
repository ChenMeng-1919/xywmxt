<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>



<%
%>
<% HashMap map = Query.make("shangpin").where("id", request.getParameter("id")).find(); %><%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>
<script src="js/jquery.validate.js"></script>


<div >



    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->





        <div class="title-modelbox-widget" style="background-color:#F8F8F8">
            <h3 class="section-title">
                商品详情        </h3>
            <div class="sidebar-widget-body">




                <div class="">
                    <div class="goods-info clearfix">
                        <div class="gallery-list">
                            <div class="swiper-container gallery-top" id="shangpin-galler">
                                <div class="swiper-wrapper">
                                </div>
                            </div>
                            <div class="swiper-container gallery-thumbs" id="shangpin-thumb">
                                <div class="swiper-wrapper">
                                </div>
                            </div>
                        </div>
                        <div class="goods-right-content">
                            <h3 class="title"><%= map.get("shangpinmingcheng") %></h3>
                            <div class="descount">
                                <div>
                        <span class="name">
                            商品编号：
                        </span>
                                    <span class="val">
                            <%= map.get("shangpinbianhao") %>                        </span>
                                </div>
                                <div>
                        <span class="name">
                            分类：
                        </span>
                                    <span class="val">
                            <%
                                HashMap mapshangpinfenlei6 = new CommDAO().find("SELECT fenlei FROM shangpinfenlei where id='"+map.get("fenlei")+"'");
                            %><%= mapshangpinfenlei6.get("fenlei") %>                        </span>
                                </div>
                                <div>
                        <span class="name">
                            库存：
                        </span>
                                    <span class="val">
                            <%= map.get("kucun") %>                        </span>
                                </div>
                                <div>
                        <span class="name">
                            价格：
                        </span>
                                    <span class="val">
                            <%= map.get("jiage") %>                        </span>
                                </div>
                                <div>
                        <span class="name">
                            送餐费：
                        </span>
                                    <span class="val">
                            <%= map.get("songcanfei") %>                        </span>
                                </div>
                                <div>
                        <span class="name">
                            销量：
                        </span>
                                    <span class="val">
                            <%= map.get("xiaoliang") %>                        </span>
                                </div>
                            </div>

                            <% HashMap readMap = Query.make("shangpin").where("id", request.getParameter("id")).find(); %>
                            <form class="form-inline" action="diancan.jsp?a=insert" id="form1" method="post"><!-- form 标签开始 -->


                                <div style="display: none">

                                    <input type="hidden" name="shangpinid" value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>"/>                                                                                                                                                            <input type="hidden" id="shangpinbianhao" name="shangpinbianhao" value="<%= Info.html(map.get("shangpinbianhao")) %>"/>
                                    <input type="hidden" id="shangpinmingcheng" name="shangpinmingcheng" value="<%= Info.html(map.get("shangpinmingcheng")) %>"/>
                                    <input type="hidden" id="shangpintupian" name="shangpintupian" value="<%= Info.html(map.get("shangpintupian")) %>"/>
                                    <input type="hidden" id="fenlei" name="fenlei" value="<%= Info.html(map.get("fenlei")) %>"/>
                                    <input type="hidden" id="songcanfei" name="songcanfei" value="<%= Info.html(map.get("songcanfei")) %>"/>
                                    <input type="hidden" id="jiage" name="jiage" value="<%= Info.html(map.get("jiage")) %>"/>
                                    <input type="text" class="form-control" placeholder="输入购买人" style="width:150px;" readonly="readonly" id="goumairen" name="goumairen" value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>
                                    <input name="referer" id="referer" value="" type="hidden"/>
                                    <script>
                                        $('#referer').val(location.href);
                                    </script>
                                </div>

                                <div class="mt10">
                                    <div class="spec-list">
                                    </div>

                                    <div class="mt10">
                                        <div class="form-group mt10">
                                            购买数量：

                                            <input type="number" class="form-control" placeholder="输入购买数量" style="width:150px;" data-rule-required="true" data-msg-required="请填写购买数量" number="true" data-msg-number="输入一个有效数字" min="1" max="<%= readMap.get("kucun") %>" id="goumaishuliang" name="goumaishuliang" value=""/>
                                        </div>
                                    </div>
                                    <div class="mt10">
                                        <% if( request.getSession().getAttribute("username") == null || "".equals( request.getSession().getAttribute("username") ) ){ %>
                                        <button type="button" class="btn btn-primary" onclick="alert('你尚未登录，请登录后操作')">
                                            加入购物车
                                        </button>
                                        <% } else { %>
                                        <button type="submit" class="btn btn-primary">
                                            加入购物车
                                        </button>
                                        <% } %>

                                    </div>
                                </div>

                                <!--form标签结束--></form>
                            <script>
                                $(function () {
                                    $('#form1').validate();
                                })
                            </script>
                        </div>
                    </div>
                    <div class="goods-content">
                        <%= map.get("neirong") %>
                    </div>

                    <script>
                        (function () {
                            var images = "<%= map.get("shangpintupian") %>".split(",");
                            if(images.length>0){
                                for (var i=0;i < images.length;i++){
                                    var path = images[i]
                                    var src = '<div class="swiper-slide"><div class="img-box pb100"><div class="img" style="background-image: url('+path+')"></div></div></div>';
                                    $('#shangpin-galler .swiper-wrapper').append(src);
                                    $('#shangpin-thumb .swiper-wrapper').append(src);
                                }

                                var thumbsSwiper = new Swiper('#shangpin-thumb',{
                                    spaceBetween: 10,
                                    slidesPerView: 4,
                                    watchSlidesVisibility: true,//防止不可点击
                                })
                                var gallerySwiper = new Swiper('#shangpin-galler',{
                                    spaceBetween: 10,
                                    thumbs: {
                                        swiper: thumbsSwiper,
                                    }
                                })
                            }

                        })();

                    </script>

                </div>




            </div>
            <!-- /.sidebar-widget-body -->
        </div>





        <!-- container定宽，并剧中结束 --></div>



</div>
<div >



    <div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->





        <div class="title-modelbox-widget">
            <h3 class="section-title">
                评论        </h3>
            <div class="sidebar-widget-body">




                <div class="gr-control-module-table">
                    <div class="">
                        <form action="pinglun.jsp?a=insert" method="post"><!-- form 标签开始 -->

                            <div class="form-group" style="display: none">
                                <div class="row">
                                    <label style="text-align: right" class="col-sm-2 hiddex-xs">评分</label>
                                    <div class="col-sm-10">

                                        <select class="form-control" name="pingfen">

                                            <option value="1">1分</option>
                                            <option value="2">2分</option>
                                            <option value="3">3分</option>
                                            <option value="4">4分</option>
                                            <option value="5">5分</option>

                                        </select>

                                    </div>

                                </div>
                            </div>
                            <div class="form-group">


                                <textarea style="width: 80%;height: 120px" class="form-control" name="pinglunneirong" placeholder="请输入评论内容"></textarea>

                            </div>
                            <input type="hidden" name="biao" value="shangpin"/>
                            <input name="biaoid" type="hidden" id="biaoid" value="<%= request.getParameter("id") !=null ? request.getParameter("id") : "" %>"/>
                            <input name="biaoti" type="hidden" id="biaoti" value="<%= map.get("shangpinmingcheng") %>"/>
                            <input name="pinglunren" type="hidden" value="<%= request.getSession().getAttribute("username") !=null ? request.getSession().getAttribute("username") : "" %>"/>
                            <div style="text-align: left">
                                <button type="submit" class="btn btn-primary">
                                    发布评论
                                </button>
                            </div>

                            <!--form标签结束--></form>
                    </div>

                    <% ArrayList<HashMap> pinglunList = Query.make("pinglun").where("biao", "shangpin").where("biaoid", request.getParameter("id")).order("id desc").select(); %>

                    <div class="mt10">
                        <%  for(HashMap pl:pinglunList){  %>
                        <% HashMap user = Query.make("yonghu").where("yonghuming", pl.get("pinglunren")).find(); %>

                        <div class="comment clearfix">
                            <div class="common-avatar J_User">
                                <% if( user.get("touxiang") == null || "".equals( user.get("touxiang") ) ){ %>
                                <img src="images/default.gif" width="100%" height="100%"/>
                                <% } else { %>
                                <img src="<%= user.get("touxiang") %>" width="100%" height="100%"/>
                                <% } %>
                            </div>
                            <div class="comment-block">
                                <p class="comment-user">
                                    <span class="comment-username J_User"> <%= user.get("yonghuming") %> </span>
                                    <span class="comment-time"><%= pl.get("addtime") %></span>

                                </p>
                                <div class="comment-content J_CommentContent"><%= pl.get("pinglunneirong") %></div>


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