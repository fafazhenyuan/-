<%--
  Created by IntelliJ IDEA.
  User: 吴珍缘
  Date: 2020/5/5
  Time: 16:37
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
<%--用户数据表格--%>
<table id="demo" class="layui-hide" lay-filter="test"></table>

<%--修改用户信息时的弹层--%>
<div class="layui-row" id="popUpdateTest" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" action="" style="margin-top:20px" >
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-block">
                    <input type="text"  name="altname" id="na" required  lay-verify="required" placeholder=""  autocomplete="off"  class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="text" name="altpasswd" id="pa" required  lay-verify="required" autocomplete="off" placeholder="请输入用户新密码密码" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">真实姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="altrealname" id="re" required  lay-verify="required" autocomplete="off" placeholder="请输入用户真实姓名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">年龄</label>
                <div class="layui-input-block">
                    <input type="text" name="altage" id="ag" required  lay-verify="required" autocomplete="off" placeholder="请输入用户年龄" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block" id="radio">
                    <input type="radio" name="altgender" value="0" title="男" checked>
                    <input type="radio" name="altgender" value="1" title="女">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-block">
                    <input type="text" name="altemail"  id="em" required  lay-verify="required" autocomplete="off" placeholder="请输入用户新邮箱" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">电话</label>
                <div class="layui-input-block">
                    <input type="text" name="altphone" id="ph" required  lay-verify="required" autocomplete="off" placeholder="请输入用户手机" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">地址</label>
                <div class="layui-input-block">
                    <input type="text" name="altadress" id="ad" required  lay-verify="required" autocomplete="off" placeholder="请输入用户新地址" class="layui-input">
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

<%--添加用户信息时的弹层--%>
<div class="layui-row" id="popAddTest" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" action="" style="margin-top:20px" >
            <div class="layui-form-item">
                <label class="layui-form-label">用户名称</label>
                <div class="layui-input-block">
                    <input type="text" name="addname"  required  lay-verify="required" autocomplete="off" placeholder="请输入用户名称" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">用户密码</label>
                <div class="layui-input-block">
                    <input type="text" name="addpasswd"  required  lay-verify="required" autocomplete="off" placeholder="请输入用户密码" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">真实姓名</label>
                <div class="layui-input-block">
                    <input type="text" name="addrealname"  required  lay-verify="required" autocomplete="off" placeholder="请输入用户真实姓名" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">年龄</label>
                <div class="layui-input-block">
                    <input type="text" name="addage"  required  lay-verify="required" autocomplete="off" placeholder="请输入用户年龄" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block" id="sexradio">
                    <input type="radio" name="addgender" value="0" title="男">
                    <input type="radio" name="addgender" value="1" title="女">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-block">
                    <input type="text" name="addemail"  required  lay-verify="required" autocomplete="off" placeholder="请输入用户邮箱" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">电话</label>
                <div class="layui-input-block">
                    <input type="text" name="addphone"  required  lay-verify="required" autocomplete="off" placeholder="请输入用户联系电话" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">地址</label>
                <div class="layui-input-block">
                    <input type="text" name="addadress"  required  lay-verify="required" autocomplete="off" placeholder="请输入用户地址" class="layui-input">
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

        //用户数据表格方法渲染
        var tableIns = table.render({
            elem: '#demo'
            ,url: "<%=basePath%>/user/users"
            ,parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code":res.code, //解析接口状态
                    "msg":res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": res.data //解析数据列表
                };
            }
            // , done: function (res) {
            //     //如果是异步请求数据方式，res即为你接口返回的信息。
            //     //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
            //     }
            ,page: true //开启分页
            ,cellMinWidth: 80
            ,cols: [[ //表头
                {field: 'userId', title: '用户id', width:80}
                ,{field: 'userName', title: '用户名'}
                ,{field: 'age', title: '年龄'}
                ,{field: 'gender', title: '性别(0:男 1:女)'}
                ,{field: 'email', title: '邮箱'}
                ,{field: 'phone', title: '电话'}
                ,{field: 'adress', title: '地址'}
                ,{field: 'realName', title: '真实姓名'}
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
                        title: "添加用户信息",
                        area: ['420px', '580px'],
                        content: $("#popAddTest")//引用的弹出层的页面层的方式加载修改界面表单
                    });
                    //动态向表传递赋值可以参看文章进行修改界面的更新前数据的显示，当然也是异步请求的要数据的修改数据的获取
                    setFormValue(obj,data);
                    //同步更新缓存对应的值
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
                layer.confirm('真的删除该条用户信息么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    $.ajax({
                        url: "<%=basePath%>/user/del",
                        type: "POST",
                        data:{
                            "userId": data.userId
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
                $("#na").attr("value",data.userName);
                $("#ag").attr("value",data.age);
                $("#re").attr("value",data.realName);
                $("#pa").attr("value",data.userPasswd);
                $("#ge").attr("value",data.gender);
                $("#em").attr("value",data.email);
                $("#ph").attr("value",data.phone);
                $("#ad").attr("value",data.adress);
                layer.open({
                    type: 1,
                    title: "修改用户信息",
                    area: ['420px', '580px'],
                    content: $("#popUpdateTest")//引用的弹出层的页面层的方式加载修改界面表单
                });

                document.getElementById("na").innerText = data.userName;

                //动态向表传递赋值可以参看文章进行修改界面的更新前数据的显示，当然也是异步请求的要数据的修改数据的获取
                console.log(obj);
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
                    var username = $(this).val();
                    $.ajax({
                        url: "<%=basePath%>/user/validate",
                        type: "POST",
                        data: {"name": username},
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
                    url:"<%=basePath%>/user/update",
                    type:'POST',
                    data:{
                        "userId":data.userId,
                        'userName': massage.field.altname,
                        "userPasswd":massage.field.altpasswd,
                        "realName":massage.field.altrealname,
                        'age': massage.field.altage,
                        'gender': massage.field.altgender,
                        'email': massage.field.altemail,
                        'phone': massage.field.altphone,
                        'adress': massage.field.altadress,
                    },
                    success:function (msg){
                        if(msg ==null){
                            layer.msg("修改失败", {icon: 5});
                        }else{
                            layer.closeAll('loading');
                            layer.load(2);
                            layer.msg("修改成功", {icon: 6});
                            setTimeout(function(){
                                obj.update({
                                    userName: massage.field.altname,
                                    userPasswd:massage.field.altpasswd,
                                    realName:massage.field.altrealname,
                                    age: massage.field.altage,
                                    gender: massage.field.altgender,
                                    email: massage.field.altemail,
                                    phone: massage.field.altphone,
                                    adres: massage.field.altadress
                                });//修改成功修改表格数据不进行跳转
                                layer.closeAll();//关闭所有的弹出层
                            }, 1000);
                        }
                    }
                })
                return false;
            })
        }


        form.on('submit(demoadd)', function(massage) {
            $.ajax({
                url:"<%=basePath%>/user/add",
                type:'POST',
                data:{
                    "userName": massage.field.addname,
                    "userPasswd":massage.field.addpasswd,
                    "realName":massage.field.addrealname,
                    "age": massage.field.addage,
                    "gender": massage.field.addgender,
                    "email": massage.field.addemail,
                    "phone": massage.field.addphone,
                    "adress": massage.field.addadress
                },
                success:function (msg){
                    if(msg == "fail"){
                        layer.msg("添加失败", {icon: 5});
                    }else{
                        layer.closeAll('loading');
                        layer.load(2);
                        layer.msg("添加成功", {icon: 6});
                        setTimeout(function(){
                            table.reload('demo', {
                                url:"<%=basePath%>/user/users"
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

        //添加用户
        $('#btn-add').on('click', function () {
            layer.open({
                type: 1,
                title: '用户添加',
                area: ['420px', '500px'],
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