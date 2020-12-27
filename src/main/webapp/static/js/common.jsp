<%--
  Created by IntelliJ IDEA.
  User: Kirito
  Date: 2020/12/8
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>

<script src="${path}/static/js/jquery-3.1.1.js"></script>
<!--EasyUI的核心样式-->
<link rel="stylesheet" type="text/css" href="${path}/static/js/easyui/themes/default/easyui.css"/>
<!--EasyUI的图标样式-->
<link rel="stylesheet" type="text/css" href="${path}/static/js/easyui/themes/icon.css"/>
<!--jquery的核心JS-->
<script type="text/javascript" src="${path}/static/js/easyui/jquery.min.js"></script>
<!--jquery EasyUI的核心JS-->
<script type="text/javascript" src="${path}/static/js/easyui/jquery.easyui.min.js"></script>
<!-- 信息本地化js文件 -->
<script type="text/javascript" src="${path}/static/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<style>
    .a_link:link {
        font-size: 12px;
        color: #273bff;
        text-decoration: none;
    }
    .a_link:visited {
        font-size: 12px;
        color: #273bff;
        text-decoration: none;
    }
    .a_link:hover {
        font-size: 12px;
        color: #ff2638;
    }

    * {
        border: 0;
        margin: 0;
    }

    ul {
        list-style: none;
    }
</style>