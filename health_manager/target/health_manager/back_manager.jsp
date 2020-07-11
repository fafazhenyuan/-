<%--
  Created by IntelliJ IDEA.
  User: 吴珍缘
  Date: 2020/5/7
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <title>Layui</title>
    <%@ include file="/common.jsp" %>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${url}/lib/layui-v2.5.6/css/layui.css" media="all">
</head>
<body>
<%--管理员数据表格--%>
<table id="demo" class="layui-hide" lay-filter="test"></table>

<%--修改管理员信息时的弹层--%>
<div class="layui-row" id="popUpdateTest" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" action="" style="margin-top:20px" >

            <div class="layui-form-item">
                <label class="layui-form-label">管理员名称</label>
                <div class="layui-input-block">
                    <input type="text" name="newname" id="na" required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>


            <div class="layui-form-item">
                <label class="layui-form-label">新密码</label>
                <div class="layui-input-block">
                    <input type="text" name="newpasswd"  id="pa" required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                    <button class="layui-btn  layui-btn-submit " lay-submit lay-filter="demo11">确认修改</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>

<%--添加管理员信息时的弹层--%>
<div class="layui-row" id="popAddTest" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" action="" style="margin-top:20px" >
            <div class="layui-form-item">
                <label class="layui-form-label">管理员名称</label>
                <div class="layui-input-block">
                    <input type="text" name="addname" id="addname" required  lay-verify="required" autocomplete="off" placeholder="请输入管理员名称" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">管理员密码</label>
                <div class="layui-input-block">
                    <input type="text" name="addpasswd"  lay-verify="required|password" autocomplete="off" placeholder="请输入管理员密码" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                    <button class="layui-btn  layui-btn-submit " lay-submit lay-filter="demoadd">确认添加</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="${url}/lib/layui-v2.5.6/layui.js" charset="utf-8"></script>
<script src="${url}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>

<%--定义工具栏按钮--%>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="delete">删除</button>
        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="update">编辑</button>
    </div>
</script>

<script>
    layui.use(['table', 'form', 'layer'], function(){
        var form = layui.form
            , table = layui.table
            , layer = layui.layer
            , $ = layui.jquery;

        //管理员数据表格方法渲染
        var tableIns = table.render({
            elem: '#demo'
            ,url: "<%=basePath%>/manager/managers"
            ,parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code":res.code, //解析接口状态
                    "msg":res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": res.data //解析数据列表
                };
            }
            , done: function (res) {
                //如果是异步请求数据方式，res即为你接口返回的信息。
                //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
                }
            ,page: true //开启分页
            ,cellMinWidth: 80
            ,cols: [[ //表头
                {field: 'managerId', title: '管理员id', width:150 ,sort:true}
                ,{field: 'managerName', title: '管理员名称'}
                ,{field: 'managerPasswd', title: '管理员密码'}
                ,{field:'right', title: '操作',  toolbar:"#toolbarDemo",  align: 'center'}
            ]]
            ,toolbar: 'default'
            ,id:'demo'
        });

        //监听事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus('demo');

            switch(obj.event){
                case 'add':
                    layer.open({
                        //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                        type: 1,
                        title: "添加管理员信息",
                        area: ['420px', '330px'],
                        content: $("#popAddTest")//引用的弹出层的页面层的方式加载修改界面表单
                    });
                    setFormValue(obj,obj.data);
                    obj.update({

                    })


                    break;
            };
        });




        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if(layEvent === 'delete'){ //删除
                layer.confirm('真的删除该管理员信息么？', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    $.ajax({
                        url: "<%=basePath%>/manager/del",
                        type: "POST",
                        data:{
                            "managerId": data.managerId
                        },
                        success: function(data){
                            if (data == "success"){
                                layer.msg('删除成功');
                            }else{
                                layer.msg('删除失败，请重试');
                            }
                        }
                    });
                })
            } else if(layEvent === 'update'){
                $("#pa").attr("value",data.managerPasswd);
                $("#na").attr("value",data.managerName);
                layer.open({
                    type: 1,
                    title: "修改管理员信息",
                    area: ['420px', '330px'],
                    content: $("#popUpdateTest")//引用的弹出层的页面层的方式加载修改界面表单
            });
                //动态向表传递赋值可以参看文章进行修改界面的更新前数据的显示，当然也是异步请求的要数据的修改数据的获取
                setFormValue(obj,data);
                //同步更新缓存对应的值
                obj.update({
                });
            } else if(layEvent === 'LAYTABLE_TIPS'){
                layer.alert('Hi，头部工具栏扩展的右侧图标。');
            }
        });

        table.on('checkbox(test)', function(obj){
            console.log(obj)
        });

        //监听弹出框表单提交，massage是修改界面的表单数据'submit(demo11),是修改按钮的绑定
        function setFormValue(obj,data){
            $(function () {
                $("#na").blur(function () {
                    var managername = $(this).val();
                    $.ajax({
                        url: "<%=basePath%>/manager/validate",
                        type: "POST",
                        data: {"username": managername},
                        success: function (result) {
                            if (result) {
                                layer.msg('用户名已存在，请重新输入');
                            }
                        }
                    });
                });
            });



            form.on('submit(demo11)', function(massage) {
                $.ajax({
                    url:"<%=basePath%>/manager/update",
                    type:'POST',
                    data:{
                        "managerId":data.managerId,
                        "managerName":massage.field.newname,
                        "managerPasswd":massage.field.newpasswd
                        },
                    success:function (msg){
                        if(!msg){
                            layer.msg("修改失败", {icon: 5});
                        }else{
                            layer.closeAll('loading');
                            layer.load(2);
                            layer.msg("修改成功", {icon: 6});
                            setTimeout(function(){
                                obj.update({
                                    managerName: massage.field.newname,
                                    managerPasswd: massage.field.newpasswd
                                });//修改成功修改表格数据不进行跳转
                                layer.closeAll();//关闭所有的弹出层
                            }, 1000);
                        }

                    }
                })
                return false;
            })
        }

        $(function () {
            $("#addname").blur(function () {
                var managername = $(this).val();
                $.ajax({
                    url: "<%=basePath%>/manager/validate",
                    type: "POST",
                    data: {"username": managername},
                    success: function (result) {
                        if (result) {
                            layer.msg('用户名已存在，请重新输入');
                        }
                    }
                });
            });
        });
        form.on('submit(demoadd)', function(massage) {


            $.ajax({
                url:"<%=basePath%>/manager/add",
                type:'POST',
                data:{
                    "managerName":massage.field.addname,
                    "managerPasswd":massage.field.addpasswd
                },
                success:function (msg){
                    if(!msg){
                        layer.msg("添加失败", {icon: 5});
                    }else{
                        layer.closeAll('loading');
                        layer.load(2);
                        layer.msg("添加成功", {icon: 6});
                        setTimeout(function(){
                            table.reload('demo', {
                                url:"<%=basePath%>/manager/managers"
                                ,where: {} //设定异步数据接口的额外参数
                                //,height: 300
                            });
                            layer.closeAll();//关闭所有的弹出层
                        }, 1000);
                    }

                }
            })
            return false;
        })

        //添加管理员
        $('#btn-add').on('click', function () {
            layer.open({
                type: 1,
                title: '管理员添加',
                area: ['420px', '330px'],
                content: $("#popaddTest")//引用的弹出层的页面层的方式加载修改界面表单
            });
        });

        var $ = layui.$, active = {
            reload: function () {
                var demoReload = $('#demoReload');
                //执行重载
                table.reload('demo', {
                    where: {
                        key: {
                            field: demoReload.val()
                        }
                    }
                });
            }
        };

 });
</script>
</body>
</html>
