<%--
  Created by IntelliJ IDEA.
  User: 吴珍缘
  Date: 2020/5/7
  Time: 23:42
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
<div style="font-style:italic;color: #C0C0C0" >&nbsp&nbsp注：食物种类中的第一位数字0、1、2分别代表早餐、晚餐、午餐。第二位数字0、1、2分别代表主食、蛋白质类食物、纤维素类食物</div>

<%--修改管理员信息时的弹层--%>
<div class="layui-row" id="popUpdateTest" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" action="" style="margin-top:20px" >
            <div class="layui-form-item">
                <label class="layui-form-label">食物名称</label>
                <div class="layui-input-block">
                    <input type="text" name="newname" id="na" required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">热量</label>
                <div class="layui-input-block">
                    <input type="text" name="newheat" id="he" required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">碳水化合物</label>
                <div class="layui-input-block">
                    <input type="text" name="newcarbohydrate" id="ca" required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">脂肪</label>
                <div class="layui-input-block">
                    <input type="text" name="newfat"  id="fa" required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">膳食纤维</label>
                <div class="layui-input-block">
                    <input type="text" name="newfiber"  id="fi" required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">蛋白质</label>
                <div class="layui-input-block">
                    <input type="text" name="newprotein" id="pr" required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">种类</label>
                <div class="layui-input-block">
                    <input type="text" name="newtype" id="ty" required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
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

<%--添加食物信息时的弹层--%>
<div class="layui-row" id="popAddTest" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" action="" style="margin-top:20px" >
            <div class="layui-form-item">
                <label class="layui-form-label">食物名称</label>
                <div class="layui-input-block">
                    <input type="text" name="addname"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">热量</label>
                <div class="layui-input-block">
                    <input type="text" name="addheat"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">碳水化合物</label>
                <div class="layui-input-block">
                    <input type="text" name="addcarbohydrate"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">脂肪</label>
                <div class="layui-input-block">
                    <input type="text" name="addfat"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">膳食纤维</label>
                <div class="layui-input-block">
                    <input type="text" name="addfiber"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">蛋白质</label>
                <div class="layui-input-block">
                    <input type="text" name="addprotein"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">种类</label>
                <div class="layui-input-block">
                    <input type="text" name="addtype"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
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
            ,url: "<%=basePath%>/food/foods"
            // ,parseData: function(res){ //res 即为原始返回的数据
            //     return {
            //         "code":res.code, //解析接口状态
            //         "msg":res.msg, //解析提示文本
            //         "count": res.count, //解析数据长度
            //         "data": res.data //解析数据列表
            //     };
            // }
            // , done: function (res) {
            //     //如果是异步请求数据方式，res即为你接口返回的信息。
            //     //如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
            //     }
            ,page: true //开启分页
            ,cellMinWidth: 80
            ,cols: [[ //表头
                {field: 'foodId', title: '食物id', width:150}
                ,{field: 'foodName', title: '食物名称'}
                ,{field: 'heat', title: '热量(Kcal)'}
                ,{field: 'carbohydrate', title: '碳水化合物(g)'}
                ,{field: 'fat', title: '脂肪(g)'}
                ,{field: 'fiber', title: '膳食纤维(g)'}
                ,{field: 'protein', title: '蛋白质(g)'}
                ,{field: 'type', title: '种类'}
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
                        title: "添加食物信息",
                        area: ['420px', '550px'],
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
                layer.confirm('真的删除该条食物信息么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    $.ajax({
                        url: "<%=basePath%>/food/del",
                        type: "POST",
                        data:{
                            "foodId": data.foodId
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
                $("#na").attr("value",data.foodName);
                $("#he").attr("value",data.heat);
                $("#ca").attr("value",data.carbohydrate);
                $("#fi").attr("value",data.fiber);
                $("#fa").attr("value",data.fat);
                $("#pr").attr("value",data.protein);
                $("#ty").attr("value",data.type);

                layer.open({
                    type: 1,
                    title: "修改食物信息",
                    area: ['420px', '550px'],
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
            form.on('submit(demo11)', function(massage) {
                $.ajax({
                    url:"<%=basePath%>/food/update",
                    type:'POST',
                    data:{
                    "foodId": data.foodId,
                    'foodName': massage.field.newname,
                    'heat':massage.field.newheat,
                    'carbohydrate':massage.field.newcarbohydrate,
                    'fat': massage.field.newfat,
                    'fiber':massage.field.newfiber,
                    'protein':massage.field.newprotein,
                    'type':massage.field.newtype
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
                                    foodName: massage.field.newname,
                                    heat:massage.field.newheat,
                                    carbohydrate:massage.field.newcarbohydrate,
                                    fat: massage.field.newfat,
                                    fiber:massage.field.newfiber,
                                    protein:massage.field.newprotein,
                                    type:massage.field.newtype
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
                url:"<%=basePath%>/food/add",
                type:'POST',
                data:{
                    'foodName': massage.field.addname,
                    'heat':massage.field.addheat,
                    'carbohydrate':massage.field.addcarbohydrate,
                    'fat': massage.field.addfat,
                    'fiber':massage.field.addfiber,
                    'protein':massage.field.addprotein,
                    'type':massage.field.addtype
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
                                url:"<%=basePath%>/food/foods"
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

        //添加食物
        $('#btn-add').on('click', function () {
            layer.open({
                type: 1,
                title: '食物添加',
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
