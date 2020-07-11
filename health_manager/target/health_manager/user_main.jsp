<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <%@ include file="/common.jsp" %>
    <title>Layui - 经典模块化前端 UI 框架</title>
    <meta name="keywords" content="layui,ui,ui框架,前端框架,JS组件">
    <meta name="description" content="layui 是一款采用自身模块规范编写的前端 UI 框架，遵循原生 HTML/CSS/JS 的书写与组织形式，门槛极低，拿来即用。其外在极简，却又不失饱满的内在，体积轻盈，组件丰盈，从核心代码到 API 的每一处细节都经过精心雕琢，非常适合界面的快速开发。">
    <meta name="renderer" content="webkit">

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="${url}/lib/layui-v2.5.6/css/layui.css" media="all">
    <style>
        .ima{

            background-size:cover;
        }
    </style>
</head>
<body class="ima" background="images/img-df0120d1f7b2d3beb1ffec2844283581.png "   id="LAY_home" style="background-color: #eee;" data-date="5-27">

<script src="${url}/lib/layui-v2.5.6/layui.js" charset="utf-8"></script>
<script src="${url}/lib/jquery-3.4.1/jquery-3.4.1.min.js" charset="utf-8"></script>
<![endif]-->
<div>

    <div>
        <div >
            <i class="layui-icon" style="color: #fff; color: rgba(255,255,255,.7);">&#xe62e;</i>
        </div>
        <div >
            <p class="web-font-desc">经典模块化前端框架</p>
            <cite>由职业前端倾情打造，面向全层次的前后端开发者，低门槛开箱即用的前端 UI 解决方案</cite>
        </div>
        <div class="site-download">
            <a href="//res.layui.com/static/download/layui/layui-v2.5.6.zip?v=2" class="layui-inline site-down" target="_blank">
                <cite class="layui-icon">&#xe601;</cite>
                立即下载
            </a>
        </div>
        <div class="site-version">
            <span>当前版本：<cite class="site-showv">…</cite></span>
            <span><a href="/doc/base/changelog.html" rel="nofollow" target="_blank">更新日志</a></span>
            <span>下载量：<em class="site-showdowns">…</em></span>
        </div>
        <div class="site-banner-other">
            <a href="https://github.com/sentsin/layui/" target="_blank" class="site-star">
                <i class="layui-icon">&#xe658;</i>
                Star <cite id="getStars"></cite>
            </a>
            <a href="https://github.com/sentsin/layui/network/members" target="_blank" rel="nofollow" class="site-fork">
                <i class="layui-icon">&#xe62e;</i>
                Fork
            </a>
            <a href="https://gitee.com/sentsin/layui" target="_blank" rel="nofollow" class="site-fork">
                码云
            </a>
        </div>
    </div>
</div>
<div class="layui-main">


    <ul class="site-idea">
        <li>
            <fieldset class="layui-elem-field layui-field-title">
                <legend>返璞归真</legend>
                <p>身处在前端社区的繁荣之下，我们都在有意或无意地追逐。而 layui 偏偏回望当初，奔赴在返璞归真的漫漫征途，自信并勇敢着，追寻于原生态的书写指令，试图以最简单的方式诠释高效。</p>
            </fieldset>
        </li>
        <li>
            <fieldset class="layui-elem-field layui-field-title">
                <legend>双面体验</legend>
                <p>拥有双面的不仅是人生，还有 layui。一面极简，一面丰盈。极简是视觉所见的外在，是开发所念的简易。丰盈是倾情雕琢的内在，是信手拈来的承诺。一切本应如此，简而全，双重体验。</p>
            </fieldset>
        </li>
        <li>
            <fieldset class="layui-elem-field layui-field-title">
                <legend>星辰大海</legend>
                <p>如果眼下还是一团零星之火，那运筹帷幄之后，迎面东风，就是一场烈焰燎原吧，那必定会是一番尽情的燃烧。待，秋风萧瑟时，散作满天星辰，你看那四季轮回<!--海天相接-->，正是 layui 不灭的执念。</p>
            </fieldset>
        </li>
    </ul>
</div>
<div class="layui-footer footer footer-index">
    <div class="layui-main">
        <p>&copy; 2020 <a href="/">layui.com</a> MIT license</p>
        <p>
            <a href="http://fly.layui.com/case/2020/" target="_blank">案例</a>
            <a href="http://fly.layui.com/jie/3147/" target="_blank">支持</a>
            <!--<a href="javascript:;" site-event="contactInfo">联系</a>-->
            <a href="https://github.com/sentsin/layui/" target="_blank" rel="nofollow">GitHub</a>
            <a href="https://gitee.com/sentsin/layui" target="_blank" rel="nofollow">码云</a>
            <a href="http://fly.layui.com/jie/2461/" target="_blank" class="layui-hide-xs">公众号</a>
            <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">赣ICP备13006272号-2</a>
        </p>
        <div class="site-union">
            <p class="site-union-desc">
        <span>
          感谢以下平台提供云加速支持
        </span>
            </p>
            <p>
                <a href="https://console.upyun.com/register/?invite=SJ0wu6g2-" target="_blank" rel="nofollow" sponsor="upyun">
                    <img src="//res.layui.com/static/images/other/upyun.png?t=1">
                </a>
                <a href="https://www.maoyuncloud.com/?from=layui" target="_blank" rel="nofollow" sponsor="maoyun">
                    <img src="//cdn.layui.com/upload/2019_5/168_1559291577683_9348.png">
                </a>
            </p>
        </div>
    </div>
</div>
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<div class="site-tree-mobile layui-hide">
    <i class="layui-icon">&#xe602;</i>
</div>
<div class="site-mobile-shade"></div>
<script src="//res.layui.com/layui/dist/layui.js?t=1586046995308" charset="utf-8"></script>
<script>
    window.global = {
        pageType: 'index'
        ,preview: function(){
            var preview = document.getElementById('LAY_preview');
            return preview ? preview.innerHTML : '';
        }()
    };
    layui.config({
        base: '//res.layui.com/static/lay/modules/layui/'
        ,version: '1586046995308'
    }).use('global');
</script>

<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?d214947968792b839fd669a4decaaffc";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>

</body>
</html>
