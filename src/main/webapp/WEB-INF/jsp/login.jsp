<%--
  Created by IntelliJ IDEA.
  User: Kirito
  Date: 2020/12/8
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <jsp:include page="/static/js/common.jsp"/>
</head>
<body>
<div style="width: 400px;margin: 250px auto 0 auto">
    <div class="easyui-panel" style="width:400px;padding:30px 60px">
        <form id="loginForm">
            <div style="margin-bottom:20px">
                <input id="username" name="username" class="easyui-numberbox" label="学号:" labelPosition="top"
                       data-options="required:true" style="width:100%;">
            </div>
            <div style="margin-bottom:20px">
                <input id="password" name="password" class="easyui-passwordbox" label="密码:" labelPosition="top"
                       data-options="required:true" style="width:100%;">
            </div>
            <div style="margin-bottom:20px">
                <div>
                    <a onclick="submitForm()" class="easyui-linkbutton" iconCls="icon-ok"
                       style="width:100%;height:32px">登录</a>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function submitForm() {
        var name = $("#username").val();
        var pwd = $("#password").val();
        if (name == "") {
            $.messager.alert('提示', '学号不能为空!');
            return false;
        } else if (pwd == "") {
            $.messager.alert('提示', '密码不能为空!');
            return false;
        } else {
            //提交表单
            $.post("student/login", {"username": name, "password": pwd}, function (result) {
                console.log(result.toString());
                if (result.success) {
                    // $.messager.alert("提示信息", result.message, "info", function () {
                        window.location.href = result.data;
                    // })
                } else {
                    $.messager.alert("提示信息", result.message, "info")
                }
            })
        }
    }
</script>
</body>
</html>
