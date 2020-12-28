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
<style>
    body{
        background-image: url("${pageContext.request.contextPath}/static/img/background.jpg");
    }
</style>
<body>
<div style="width: 400px;margin: 200px auto">
    <h1 style="text-align: center;margin: 35px auto" >学生选课系统</h1>
    <div class="easyui-panel" style="width:400px;padding:30px 60px;
    background-color: #e7e7e7;border-radius: 24px;">
        <form id="loginForm">
            <div style="margin-bottom:20px">
                <input id="username" name="username" class="easyui-numberbox" label="学号:" labelPosition="top"
                        style="width:100%;" placeholder="请输入学号/工号">
            </div>
            <div style="margin-bottom:20px">
                <input id="password" name="password" class="easyui-passwordbox" label="密码:" labelPosition="top"
                        style="width:100%;"  placeholder="请输入密码">
            </div>

            <div style="margin-bottom:20px">
                <select label="登陆方式:" id="character" class="easyui-combobox" name="character" style="width:100%;"
                        data-options="panelHeight:100">
                    <option value="student">学生</option>
                    <option value="teacher">教师</option>
                    <option value="admin">管理员</option>
                </select>
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

    $(function(){
        // easyui placeholder
        window.onload = $(".easyui-numberbox,.easyui-passwordbox").each(function(i){
            var span = $(this).siblings("span")[0];
            var targetInput = $(span).find("input:first");
            if(targetInput){
                $(targetInput).attr("placeholder", $(this).attr("placeholder"));
            }

        });
    });
</script>
</body>
</html>
