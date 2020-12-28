<%--
  Created by IntelliJ IDEA.
  User: Kirito
  Date: 2020/12/15
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/static/js/common.jsp"/>
</head>
<style>
    #banner-title {
        font-size: 32px;
        color: #fff;
        font-weight: bold;
        letter-spacing: 8px;
    }

    #title-table td {
        width: 20%;
        height: auto;
    }

    #title-table {
        background-color: #2086ce;
        width: 100%;
        height: 80%;
        /*border-bottom: #a6d9fd solid 15px;*/
    }

    .title_option {
        color: #2086ce;
        font-weight: bold;
        text-decoration: none;
        font-size: small;
        width: 20%;
        margin-left: 20px;
    }
</style>
<body>
<div>
    <table id="title-table">
        <tr>
            <td>
                <img src="${pageContext.request.contextPath}/static/img/banner.gif">
            </td>
            <td></td>
            <td>
                <h2 id="banner-title" style="text-align: center">学生选课系统</h2>
            </td>
            <td></td>
            <td></td>
        </tr>
    </table>
    <div style="background-color: #a6d9fd;text-align: center;float: left;width: 100%;height: 20%;overflow: hidden">
        <table style="width: 100%;height: 100%;font-size: small">
            <tr>
                <td style="width: 10%;"></td>
                <td style="width: 80%">
                    <marquee style="width: 100%" behavior="alternate" direction="left">
                        这里是学生管理系统 作者：计科一班2组
                    </marquee>
                </td>
                <td style="width: 10%;">
                    <a class="title_option" href="mainPage" target="mainFrame">首页</a>
                    <a class="title_option" href="" onclick="function x() {
                      $('#mainFrame').attr('src', $('#mainFrame').attr('src'));}">刷新</a>
                    <a class="title_option" href="javascript:logOut()">注销</a>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
