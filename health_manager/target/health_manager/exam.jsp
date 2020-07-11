<%--
  Created by IntelliJ IDEA.
  User: 吴珍缘
  Date: 2020/4/28
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<head>
    <meta charset="utf-8">
    <title>Layui</title>
    <%@ include file="/common.jsp" %>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${url}/lib/layui-v2.5.6/css/layui.css" media="all">

</head>
<body>
<table id="demo" class="layui-hide" lay-filter="test"></table>
<div id="line" style="width: 100%; height: 55%">
</div>

<script src="${url}/lib/layui-v2.5.6/layui.js" charset="utf-8"></script>
<script src="${url}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<script src="${url}/lib/echarts.min.js" charset="utf-8"></script>

<script type="text/javascript">
    var getLocalTime = function (nS) {
        var date = new Date(nS);
        var year = date.getFullYear();
        var month = date.getMonth()+1;
        var day = date.getDate();
        return year+"-"+month+"-"+day;
    }
    layui.use(['table','layer'], function(){
        var table = layui.table;
        layer = layui.layer;

        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 312
            ,url: "<%=basePath%>/test/tests"
            ,parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code":res.code, //解析接口状态
                    "msg":res.msg, //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": res.data //解析数据列表
                };

            }
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'data1', title: '体检时间', width:250,  fixed: 'left' ,sort:true}
                ,{field: 'sbp', title: '收缩压', width:100}
                ,{field: 'dpb', title: '舒张压', width:100}
                ,{field: 'bmi', title: '体重指数', width:100}
                ,{field: 'whr', title: '腰臀比', width: 100}
                ,{field: 'bun', title: '胆固醇', width: 100}
                ,{field: 'ua', title: '尿素', width: 100}
                ,{field: 'crea', title: '尿酸', width: 100}
                ,{field: 'tg', title: '肌酐', width: 100}
                ,{field: 'chol', title: '甘油三酯', width:100}
                ,{field: 'glu', title: '葡萄糖', width: 100}
                ,{field: 'hcy', title: '同型半胱氨酸', width: 130}
                ,{field: 'malb', title: '微量白蛋白', width: 124}
            ]]
        });
    });

    function drawLine(container) {
        var timearray = new Array();
        var higharray = new Array();
        var lowarray = new Array();
        $.ajax({
            url: "<%=basePath%>/test/t",
            type: "POST",
            data:{
                "userId": ${sessionScope.usersession.getUserId()}
            },
            success: function (res) {
                // var objectList = res.data;
                for(const vo of res){
                    timearray.push(vo.data1)
                    higharray.push(vo.sbp)
                    lowarray.push(vo.dpb)
                }
                var myChart = echarts.init(document.getElementById(container));
                option = {
                    title: {
                        text: '血压曲线走势图'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['高压', '低压']
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '5%',
                        containLabel: true
                    },
                    toolbox: {
                        feature: {
                            saveAsImage: {}
                        }
                    }
                    ,xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        data: timearray
                    }
                    ,yAxis: {
                        type: 'value'
                    },
                    series: [
                        {
                            name:'高压',
                            type:'line',
                            data: higharray

                        },
                        {
                            name:'低压',
                            type:'line',
                            data: lowarray
                        }
                    ]
                };
                myChart.setOption(option);

            }
        });
    }
    drawLine('line');


</script>

<c:if test="${empty sessionScope.usersession}">
    <script>
        alert("请先登录！");
        window.location = "login.jsp";
    </script>
</c:if>

</body>
</html>
