<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<meta charset="UTF-8">
<title>主页</title>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">用户管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="22.jpeg"  class="layui-nav-img"><span id="userName"></span>
        </a>
        <dl class="layui-nav-child">
          <dd><a href="javascript:updateuser();">修改信息</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="javascript:goLogout();">注销</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll"><!-- 滚动条 -->
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">用户管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:xinxi();">用户信息维护</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">商品管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:fenlei();">商品分类维护</a></dd>
            <dd><a href="javascript:goods();">商品信息维护</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">订单管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:dingdan();">订单信息维护</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div id="xin"  class="layui-body">
    <!-- 内容主体区域 -->
<!--     <iframe name="rightframe" width="99%" height="97%" src="./NewFile21.html"></iframe> -->
  </div>
  
  <div class="layui-footer">
    底部固定区域
    © layui.com - 底部固定区域
  </div>
</div>
<script type="text/javascript" src="/webm/web/common/layui/layui.all.js"></script>
<script type="text/javascript">
  var name = "${login1.username}"
  $(function(){
	  if(name==""){
		  $("#userName").html()
	  }else{
		  $("#userName").html(name)
	  }
  })
   function xinxi(){
	   $("#xin").html("<iframe name='rightframe' width='99%' height='97%' src='/webm/web/page/user/adminuser.jsp'></iframe>")
   }
   function fenlei(){
	   $("#xin").html("<iframe name='rightframe' width='99%' height='97%' src='/webm/web/page/des/goodsmessage.jsp'></iframe>")
   }
   function goods(){
	   $("#xin").html("<iframe name='rightframe' width='99%' height='97%' src='/webm/web/page/des/productmessage.jsp'></iframe>")
   }
   function dingdan(){
	   $("#xin").html("<iframe name='rightframe' width='99%' height='97%' src='/webm/web/page/order/order.jsp'></iframe>")
   }
   function goLogout(){
	   location.href="/webm/admin/zhuxiao.do"
   }
</script>
</body>
</html>