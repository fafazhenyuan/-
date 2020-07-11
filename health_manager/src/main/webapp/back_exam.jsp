<%--
  Created by IntelliJ IDEA.
  User: 吴珍缘
  Date: 2020/5/7
  Time: 23:38
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
                <label class="layui-form-label">用户id</label>
                <div class="layui-input-block">
                    <input type="text" name="altuserId"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">体检时间</label>
                <div class="layui-input-block">
                    <input type="text" name="altdata"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">收缩压</label>
                <div class="layui-input-block">
                    <input type="text" name="altsbp"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">舒张压</label>
                <div class="layui-input-block">
                    <input type="text" name="altdpb"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">体重指数</label>
                <div class="layui-input-block">
                    <input type="text" name="altbmi"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">腰臀比</label>
                <div class="layui-input-block">
                    <input type="text" name="altwhr"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">胆固醇</label>
                <div class="layui-input-block">
                    <input type="text" name="altbun"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">尿素</label>
                <div class="layui-input-block">
                    <input type="text" name="altua"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">尿酸</label>
                <div class="layui-input-block">
                    <input type="text" name="altcrea"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">肌酐</label>
                <div class="layui-input-block">
                    <input type="text" name="alttg"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">甘油三酯</label>
                <div class="layui-input-block">
                    <input type="text" name="altchol"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">葡萄糖</label>
                <div class="layui-input-block">
                    <input type="text" name="altglu"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">同型半胱氨酸</label>
                <div class="layui-input-block">
                    <input type="text" name="althcy"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">微量白蛋白</label>
                <div class="layui-input-block">
                    <input type="text" name="altmalb"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item" style="margin-top:40px">
                <div class="layui-input-block">
                    <button class="layui-btn  layui-btn-submit " lay-submit lay-filter="demo11">确认添加</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>

<%--添加信息时的弹层--%>
<div class="layui-row" id="popAddTest" style="display:none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" action="" style="margin-top:20px" >
            <div class="layui-form-item">
                <label class="layui-form-label">用户id</label>
                <div class="layui-input-block">
                    <input type="text" name="adduserId"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">体检时间</label>
                <div class="layui-input-block">
                    <input type="text" name="adddata"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">收缩压</label>
                <div class="layui-input-block">
                    <input type="text" name="addsbp"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">舒张压</label>
                <div class="layui-input-block">
                    <input type="text" name="adddpb"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">体重指数</label>
                <div class="layui-input-block">
                    <input type="text" name="addbmi"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">腰臀比</label>
                <div class="layui-input-block">
                    <input type="text" name="addwhr"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">胆固醇</label>
                <div class="layui-input-block">
                    <input type="text" name="addbun"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">尿素</label>
                <div class="layui-input-block">
                    <input type="text" name="addua"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">尿酸</label>
                <div class="layui-input-block">
                    <input type="text" name="addcrea"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">肌酐</label>
                <div class="layui-input-block">
                    <input type="text" name="addtg"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">甘油三酯</label>
                <div class="layui-input-block">
                    <input type="text" name="addchol"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">葡萄糖</label>
                <div class="layui-input-block">
                    <input type="text" name="addglu"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">同型半胱氨酸</label>
                <div class="layui-input-block">
                    <input type="text" name="addhcy"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">微量白蛋白</label>
                <div class="layui-input-block">
                    <input type="text" name="addmalb"  required  lay-verify="required" autocomplete="off" placeholder="" class="layui-input">
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
<%--        <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="update">编辑</button>--%>
    </div>
</script>

<script>
    function x(timestamp) {
        var d = new Date(timestamp * 1000);    //根据时间戳生成的时间对象
        var date = (d.getFullYear()) + "-" +
            (d.getMonth() + 1) + "-" +
            (d.getDate()) + " " +
            (d.getHours()) + ":" +
            (d.getMinutes()) + ":" +
            (d.getSeconds());
        return date;
    }
    function transformTime(timestamp = +new Date()) {
        if (timestamp) {
            var time = new Date(timestamp);
            var y = time.getFullYear();
            var M = time.getMonth() + 1;
            var d = time.getDate();

            return y + '-' + addZero(M) + '-' + addZero(d);
        } else {
            return '';
        }
    }
    function addZero(m) {
        return m < 10 ? '0' + m : m;
    }

    layui.use(['table', 'form', 'layer'], function(){
        var form = layui.form
            , table = layui.table
            , layer = layui.layer
            , $ = layui.jquery;

        //管理员数据表格方法渲染
        var tableIns = table.render({
            elem: '#demo'
            ,url: "<%=basePath%>/test/teststable"
            ,parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code":res.code, //解析接口状态
                    "msg":res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": res.data //解析数据列表
                };


            }
            ,page: true //开启分页
            ,cellMinWidth: 80
            ,cols: [[ //表头
                {field: 'testId', title: '体检id'}
                ,{field: 'userId', title: '用户id'}
                ,{field: 'data', title: '体检时间',
                    templet: function(d){
                        var d1 = new Date(d.data);    //根据时间戳生成的时间对象
                        var date = (d1.getFullYear()) + "-" +
                            (d1.getMonth() + 1) + "-" +
                            (d1.getDate());
                        return date;
                    }
                }
                ,{field: 'sbp', title: '收缩压(mmHg)'}
                ,{field: 'dpb', title: '舒张压(mmHg)'}
                ,{field: 'bmi', title: '体重指数'}
                ,{field: 'whr', title: '腰臀比'}
                ,{field: 'bun', title: '胆固醇(mmol/L)'}
                ,{field: 'ua', title: '尿素(mmol/L)'}
                ,{field: 'crea', title: '尿酸(umol/L)'}
                ,{field: 'tg', title: '肌酐(umol/L)'}
                ,{field: 'chol', title: '甘油三酯(mmol/L)'}
                ,{field: 'glu', title: '葡萄糖(mmol/L)'}
                ,{field: 'hcy', title: '同型半胱氨酸(umlo/L)'}
                ,{field: 'malb', title: '微量白蛋白(mL/g)'}
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
                    layer.msg('添加');
                    layer.open({
                        //layer提供了5种层类型。可传入的值有：0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
                        type: 1,
                        title: "添加用户体检信息",
                        area: ['550px', '600px'],
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
            if(layEvent === 'delete'){ //删除
                layer.confirm('真的删除该条体检记录么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    $.ajax({
                        url: "<%=basePath%>/test/del",
                        type: "POST",
                        data:{
                            "testId": data.testId
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
            }

        });

        table.on('checkbox(test)', function(obj){
            console.log(obj)
        });

        //监听弹出框表单提交，massage是修改界面的表单数据'submit(demo11),是修改按钮的绑定
        function setFormValue(obj,data){
        }


        form.on('submit(demoadd)', function(massage) {
            $.ajax({
                url:"<%=basePath%>/test/add",
                type:'POST',
                data:{
                    'userId':massage.field.adduserId,
                    'data':massage.field.adddata,
                    'sbp': massage.field.addsbp,
                    'dpb':massage.field.adddpb,
                    'bmi':massage.field.addbmi,
                    'whr':massage.field.addwhr,
                    'bun':massage.field.addbun,
                    'ua':massage.field.addua,
                    'crea':massage.field.addcrea,
                    'tg':massage.field.addtg,
                    'chol':massage.field.addchol,
                    'glu':massage.field.addglu,
                    'hcy':massage.field.addhcy,
                    'malb':massage.field.addmalb,
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
                                url:"<%=basePath%>/test/teststable"
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
