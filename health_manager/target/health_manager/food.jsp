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
<!DOCTYPE html>
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
        .form{
            margin-top: 30px;
            margin-left: 20px;
            margin-right: 200px;
        }
        .layui-form .layui-form-label {
            width: 200px;
        }
    </style>
</head>
<body>

    <form class="layui-form layui-form-pane form">
        <div class="layui-form-item">
            <label class="layui-form-label">体重（公斤）</label>
            <div class="layui-input-inline">
                <input type="text" name="weight" required  lay-verify="required|number" value=""  placeholder="请填写体重" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block" id="sexradio">
                <input type="radio" name="sex" value="0" title="男">
                <input type="radio" name="sex" value="1" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">年龄</label>
            <div class="layui-input-block" id="ageradio">
                <input type="radio" name="age" value="0" title="30岁以下">
                <input type="radio" name="age" value="1" title="31-60岁">
                <input type="radio" name="age" value="2" title="60岁以上">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">活动情况</label>
            <div class="layui-input-block" id="exradio">
                <input type="radio" name="ex" value="0" title="极轻-卧床全天">
                <input type="radio" name="ex" value="1" title="轻-多坐或缓步">
                <input type="radio" name="ex" value="2" title="正常-一般活动度">
                <input type="radio" name="ex" value="3" title="重-活动量大">
            </div>
        </div>
        <div class="layui-form-item">
            <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="cal">计算</button>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">热量目标值</label>
            <div class="layui-input-inline" >
                <input type="text" id="heat" class="layui-input" placeholder="大卡">
            </div>
        </div>
    </form>


    <table class="layui-table" style="margin: 20px">
        <colgroup>
            <col width="300">
            <col width="300">
            <col width="300px">
        </colgroup>
        <thead>
            <tr>
                <th>早餐推荐</th>
                <th>午餐推荐</th>
                <th>晚餐推荐</th>
            </tr>
        </thead>
        <tbody>
            <tr style="height: 50px">
                <td id="zao"></td>
                <td id="wu"></td>
                <td id="wan"></td>
            </tr>
        </tbody>
    </table>
<script src="${url}/lib/layui-v2.5.6/layui.js" charset="utf-8"></script>
<script src="${url}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>

<script>
    //Demo
    layui.use(['table','form'], function(){
        var form = layui.form;

        //监听提交
        form.on('submit(cal)', function(data){

            var sex = $('#sexradio input[name="sex"]:checked ').val();
            var age = $('#ageradio input[name="age"]:checked ').val();
            var ex = $('#exradio input[name="ex"]:checked ').val();

            $.ajax({
                url: "<%=basePath%>/food/cal",
                type: "POST",
                data: {
                    "sex":data.field.sex,
                    "age":data.field.age,
                    "ex":data.field.ex,
                    "weight":data.field.weight
                }
                ,success: function (res) {
                    var h = res.heat;
                    var zao = '';
                    var wu = '';
                    var wan = '';
                    for(const item of res.breakfast){
                        zao += item.foodName+"  ";
                    }
                    for(const item of res.lunch){
                        wu += item.foodName+"  ";
                    }
                    for(const item of res.dinner){
                       wan += item.foodName+"  ";
                    }
                    document.getElementById("heat").value = h;
                    document.getElementById("zao").innerHTML = zao;
                    document.getElementById("wu").innerHTML = wu;
                    document.getElementById("wan").innerHTML = wan;
                }
            })

            return false;
        });
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
