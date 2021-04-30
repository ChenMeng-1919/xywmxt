<%@ page language="java" import="dao.CommDAO" pageEncoding="utf-8" %>
<%@page import="java.util.HashMap" %>
<%@page import="util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>My JSP 'adminyanzheng.jsp' starting page</title>
</head>
<body>
<%
    String id,biao;
    if(request.getParameter("out_trade_no")!=null)
    {
        String[] out_trade_no = request.getParameter("out_trade_no").split("\\-");
        id = out_trade_no[2];
        biao = out_trade_no[1];

    }else{
        id =request.getParameter("id");
        biao =request.getParameter("biao");
    }
    HashMap order = new CommDAO().getmap(id, biao);
    String sql = "update " + biao + " set iszf='是' where id='" + id + "'";
    new CommDAO().commOper(sql);
        if("dingdan".equals(biao))
    {
        new CommDAO().commOper("update dingdan set zhuangtai='已支付' where id ='"+order.get("id")+"'");

        new CommDAO().commOper("update shangpin s,dingdan_dingdanxinxi dd SET s.kucun=s.kucun-dd.goumaishuliang,s.xiaoliang=s.xiaoliang+dd.goumaishuliang WHERE s.id=dd.shangpinid AND dingdanid='" + id + "'");
    }
    
    out.print("<script>alert('支付成功!!');location.href='"+(Request.get("referer").equals("")?"sy.jsp":Request.get("referer"))+"';</script>");


%>
</body>
</html>

