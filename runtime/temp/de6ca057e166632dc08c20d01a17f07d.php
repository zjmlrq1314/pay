<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:71:"D:\phpStudy\WWW\pay\public/../application/admin\view\index\welcome.html";i:1497579064;s:71:"D:\phpStudy\WWW\pay\public/../application/admin\view\template\base.html";i:1497336753;s:82:"D:\phpStudy\WWW\pay\public/../application/admin\view\template\javascript_vars.html";i:1497336753;}*/ ?>
﻿<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>我的桌面</title>
    <link rel="Bookmark" href="__ROOT__/favicon.ico" >
    <link rel="Shortcut Icon" href="__ROOT__/favicon.ico" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="__LIB__/html5.js"></script>
    <script type="text/javascript" src="__LIB__/respond.min.js"></script>
    <script type="text/javascript" src="__LIB__/PIE_IE678.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="__LIB__/Hui-iconfont/1.0.7/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="__LIB__/icheck/icheck.css"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/h-ui.admin/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="__STATIC__/css/app.css"/>
    <link rel="stylesheet" type="text/css" href="__LIB__/icheck/icheck.css"/>
    
    <!--[if IE 6]>
    <script type="text/javascript" src="__LIB__/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <!--定义JavaScript常量-->
<script>
    window.THINK_ROOT = '<?php echo \think\Request::instance()->root(); ?>';
    window.THINK_MODULE = '<?php echo \think\Url::build("/" . \think\Request::instance()->module(), "", false); ?>';
    window.THINK_CONTROLLER = '<?php echo \think\Url::build("___", "", false); ?>'.replace('/___', '');
</script>
</head>
<body>

<nav class="breadcrumb">
    <div id="nav-title"></div>
    <a class="btn btn-success radius r btn-refresh" style="line-height:1.6em;margin-top:3px" href="javascript:;" title="刷新"><i class="Hui-iconfont"></i></a>
</nav>


<div class="page-container">
    <h2><font style="margin-left: 440px; color: gray;">欢迎进入:&nbsp;<?php echo $info['realname']; ?> 管理专区</font></h2>
    <div id="main" style="width: 500px;height:400px; float: left; margin-top: 100px;"></div>
    <div id="main1" style="width: 800px;height:400px; float: left; margin-top: 100px;"></div>
</div>
<footer class="footer mt-20">
    <div class="container" style="clear: both;">
        <p></p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
        <p>
            感谢jQuery、layer、laypage、Validform、UEditor、My97DatePicker、iconfont、Datatables、WebUploaded、icheck、highcharts、bootstrap-Switch、H-ui、H-ui.admin<br>
            Copyright &copy;2016 <?php echo \think\Config::get('site.name'); ?> <?php echo \think\Config::get('site.version'); ?> All Rights Reserved.<br>
            本后台系统由<a href="http://www.h-ui.net/" target="_blank" rel="nofollow" title="H-ui前端框架">H-ui前端框架</a>提供前端技术支持</p>
    </div>
</footer>

<script type="text/javascript" src="__LIB__/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="__LIB__/layer/2.4/layer.js"></script>
<script type="text/javascript" src="__STATIC__/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="__STATIC__/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="__STATIC__/js/app.js"></script>
<script type="text/javascript" src="__LIB__/icheck/jquery.icheck.min.js"></script>

<script type="text/javascript" src="__LIB__/eCharts/echarts.min.js"></script>
<script>
    //代理商统计图
    var agentData = <?php echo $agentData; ?>;
    var legendData = <?php echo $agentLegendData; ?>;
    var myChart = echarts.init(document.getElementById('main'));
    var option = {
        title : {
            text: '代理商统计图',
            subtext: '占比图',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: legendData
        },
        series : [
            {
                name: '数量',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:agentData,
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    myChart.setOption(option);

    //商户显示图
    var userData = <?php echo $userData; ?>;
    var userLengendData = <?php echo $userLegendData; ?>;
    var myChart1 = echarts.init(document.getElementById('main1'));
    var option1 = {
        title : {
            text: '商户统计图',
            subtext: '占位图',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            x : 'center',
            y : 'bottom',
            data:userLengendData
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {
                    show: true,
                    type: ['pie', 'funnel']
                },
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series : [
            {
                name:'半径模式',
                type:'pie',
                radius : [20, 110],
                center : ['50%', '50%'],
                roseType : 'radius',
                data:userData
            },
        ]
    };

    myChart1.setOption(option1);
</script>

</body>
</html>