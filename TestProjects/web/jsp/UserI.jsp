<%@ page import="java.util.List" %>
<%@ page import="pojo.Article" %>
<%@ page import="pojo.Img" %>
<%--
  Created by IntelliJ IDEA.
  User: 冷笑の游里
  Date: 2018/6/25
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="zh-CN">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="jsp/lib/bootstrap/css/bootstrap.min.css">
    <script language="JavaScript" src="jsp/lib/jquery-3.3.1.min.js"></script>
    <script language="JavaScript" src="jsp/lib/bootstrap/js/bootstrap.min.js"></script>
    <title>UI</title>
    <style>
        body{background: url("jsp/lib/picture/68201242_p0.jpg")-100px -100px no-repeat fixed;}
        .dropdown-menu{height:240px;}
        .dropdown-toggle{height:55px;}
        .headimg{ height:30px;width:30px;padding: -10px;}
        .table-striped{width:700px;color:#999999;margin-left: 220px;}
        .alert-border{background: red;}
    </style>
    <script language="JavaScript">
        function remove(){
            jQuery('.dropdown-menu-li').removeClass("active");
        }
    </script>
</head>
<body>
<div class="header">
    <nav class="navbar-nav navbar-inverse navbar-fixed-top">
        <div class="navbar-brand" style="padding-left:150px ;"><a href="#multiple">Project Name</a></div>
        <ul class="nav navbar-nav " style="padding-left: 30px;">
            <li class="active"><a href="#multiple" data-toggle="tab">综合</a></li>
            <li><a href="#java" data-toggle="tab">java</a></li>
            <li><a href="#cplus" data-toggle="tab">C++</a></li>
        </ul>
        <ul class="nav navbar-nav" style="display: inline;margin-top: -5px;float: right;padding-right: 130px">
            <li>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
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
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li style="text-align: center"><h5>sign as by ${requestScope.user.getUsername()}</h5></li>
                    <li class="divider"></li>
                    <li class="dropdown-menu-li">
                        <a href="#articles" data-toggle="tab" onclick="remove()">your articles</a></li>
                    <li class="dropdown-menu-li">
                        <a href="#writing" data-toggle="tab" onclick="remove()">start writing</a></li>
                    <li class="divider"></li>
                    <li class="dropdown-menu-li">
                        <a href="#help" data-toggle="tab" onclick="remove()">help</a></li>
                    <li class="dropdown-menu-li">
                        <a href="#settings" data-toggle="tab" onclick="remove()">settings</a></li>
                    <li><a href="/signout.action">sign out</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</div>
<div class="container">
    <div class="tab-content" style="margin-top: 100px;">
        <div id="multiple" class="tab-pane fade in active">
            <table class="table table-striped" style="background: white">
                <tr>
                    <td>标题</td>
                    <td style="text-align: right">时间</td>
                </tr>

            </table>
        </div>
        <div id="java" class="tab-pane fade in ">
            <table class="table table-striped" style="background: white">
                <tr>
                    <td>标题</td>
                    <td style="text-align: right">时间</td>
                </tr>
            </table>
        </div>
        <div id="cplus" class="tab-pane fade in">
            <table class="table table-striped" style="background: white">
                <tr>
                    <td>标题</td>
                    <td style="text-align: right">时间</td>
                </tr>
            </table>
        </div>
        <div id="articles" class="tab-pane fade in">
            <table class="table table-striped" style="background: white">
                <tr>
                    <td>标题</td>
                    <td style="text-align: right">时间</td>
                </tr>
                <%
                    List<Article> list = (List<Article>)request.getAttribute("articleList");
                    if(list==null||list.size()<1){
                        %>
                <tr>
                    <td colspan="2" style="text-align: center;">您还未发表任何文章</td>
                </tr>
                <%}
                else{
                        for(Article article:list){
                            %>
                <tr>
                    <td><a href="/Articleread.action?accountId=${requestScope.user.getAccountId()}&title=<%=article.getTitle()%>&time=<%=article.getTime()%>">
                        <%=article.getTitle()%></a></td>
                    <td style="text-align: right"><%=article.getTime()%></td>
                </tr>
                <%
                        }
            }
                %>
            </table>
        </div>
        <div id="help" class="tab-pane fade in">
            <div class="panel panel-default col-sm-3">
                <div class="panel-heading"></div>
                <div class="panel-body">
                    <ul class="nav">
                        <li><a href="#A" data-toggle="tab">帮助A</a></li>
                        <li><a href="#B" data-toggle="tab">帮助B</a></li>
                        <li><a href="#C" data-toggle="tab">帮助C</a></li>
                        <li><a href="#D" data-toggle="tab">帮助D</a></li>
                    </ul>
                </div>
            </div>
            <div class="tab-content col-sm-9">
                <div class="panel panel-default tab-pane fade in active" id="A">
                    <div class="panel-heading"><h2 class="panel-title">帮助A</h2></div>
                    <div class="panel-body">
                        <p>内容A</p>
                    </div>
                </div>
                <div class="panel panel-default tab-pane fade in" id="B">
                    <div class="panel-heading"><h2 class="panel-title">帮助B</h2></div>
                    <div class="panel-body">
                        <p>内容B</p>
                    </div>
                </div>
                <div class="panel panel-default tab-pane fade in" id="C">
                    <div class="panel-heading"><h2 class="panel-title">帮助C</h2></div>
                    <div class="panel-body">
                        <p>内容C</p>
                    </div>
                </div>
                <div class="panel panel-default tab-pane fade in" id="D">
                    <div class="panel-heading"><h2 class="panel-title">帮助D</h2></div>
                    <div class="panel-body">
                        <p>内容D</p>
                    </div>
                </div>
            </div>
        </div>
        <div id="writing" class="tab-pane fade in">
            <div class="panel panel-default" style="height:540px;width:800px;opacity: 0.8;margin-left: 180px;margin-bottom: 30px">
                <div class="panel-heading">
                    <h2 class="panel-title">writing page</h2>
                </div>
                <div class="panel-body">
                    <form action="/publish.action?accountId=${requestScope.user.getAccountId()}" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">
                        <div class="form-group" style="margin-left: -160px">
                            <label class="control-label col-sm-3">标题</label>
                            <div class="col-sm-9">
                                <input type="text" name="title" placeholder=""></div>
                        </div>
                        <div class="form-group" style="margin-left: -160px">
                            <label class="control-label col-sm-3">作者</label>
                            <div class="col-sm-9">
                                <input name="username" type="text" value=${requestScope.user.getUsername()} readonly="readonly" placeholder=""></div>
                        </div>
                        <div class="form-group">
                            <textarea name="article" style="resize: none;margin-left: 40px" cols="100" rows="16" placeholder=""></textarea>
                        </div>
                        <div class="form-group" style="margin-left: -110px;">
                            <input type="submit" class="btn btn-default"
                                   style="float:right; margin-right:35px;">
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <div id="settings" class="tab-pane fade in">
            <div class="panel panel-default col-sm-3">
                <div class="panel-heading">
                    <h2 class="panel-title">设置</h2>
                </div>
                <div class="panel-body">
                    <ul class=" nav">
                        <li class="active"><a href="#basic-setting" data-toggle="tab">基本设置</a></li>
                        <li><a href="#personal-img" data-toggle="tab">个人头像</a></li>
                    </ul>
                </div>
            </div>
            <div class="tab-content col-sm-9">
                <div class="panel panel-default tab-pane fade in active" id="basic-setting" style="width: 600px">
                    <div class="panel-heading">
                        <h2 class="panel-title">基本设置</h2>
                    </div>
                    <div class="panel-body" >
                        <form action="/userUpdate.action" method="post" class="form-horizontal" role="form">
                            <div class="form-group">
                                <label class="control-label col-sm-3">用户账号</label>
                                <div class="col-sm-9">
                                    <input type="text" name="accountId" value=${requestScope.user.getAccountId()}
                                            readonly="readonly"></div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3">用户昵称</label>
                                <div class="col-sm-9">
                                    <input type="text" name="username" value=${requestScope.user.getUsername()}></div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3">新密码</label>
                                <div class="col-sm-9">
                                    <input type="password" name="password" placeholder="" onblur="checkpass()">
                                    <p id="pass" style="display: inline-block;color: red;"></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3">确认密码</label>
                                <div class="col-sm-9">
                                    <input type="password" name="confirm" placeholder="">
                                    <p id="checkpass" style="display: inline-block;color: red;"></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-default" style="margin-left: 120px" value="提交"></div>
                        </form>
                    </div>
                </div>
                <div class="panel panel-default tab-pane fade in" id="personal-img" style="width: 600px">
                    <div class="panel-heading">
                        <h2 class="panel-title">个人头像</h2>
                    </div>
                    <div class="panel-body">
                        <form action="/uploadImg.action" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="control-label col-sm-3">用户账号</label>
                                <div class="col-sm-9">
                                    <input type="text" name="accountId" value=${requestScope.img.getAccountId()} readonly="readonly"></div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-3">用户头像</label>
                                <div class="col-sm-9">
                                    <input type="file" name="item_pic">
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn btn-default" value="上传" style="margin-left: 200px">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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
</body>
</html>
