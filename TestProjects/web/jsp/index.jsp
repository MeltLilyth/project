<%--
  Created by IntelliJ IDEA.
  User: 冷笑の游里
  Date: 2018/6/16
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="jsp/lib/bootstrap/css/bootstrap.min.css">
    <script type="text/javascript" language="JavaScript" src="jsp/lib/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" language="JavaScript" src="jsp/lib/bootstrap/js/bootstrap.min.js"></script>
    <title>index</title>
    <style>
      body{background: url("jsp/lib/picture/69334057_p0.jpg")-100px -22px no-repeat;}
      .load-border{width:400px;margin-top: 150px; margin-left: 380px;}
      .submit-btn{height:40px;width:200px; color: white;background: #31b0d5;text-align: center;}
      .login-form{padding-left:100px;}
      .regist-border{width:400px;margin-top: 150px;margin-left: 380px;}
      .regist-btn{height:40px;width:200px; color: white;background: #d58512;text-align: center;}
      .regist-form{padding-left:100px;}
    </style>
  </head>
  <body>
  <%--标题标签栏--%>
  <div class="header">
    <nav class="navbar-nav navbar-inverse navbar-fixed-top">
      <div class="navbar-brand"><a href="#">Project Name</a></div>
      <ul class="nav navbar-nav" style="float: right; padding-right: 100px">
        <li class="active"><a href="#login" data-toggle="tab">Login</a></li>
        <li><a href="#regist" data-toggle="tab">regist</a></li>
      </ul>
    </nav>
  </div>
  <%--内容--%>
  <div class="container">
    <div class="tab-content" style="margin-top: 100px">
      <div class="load-border panel-default tab-pane fade in active" id="login">
        <div class="panel-heading">
          <h2 class="panel-title" style="text-align: center">Login</h2>
        </div>
        <div class="panel-body" style="background:white ;">
          <form action="/login.action" method="get" class="form-horizontal login-form" role="form">
            <div class="form-group">
              <input name="accountId" type="text" style="height: 30px;width:200px;" placeholder="用户账号">
            </div>
            <div class="form-group">
              <input name="password" type="password" style="height: 30px;width:200px;" placeholder="密码">
            </div>
            <div class="form-group">
              <input type="submit" class="btn btn-default submit-btn" value="login">
            </div>
          </form>
          <div style="text-align: center ;color:red;" class="Errormessage"><p>${requestScope.message}</p></div>
        </div>
      </div>
      <div class="regist-border panel-default tab-pane fade in" id="regist">
        <div class="panel-heading">
          <h2 class="panel-title" style="text-align: center">regist</h2>
        </div>
        <div class="panel-body" style="background: white;">
          <form action="/regist.action" method="get" class="form-horizontal regist-form" role="form">
            <div class="form-group">
              <input name="accountId" type="text" style="height:30px;width:200px;" readonly="readonly"
                     value=${requestScope.accountId}>
            </div>
            <div class="form-group">
              <input name="username" type="text" style="height:30px;width:200px;" placeholder="用户名">
            </div>
            <div class="form-group">
              <input name="password" type="password" style="height:30px;width:200px;" placeholder="密码">
            </div>
            <div class="form-group">
              <input type="submit" class="btn btn-default regist-btn" value="regist">
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <%--尾部--%>
  <div class="footer">
    <nav class="navbar-nav navbar-fixed-bottom" style="background:#555555;color: #999999;">
      <ul class="nav navbar-nav" style="float: right; padding-right:20px;">
        <li>by 冷笑の游里</li>
      </ul>
    </nav>
  </div>
  </body>
</html>
