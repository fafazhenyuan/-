<%--
  Created by IntelliJ IDEA.
  User: 吴珍缘
  Date: 2020/5/7
  Time: 23:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <%@ include file="/common.jsp" %>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${url}/lib/layui-v2.5.6/css/layui.css" media="all">
    <style type="text/css">

        .layui-form .layui-form-label {
            width: 100px;
        }
    </style>
</head>
<body>

<form class="layui-form layui-form-pane" lay-filter="logForm">
    <div class="layui-form-item" style="margin-top: 20px"> <!-- 注意：这一层元素并不是必须的 -->
        <label class="layui-form-label">当前日期</label>
        <input type="text" class="layui-input-inline" style="height: 38px" id="test1" name="date" width="300" readonly>
    </div>

    <div class="layui-form-item">
        <textarea id="demo" style="display: none;"></textarea>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">睡眠时间</label>
        <div class="layui-input-block">
            <input type="text" name="sleephour" lay-verify="required|number" autocomplete="off" placeholder="必须输入数字，单位为小时" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">心情</label>
        <div class="layui-input-block">
            <select name="mood" lay-verify="required">
                <option value=""></option>
                <option value="很好">很好</option>
                <option value="好">好</option>
                <option value="一般">一般</option>
                <option value="差">差</option>
                <option value="很差">很差</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">体重</label>
        <div class="layui-input-block">
            <input type="text" name="weight" lay-verify="required|number" autocomplete="off"placeholder="必须输入数字，单位为公斤" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">吸烟数量</label>
        <div class="layui-input-block">
            <input type="text" name="cigrette"  lay-verify="required|number" autocomplete="off" placeholder="必须输入数字" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">压力等级</label>
        <div class="layui-input-block">
            <select name="pressure" lay-verify="required">
                <option value=""></option>
                <option value="低">低</option>
                <option value="中">中</option>
                <option value="高">高</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">高压</label>
        <div class="layui-input-block">
            <input type="text" name="bphigh"   autocomplete="off" placeholder="必须输入数字，单位为毫米汞柱" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">低压</label>
        <div class="layui-input-block">
            <input type="text" name="bplow"   autocomplete="off" placeholder="必须输入数字，单位为毫米汞柱" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">心率</label>
        <div class="layui-input-block">
            <input type="text" name="bs"   autocomplete="off" placeholder="必须输入数字，单位为次/分钟" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>


<script src="${url}/lib/layui-v2.5.6/layui.js" charset="utf-8"></script>
<script src="${url}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>

<script>
    layui.use(['form','layedit','layer'], function(){
        var layform = layui.form,
            layedit = layui.layedit,
            layer = layui.layer,
            $=layui.jquery,
            date = formatDate(new Date());

        layform.val("logForm", {
            date: date
        })

        var data1 = layform.val("formTest");
        console.log(data1)
        var index = layedit.build('demo',{
            tool: ['strong' //加粗
                ,'italic' //斜体
                ,'underline' //下划线
                ,'del' //删除线
                ,'|' //分割线
                ,'left' //左对齐
                ,'center' //居中对齐
                ,'right' //右对齐
                ,'face' //表情
            ]
        }); //建立编辑器

        var active = {
            content:function () {
                alert(layedit.getContent(index));
            }
        };

        layform.on('submit(demo1)', function (data) {
            //表单数据formData
            var formData = data.field;
            var editText = layedit.getContent(index);
            var userId='${sessionScope.usersession.getUserId()}';
            $.ajax({
                url: "<%=basePath%>/log/addlog",
                type: "POST",
                data:{
                    "logData": date,
                    "text": editText,
                    "sleephour": formData.sleephour,
                    "mood":formData.mood,
                    "cigrette": formData.cigrette,
                    "weight": formData.weight,
                    "pressure": formData.pressure,
                    "bphigh": formData.bphigh,
                    "bplow": formData.bplow,
                    "bs": formData.bs,
                    "userId":userId
                },
                success: function (d) {
                    console.log(d)
                    if (d){
                        layer.msg('日志信息记录成功')
                    }else{
                        layer.msg('不予许重复记录健康日志');
                    }
                }
            });
            return false;
        });
        // 日期格式化
        function formatDate(date) {
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            m = m < 10 ? '0' + m : m;
            var d = date.getDate();
            d = d < 10 ? ('0' + d) : d;
            return y + '-' + m + '-' + d;
        };
    });
</script>




<c:if test="${empty sessionScope.usersession}">
    <script>
        alert("请先登录！");
        window.location = "login.jsp";
    </script>
</c:if>

</body>
</html>
