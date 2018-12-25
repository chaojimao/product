<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="house-header">
  <div class="layui-container">
    <div class="house-nav">
     <span class="layui-breadcrumb" lay-separator="|"style="visibility: visible;">
        <a href="/webm/web/jsp/login.jsp">登录</a>
        <span lay-separator>|</span>
        <a href="javascript:zhx()">注销</a>
        <span lay-separator>|</span>
        <a href="/webm/web/jsp/user.jsp">我的订单</a>
        <span lay-separator>|</span>
        <a href="">在线客服</a>
      </span>
      <span class="layui-breadcrumb house-breadcrumb-icon" lay-separator=" ">
        <a id="search"><i class="layui-icon layui-icon-house-find"></i></a>
        <a href="/webm/web/jsp/login.jsp"><i class="layui-icon layui-icon-username"></i></a>
        <a href="/webm/web/jsp/usershop.jsp"><i class="layui-icon layui-icon-house-shop"></i></a>
      </span>
    </div> 
    <div class="house-banner layui-form">
      <a class="banner" href="index.html">
        <img src="/webm/web/common/static/img/banner.png" alt="家居商城">
      </a>
      <div class="layui-input-inline">
        <input type="text" placeholder="搜索好物" class="layui-input"><i class="layui-icon layui-icon-house-find"></i>
      </div>
      <a class="shop" href="/webm/web/jsp/usershop.jsp"><i class="layui-icon layui-icon-house-shop"></i><span class="layui-badge">1</span></a>
    </div>
    <ul class="layui-nav close">
      <li class="layui-nav-item"><a href="index.html">首页</a></li>
      <li class="layui-nav-item"><a href="/webm/web/jsp/list.jsp">居家用品</a></li>
      <li class="layui-nav-item"><a href="/webm/web/jsp/list.jsp">小家电</a></li>
      <li class="layui-nav-item"><a href="/webm/web/jsp/list.jsp">洗护</a></li>
      <li class="layui-nav-item"><a href="/webm/web/jsp/list.jsp">厨具</a></li>
      <li class="layui-nav-item"><a href="/webm/web/jsp/list.jsp">日用品</a></li>
    </ul>
    <button id="switch">
      <span></span><span class="second"></span><span class="third"></span>
    </button>
  </div>
</div>

<div class="layui-container house-usershop">
  <div style="width:400px;height:30px"><p style="width:400px;height:30px;font-size: 50px">确认订单</p></div>
	  <table class="layui-table" id="house-usershop-table" lay-filter="house-usershop-table" style="margin:0;width:1200px" >
	    <colgroup>
	      <col width="25%">
	      <col width="25%">
	      <col width="25%">
	      <col width="25%">	
	    </colgroup>
	    <thead>
	      <tr>
	        <th style="height:40px;width:300px">商品</th>
	        <th style="height:40px;width:300px">单价</th>
	        <th style="height:40p;width:300px">数量</th>
	        <th style="height:40px;width:300px">小计</th>
	      </tr> 
	    </thead>
	    <tbody id="zs"></tbody>
	    <tbody><td>收货信息：</td><td colspan="3" ><select name="address" style="width:900px;height:58px;font-size: 20px;"></select></td></tbody>
	  </table>
  <div class="house-usershop-table-num layui-form" style="margin:0">
    <input type="checkbox" lay-skin="primary">共<span class="numal" id="yx"></span>件
    <div id="toCope">
      <p>合计：<big >￥</big><big id="yf">0</big></p>
    </div>
    <button class="layui-btn" onclick="xd()">下单</button>
  </div>
</div>

<div class="house-footer">
  <div class="layui-container">
    <div class="intro">
      <span class="first"><i class="layui-icon layui-icon-house-shield"></i>7天无理由退换货</span>
      <span class="second"><i class="layui-icon layui-icon-house-car"></i>满99元全场包邮</span>
      <span class="third"><i class="layui-icon layui-icon-house-diamond"></i>100%品质保证</span>
      <span class="last"><i class="layui-icon layui-icon-house-tel"></i>客服400-2888-966</span>
    </div>
    <div class="about">
      <span class="layui-breadcrumb" lay-separator="|">
        <a href="about.html">关于我们</a>
        <a href="about.html">帮助中心</a>
        <a href="about.html">售后服务</a>
        <a href="about.html">配送服务</a>
        <a href="about.html">关于货源</a>
      </span>
      <p>家居商城版权所有 &copy; 2012-2020</p>
    </div>   
  </div>
</div>
<script type="text/javascript">
  var t = "<%= request.getParameter("ids")%>"
  console.log(t)
  tt=t.split(",")
  var s = "${login.account}"
  var name = "${login.username}"
  $(function(){
	 if(name==""){
		 $("#username").html("登陆")
	 }else{
		 init()
		 init2()
		 $("#username").html(name)
	 }
  })
  function dl(){
	if(name=""){
		loction.href="/webm/web/jsp/login.jsp"
	}else{
		
	}
}
  function init(){
	  var html=""
	  var amount = 0
	  var price = 0
	$.each(tt,function(i,dom){
		var id = dom
		$.ajax({
			url:"/webm/cart/select.do",
			dataType:"json",
			data:{account:s,id:id},
			type:"post",
			success:function(data){
				$.each(data,function(i,dom){
					html+="<tr><td><img src='/image/"+dom.url+"'>"+dom.name+"</td><td><p><span>￥</span><span id='price"+dom.id+"'>"+dom.price+"</span></p></td><td>"+dom.amount+"</td><td><p><span>￥</span><span id='xj"+dom.id+"'>"+parseInt(dom.price)*parseInt(dom.amount)+"</span></p></td></tr>"
				    amount+=dom.amount
				    price+=dom.price*dom.amount
				})				
			  $("#zs").html(html)
			  $("#yx").html(amount)
			  $("#yf").html(price)
			}
		})	
	})
  }
  function init2(){
	  $.ajax({
		  url:"/webm/addr/select.do",
		  dataType:"json",
		  data:{account:s},
		  type:"post",
		  success:function(data){
			  var html=""
			  $.each(data,function(i,dom){
				  if(dom.type1=="默认"){
					  html+="<option selected value='"+dom.id+"'><p>用户名:</p>"+dom.username+"&nbsp&nbsp&nbsp&nbsp&nbsp<p>电话:</p>"+dom.tel+"&nbsp&nbsp&nbsp&nbsp&nbsp<p>地址:</p>"+dom.address1+dom.address2+dom.address3+dom.addr4+"</option>"
				  }else{
					  html+="<option value='"+dom.id+"'><p>用户名:</p>"+dom.username+"&nbsp&nbsp&nbsp&nbsp&nbsp<p>电话:</p>"+dom.tel+"&nbsp&nbsp&nbsp&nbsp&nbsp<p>地址:</p>"+dom.address1+dom.address2+dom.address3+dom.addr4+"</option>"
				  }
			  })
			 $("select[name='address']").html(html) 
		  }
	  })
  }
  function xd(){
	     var sss = $("select[name='address']").val();
    	 layer.confirm("确认是否支付",{icon:3,title:"提示"},function(index){
         $.ajax({
        	 url:"/webm/cart/delete2.do",
        	 traditional:true,
        	 data:{id:tt,stat:"已下单",m:sss},
        	 dataType:"text",
        	 type:"post",
        	 success:function(data){
        		 if(data=="1"){
        			 location.href="/webm/web/jsp/user.jsp"
        		 }
        	 }
         })
layer.close(index);
     })   
  }
  function zhx(){
	  layer.confirm('确认是否注销?', {icon: 3, title:'提示'}, function(index){
		  //do something
		  location.href="/webm/user/zhuxiao.do"
		});
  }
  function dl(){
	  location.href="/webm/web/jsp/login.jsp"
  }
</script>
</body>
</html>