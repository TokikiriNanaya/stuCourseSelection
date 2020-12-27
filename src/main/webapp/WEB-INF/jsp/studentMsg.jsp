<%@ page import="com.kiriya.entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: Kirito
  Date: 2020/12/8
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息</title>
    <jsp:include page="/static/js/common.jsp"/>
</head>
<style>
    #stuMsg, #stuMsg tr th, #stuMsg tr td {
        border: #95B8E7 solid 1px;
    }

    #stuMsg {
        width: auto;
        min-height: 25px;
        line-height: 25px;
        text-align: center;
        border-collapse: collapse;
    }

    .t-key {
        width: 150px
    }

    .t-value {
        width: 300px
    }

    /*工具栏右对齐*/
    .datagrid-toolbar {
        height: auto;
        padding: 1px 2px;
        border-width: 0 0 1px 0;
        border-style: solid;
        height: 30px;
    }

    .datagrid-toolbar table {
        float: right;
    }
</style>
<%
    Student student = (Student) session.getAttribute("student");
%>
<body>
<div style="width: 1200px;height: 600px;margin: auto;">

    <div style="padding: 20px 0"></div>
    <div class="easyui-panel" title="个人信息" style="width:100%;padding:10px">
        <table id="stuMsg" style="width: auto;margin: auto">
            <tr>
                <td class="t-key">姓名</td>
                <td class="t-value"><%=student.getName()%>
                </td>
                <td class="t-key">学号</td>
                <td class="t-value"><%=student.getNum()%>
                </td>
            </tr>
            <tr>
                <td class="t-key">性别</td>
                <td class="t-value"><%=student.getSex()%>
                </td>
                <td class="t-key">出生日期</td>
                <td class="t-value"></td>
            </tr>
            <tr>
                <td class="t-key">联系电话</td>
                <td class="t-value"><%=student.getTel()%>
                </td>
                <td class="t-key">联系地址</td>
                <td class="t-value"></td>
            </tr>
            <tr>
                <td class="t-key">登记时间</td>
                <td class="t-value"><%=student.getSignInTime()%>
                </td>
                <td class="t-key">专业</td>
                <td class="t-value"><%=student.getMajor()%>
                </td>
            </tr>
        </table>
    </div>


    <table id="Datagrid" class="easyui-datagrid" title="已选课程" style="width:1200px"
           data-options="fitColumns:true,
       checkOnSelect:true,
       rownumbers:true,
       pagination:true,
       striped:true,
       toolbar:toolbar">
    </table>

</div>
</body>
<script>
    var Datagrid = $("#Datagrid")
    $(function () {
        //加载表格

        Datagrid.datagrid({
            url: 'student/getMyCourse',
            columns: [[
                {field: 'num', title: '课程编号', width: 100, align: 'center'},
                {field: 'name', title: '课程名称', width: 100, align: 'center'},
                {field: 'describe', title: '描述', width: 100, align: 'center'},
                {field: 'teacher_name', title: '教师', width: 100, align: 'center'},
                {field: 'credit', title: '学分', width: 100, align: 'center'},
                {field: 'class_hours', title: '学时', width: 100, align: 'center'},
                {field: 'classroom', title: '教室', width: 100, align: 'center'},
                {field: 'start_time', title: '上课时间', width: 100, align: 'center'},
                {field: 'max_members', title: '最大人数', width: 100, align: 'center'},
                {field: 'select_members', title: '已选人数', width: 100, align: 'center'}
            ]],
            onLoadSuccess: function (data) {

            }
        });
    })

    //工具栏
    var toolbar = [{
        text: '清空选择',
        iconCls: 'icon-clear',
        handler: function () {
            $("#Datagrid").datagrid('clearSelections');
        }
    }, {
        text: '课程退选',
        iconCls: 'icon-remove',
        handler: function () {
            var selections = [];
            var rows = $('#Datagrid').datagrid('getSelections');
            if (rows == "") {
                $.messager.alert('提示', '你还没有选择课程！');
                return false
            }
            for (var i = 0; i < rows.length; i++) {
                var row = rows[i];
                selections.push('<span>课程编号：' + row.num + " " + row.name + '</span>');
            }
            $.messager.confirm('确认', '确定要取消以下课程吗？' + '<br/><br/><br/>' + selections.join('<br/>'), function (flag) {
                if (flag) {
                    var courseNums = new Array();
                    for (var i = 0; i < rows.length; i++) {
                        courseNums.push(rows[i].num);
                    }
                    console.log(courseNums)
                    courseNums = JSON.stringify(courseNums);
                    console.log(courseNums)

                    $.post("student/deleteCourses", {"courseNums": courseNums}, function (result) {
                        $.messager.alert("提示信息", result.message, "info", function () {
                            $('#Datagrid').datagrid('reload');
                        })
                    })
                }
            });
        }
    }];
</script>
</html>

</body>
</html>
