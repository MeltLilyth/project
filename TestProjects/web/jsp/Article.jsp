<%@ page import="pojo.Img" %><%--
  Created by IntelliJ IDEA.
  User: 冷笑の游里
  Date: 2018/6/27
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="jsp/lib/bootstrap/css/bootstrap.min.css">
    <script language="JavaScript" src="jsp/lib/jquery-3.3.1.min.js"></script>
    <script language="JavaScript" src="jsp/lib/bootstrap/js/bootstrap.min.js"></script>
    <title>Article</title>
    <style>
        body{background:url("jsp/lib/picture/66296409_p0_master1200.jpg")80px 0 no-repeat fixed;}
        .article-remark{height:30px;width:800px; margin-left: 160px;}
        .article-border{width:800px;margin-left: 160px;}
        .headimg{ height:50px;width:50px;margin-top:5px;}
        pre {white-space: pre-wrap; white-space: -moz-pre-wrap;white-space: -o-pre-wrap;word-wrap: break-word;  }
    </style>
</head>
<body>
<div class="header">
    <nav class="navbar-nav navbar-fixed-top navbar-inverse">
        <div class="navbar-brand" style="padding-left: 150px;">
            <a href="/return.action?accountId=${requestScope.user.getAccountId()}">Project Name</a></div>
        <ul class="nav navbar-nav" style="display: inline;margin-top: -5px;float: right;padding-right: 150px">
            <li>
                <%
                    Img img = (Img)request.getAttribute("img");
                    if(img.getImg()!=null){
                %>
                <img src="/pic/<%=img.getImg()%>" class="img-rounded headimg">
                <%}
                else{
                %>
                <img src="jsp/lib/picture/person_33.872340425532px_1189663_easyicon.net.png" class="img-rounded headimg">
                <%}%>
            </li>
        </ul>
    </nav>
</div>
<div class="container" style="margin-top: 100px;margin-bottom: 60px">
    <div class="panel panel-default" style="opacity: 0.9">
        <div class="panel-heading">
            <h2 class="panel-title" style="text-align: center">${requestScope.articles.getTitle()}</h2>
        </div>
        <div class="panel-body">
            <div class="article-remark">
                <p style="font-size: 10px ;color: #999999">作者：${requestScope.articles.getUsername()}</p>
                <p style="float: right;font-size: 10px;color: #999999;margin-top: -26px;">发布时间：${requestScope.articles.getTime()}</p>
            </div>
            <div class="article-border">
                <pre>${requestScope.articles.getArticle()}</pre>
            </div>
        </div>
    </div>
    <div class="footer">
        <nav class="navbar-nav navbar-fixed-bottom" style="background:#555555;color: #999999;">
            <ul class="nav navbar-nav" style="float: right; padding-right:20px;">
                <li>by 冷笑の游里</li>
            </ul>
        </nav>
    </div>
</div>
</body>
</html>
