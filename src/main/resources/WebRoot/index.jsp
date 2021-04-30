<%@ page language="java" import="dao.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@page import="util.*"%>


<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>

<link rel="stylesheet" href="js/swiper/swiper.css">
<script src="js/swiper/swiper.js"></script>


<div >

    <% ArrayList<HashMap> bhtList = Query.make("lunbotu").order("id desc").limit(5).select(); %>
    

<div class="swiper-container" id="banner14">
        <div class="swiper-wrapper">
            <%  for(HashMap bht:bhtList){  %>
            <div class="swiper-slide">
                <div class="decoimg_b2">
                    <a class="btn btn-" href="<%= bht.get("url") %>" style="background-image: url('<%= bht.get("image") %>'); height: 450px"></a>
                </div>
            </div>
            <% } %>
        </div>
        <!-- 如果需要分页器 -->
        <div class="swiper-pagination"></div>
        <!-- 如果需要导航按钮 -->
                <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
            </div>


    

<script>
        var mySwiper = new Swiper ('#banner14', {
            loop: true, // 循环模式选项
            autoplay:{
                delay:3000,
                disableOnInteraction:false
            },
            // 如果需要分页器
            pagination: {
                el: '.swiper-pagination',
            },
                        // 如果需要前进后退按钮
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
                        // 如果需要滚动条
            /*scrollbar: {
                el: '.swiper-scrollbar',
            },*/
        })
    </script>



</div>
<div >

    

<div class="container"><!-- 使用bootstrap css框架，container定宽，并剧中 https://v3.bootcss.com/css/#overview-container -->

                    

    

<div class="title-modelbox-widget" style="margin:15px 0 0 0;box-shadow:0px 0px 2px 2px #BBBBBB">
        <h3 class="section-title">
                        菜单信息        </h3>
        <div class="sidebar-widget-body">
            

    

<div class="fengjing clearfix">
        <% ArrayList<HashMap> shangpinlist18 = Query.make("shangpin").limit(8).order("id desc").select(); %>                <div class="row">
    
            <%  for(HashMap r:shangpinlist18){  %>
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