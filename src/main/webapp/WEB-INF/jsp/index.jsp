<%@ page import="com.kiriya.entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: Kirito
  Date: 2020/12/8
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生选课系统</title>
    <jsp:include page="/static/js/common.jsp"/>
</head>
<style>
    #sidebar li {
    }
</style>
<%
    Student student = new Student();
    if (session.getAttribute("student") != null) {
        student = (Student) session.getAttribute("student");
    }
%>
<body>
<div id="content" class="easyui-layout" style="width:100%;height:100%;">
    <%--    header--%>
    <div data-options="region:'north'" style="height:100px;">
        <jsp:include page="title.jsp"/>
    </div>
    <%--    侧边栏--%>
    <div data-options="region:'west',title:'选项'" style="width:200px;overflow: hidden">
        <div id="sideMenu" class="easyui-sidemenu" data-options="data:data"></div>
    </div>
    <%--    main内容--%>
    <div data-options="region:'center',title:''" style="padding:5px;background:#eee;">
        <iframe width="100%" height="100%" src="mainPage" name="mainFrame"></iframe>
    </div>
    <%--    footer--%>
    <div data-options="region:'south'" style="height:50px;overflow: hidden">
        <div style="padding: 15px">
            <span>欢迎您：[<%=student.getNum()%>]</span>
            <a class="a_link" href="studentMsgPage" target="mainFrame"><%=student.getName()%>
            </a>
            <span> | </span>
            <a class="a_link" href="javascript:logOut()">注销</a>
        </div>

    </div>
</div>
</body>
<script>
    function logOut() {
        $.messager.confirm('注销', '确定要注销吗？', function (flag) {
            if (flag) {
                $.post("student/logOut", function (result) {
                    window.location.href = result.data;
                })
            }
        });
    }

    var data = [{
        text: '网上选课',
        iconCls: 'icon-sum',
        state: 'open',
        children: [{
            text: '<a class="a_link" href="mainPage" target="mainFrame">首页</a>'
        }, {
            text: '<a class="a_link" href="studentMsgPage" target="mainFrame">我的信息</a>'
        }, {
            text: '<a class="a_link" href="allCoursePage" target="mainFrame">选课页面</a>'
        }]
    }, {
        text: '其他',
        iconCls: 'icon-more',
        children: [{
            text: '待添加'
        }, {
            text: '待添加'
        }, {
            text: '待添加'
        }]
    }];

</script>
</html>
