<%--
  Created by IntelliJ IDEA.
  User: 吴珍缘
  Date: 2020/4/28
  Time: 17:14
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
        <label class="layui-form-label">收缩压</label>
        <div class="layui-input-inline">
            <input type="text" name="bpHigh" required  lay-verify="required|number" placeholder="单位为毫米汞柱" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
            <label class="layui-form-label">舒张压</label>
            <div class="layui-input-inline">
                <input type="text" name="bpLow" required  lay-verify="required|number" placeholder="单位为毫米汞柱" autocomplete="off" class="layui-input">
            </div>
    </div>

    <div class="layui-form-item">
            <label class="layui-form-label">心率</label>
            <div class="layui-input-inline">
                <input type="text" name="bs" required  lay-verify="required|number" placeholder="单位为次/分钟" autocomplete="off" class="layui-input">
            </div>
        </div>

    <div class="layui-form-item">
        <label class="layui-form-label">高血压既往史</label>
        <div class="layui-input-block">
            <input type="radio" name="historyHypertension" value="1" title="有">
            <input type="radio" name="historyHypertension" value="0" title="无">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">高血压家族史</label>
        <div class="layui-input-block">
                <input type="radio" name="historyFamilyHypertension" value="1" title="有">
                <input type="radio" name="historyFamilyHypertension" value="0" title="无">
            </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">吸烟或饮酒</label>
        <div class="layui-input-block">
            <input type="radio" name="historySmoking" value="1" title="有">
            <input type="radio" name="historySmoking" value="0" title="无">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">体育锻炼</label>
        <div class="layui-input-block">
            <input type="radio" name="exerciseGroup" value="1" title="有">
            <input type="radio" name="exerciseGroup" value="0" title="无">

        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">年龄</label>
        <div class="layui-input-block">
            <input type="radio" name="ageGroup" value="0" title="0-20">
            <input type="radio" name="ageGroup" value="1" title="21-40">
            <input type="radio" name="ageGroup" value="2" title="41-60">
            <input type="radio" name="ageGroup" value="3" title="60以上" >
        </div>
    </div>

    <div class="layui-form-item form">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-fluid"  lay-submit lay-filter="formDemo">预测评估</button>
        </div>
    </div>


    <div class="layui-form-item">
            <label class="layui-form-label">您患高血压的概率为：</label>
            <div class="layui-input-inline">
                <input type="text" id="sum" required  autocomplete="off" class="layui-input">
            </div>

        <c:if test="${!empty result}">
            您患有高血压的可能性：${result}<br/>
            <c:if test="${result>90}">
                高血压预防建议：<br/>

            </c:if>
        </c:if>
    </div>



    <div id="xia">

        </div>

    </form>

    <script src="${url}/lib/layui-v2.5.6/layui.js" charset="utf-8"></script>
    <script src="${url}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
    <script>
    //Demo
    layui.use(['form','layer'] ,function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            $.ajax({
                url: "<%=basePath%>/sick/evaluate",
                type: "POST",
                data: {
                        "bpHigh": data.field.bpHigh,
                        "bpLow": data.field.bpLow,
                        "bs": data.field.bs,
                        "historyHypertension": data.field.historyHypertension,
                        "historyFamilyHypertension": data.field.historyFamilyHypertension,
                        "historySmoking": data.field.historySmoking,
                        "exerciseGroup": data.field.exerciseGroup,
                        "ageGroup": data.field.ageGroup
                }
                //,JSON.stringify(data)
                ,success: function (result) {
                    // if (data == "success"){
                    //     layer.msg('成功');
                    //     //window.location="user.jsp";
                    //     // todo：页面跳转
                    //
                    // }else{
                    //     layer.msg('错误');
                    // }
                    document.getElementById("sum").value = result.v;
                    if(result.tips){

                            layer.open({
                                type: 1
                                ,title: false //不显示标题栏
                                ,closeBtn: false
                                ,area: '300px;'
                                ,shade: 0.8
                                ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                                ,btn: ['我已了解']
                                ,btnAlign: 'c'
                                ,moveType: 1 //拖拽模式，0或者1
                                ,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">经过系统评估，您患高血压慢性病的可能性较大，在此我们为您提供一些建议：<br><br>1、不吸烟、少饮酒；<br><br>2、控制饮食、防止肥胖；<br><br>3、低盐饮食、多食蔬菜；<br><br>4、适度锻炼、睡眠充足；<br><br> 5、保持情绪稳定、乐观。</div>'
                                ,success: function(layero){
                                    var btn = layero.find('.layui-layer-btn');
                                    btn.find('.layui-layer-btn0').attr({
                                        target: '_blank'
                                    });
                                }
                            });























                    }
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
