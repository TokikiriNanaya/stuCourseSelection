<%@ page import="com.kiriya.entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: Kirito
  Date: 2020/12/8
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>课程</title>
    <jsp:include page="/static/js/common.jsp"/>
</head>
<style>
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
<body>
<div style="width: 1200px;height: 600px;margin:30px auto;">

    <table id="Datagrid" title="全部课程" class="easyui-datagrid" style="width:1200px"
           data-options="fitColumns:true,
       checkOnSelect:true,
       rownumbers:true,
       pagination:true,
       striped:true,
       toolbar:toolbar"></table>

</div>
</body>
<script>
    var Datagrid = $("#Datagrid")
    $(function () {
        //加载表格
        Datagrid.datagrid({
            url: 'student/getAllCourse',
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
            onClickRow: function (rowIndex, rowData) {
                $(this).datagrid('unselectRow', rowIndex);
            },
            onLoadSuccess: function (data) {
                // if (data.rows.length > 0) {
                //     for (var i = 0; i < data.rows.length; i++) {
                //         var courseNum=data.rows[i].num;
                //         $.post()("", {"courseNums": courseNum}, function (result) {
                //
                //         });
                //         if (data.rows[i] == 1) {
                //             $("input[type='checkbox']")[i + 1].disabled = true;
                //         }
                //     }
                // }
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
        text: '确认选课',
        iconCls: 'icon-add',
        handler: function () {
            var selections = [];
            var rows = $('#Datagrid').datagrid('getSelections');
            if (rows=="") {
                $.messager.alert('提示','你还没有选择课程！');
                return false
            }
            for (var i = 0; i < rows.length; i++) {
                var row = rows[i];
                selections.push('<span>课程编号：' + row.num + " " + row.name + '</span>');
            }
            $.messager.confirm('确认', '确定要选以下课程吗？' + '<br/><br/><br/>' + selections.join('<br/>'), function (flag) {
                if (flag) {
                    var courseNums=new Array();
                    for (var i = 0; i < rows.length; i++) {
                        courseNums.push(rows[i].num);
                    }
                    console.log(courseNums)
                    courseNums=JSON.stringify(courseNums);
                    console.log(courseNums)

                    $.post("student/selectCourses", {"courseNums": courseNums}, function (result) {
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
