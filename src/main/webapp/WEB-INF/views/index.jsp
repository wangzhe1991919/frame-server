<%--
  Created by IntelliJ IDEA.
  User: wangzhe1991919
  Date: 2018/8/23
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <title>test</title>
</head>
    <body class="layui-layout-body">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <div class="layui-logo">layui 后台布局</div>
            <!-- 头部区域（可配合layui已有的水平导航） -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item"><a href="">控制台</a></li>
                <li class="layui-nav-item">
                    <a href="javascript:;">其它系统</a>
                    <dl class="layui-nav-child">
                        <dd><a href="">邮件管理</a></dd>
                        <dd><a href="">消息管理</a></dd>
                        <dd><a href="">授权管理</a></dd>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                    <a href="javascript:;">
                        <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                        贤心
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="">基本资料</a></dd>
                        <dd><a href="">安全设置</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">退了</a></li>
            </ul>
        </div>

        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree"  lay-filter="left_menu">
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="javascript:;">生成器</a>
                        <dl class="layui-nav-child">
                            <%--<dd><a href="javascript:;" url="sqlGenerator">SQL生成器</a></dd>--%>
                            <dd><a href="http://localhost:8080/sqlGenerator" target="mainIframe">SQL生成器</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>


    </div>

        <div class="layui-body">
            <iframe id="mainIframe" name="mainIframe" src=""></iframe>
        </div>

        <div class="layui-tab" lay-filter="demo" lay-allowclose="true">
            <ul class="layui-tab-title"></ul>
            <div class="layui-tab-content"></div>
        </div>

        <div class="layui-footer">
            <!-- 底部固定区域 -->
            © layui.com - 底部固定区域
        </div>
    </div>
    <script src="../../static/layui/layui.js"></script>
    <script>


        //JavaScript代码区域
        layui.use(['element','layer'], function(){
            var $ = jQuery = layui.jquery;
            var element = layui.element;
            //监听导航点击
            element.on('nav(left_menu)', function(elem){
                //console.log(elem)
                layer.msg(elem.text());
                //activeTab.init(elem.test,elem.url,elem.id);
            });


            FrameWH();

            function FrameWH() {
                var headerHeight = $(".layui-header").height();
                var h = $(window).height() - headerHeight - 5;

                $("#mainIframe").css({"height":h+"px","margin-top":headerHeight  + "px","width":"100%"});
            }
        });

    </script>
    </body>
</html>