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
        <a href="javascript:dl()" id="username"></a>
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
        <input type="text" name="selectall" placeholder="搜索好物" class="layui-input"><a href="javascript:select()" class="layui-icon layui-icon-house-find"></a>
      </div>
      <a class="shop" href="/webm/web/jsp/usershop.jsp"><i class="layui-icon layui-icon-house-shop"></i><span class="layui-badge">1</span></a>
    </div>
    <ul class="layui-nav close">
      <li class="layui-nav-item"><a href="/webm/web/jsp/index.jsp">首页</a></li>
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

  <table class="layui-table" id="house-usershop-table" lay-filter="house-usershop-table" style="margin:0">
    <colgroup>
      <col width="10%">
      <col width="25%">
      <col width="20%">
      <col width="20%">
      <col width="20%">
      <col>
    </colgroup>
    <thead>
      <tr>
        <th style="height:40px"><input type="checkbox" name="choose" onclick="javascript:qx()">全选</th>
        <th style="height:40px">商品</th>
        <th style="height:40px">单价</th>
        <th style="height:40px">数量</th>
        <th style="height:40px">小计</th>
        <th style="height:40px">操作</th>
      </tr> 
    </thead>
    <tbody id="zs"></tbody>
  </table>
  <div class="house-usershop-table-num layui-form" style="margin:0">
    <input type="checkbox" lay-skin="primary">已选<span class="numal" id="yx"></span>种
    <a id="batchDel" onclick="javascript:pl()">批量删除</a>
    <div id="toCope">
      <p>应付：<big >￥</big><big id="yf">0</big></p>
    </div>
    <button class="layui-btn" onclick="jiesuan()">结算</button>
  </div>
  <p>猜您喜欢</p>
  <ul class="house-usershop-like"> 
    <li><a href="detail.html">
      <div><img src="/webm/web/common/static/img/paging_img5.jpg"></div>
      <p>可爱小瓷杯子</p>
      <p class="price">￥200</p>
    </a></li>
    <li><a href="detail.html">
      <div><img src="/webm/web/common/static/img/paging_img6.jpg"></div>
      <p>陶瓷面不粘锅</p>
      <p class="price">￥200</p>
    </a></li>
    <li><a href="detail.html">
      <div><img src="/webm/web/common/static/img/paging_img5.jpg"></div>
      <p>可爱小瓷杯子</p>
      <p class="price">￥200</p>
    </a></li>
    <li><a href="detail.html">
      <div><img src="/webm/web/common/static/img/paging_img6.jpg"></div>
      <p>陶瓷面不粘锅</p>
      <p class="price">￥200</p>
    </a></li>
    <li><a href="detail.html">
      <div><img src="/webm/web/common/static/img/paging_img5.jpg"></div>
      <p>可爱小瓷杯子</p>
      <p class="price">￥200</p>
    </a></li>
  </ul>
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
var s = "${login.account}"
var name = "${login.username}"
  $(function(){
	 if(name==""||name==null){
		 $("#username").html("登陆")
	 }else{
		 init()
		 $("#username").html(name)
	 }
	 yx()
  })
  function dl(){
	if(name=""){
		loction.href="/webm/web/jsp/login.jsp"
	}else{
		
	}
}
  function init(){
	  $.ajax({
		  url:"/webm/cart/select.do",
	      dataType:"json",
	      data:{account:s},
	      type:"post",
	      success:function(data){
	    	  var html = ""
	    	  console.log(data)
	    	  $.each(data,function(i,dom){
	    		  html+="<tr><td><input type='checkbox' name='choose1"+dom.id+"' value='"+dom.id+"' onclick='javascript:dx(\""+dom.id+"\")'></td><td><img src='/image/"+dom.url+"'>"+dom.name+"</td><td><p><span>￥</span><span id='price"+dom.id+"'>"+dom.price+"</span></p></td><td><div class='numVal' style='width:110px'> <button class='layui-btn layui-btn-primary sup' onclick='sup(\""+dom.id+"\")'>-</button><input type='text' name='amountt"+dom.id+"' class='layui-input' value='"+dom.amount+"'><button class='layui-btn layui-btn-primary sub' onclick='sub(\""+dom.id+"\")'>+</button></div></td><td><p><span>￥</span><span id='xj"+dom.id+"'>"+parseInt(dom.price)*parseInt(dom.amount)+"</span></p></td><td><a href='javascript:sc(\""+dom.id+"\")'>删除</a></td></tr>"
	    	  })
	    	  $("#zs").html(html)
	      }
	  })
  }
  function sup(b){
	  var amount = $("input[name='amountt"+b+"']").val()
	  var price = parseInt($("#price"+b).html())
	  if(parseInt(amount)>0){
		  var s = parseInt(amount)-1
		  $.ajax({
			  url:"/webm/cart/update.do",
			  dataType:"text",
			  data:{id:b,amount:s},
			  type:"post",
			  success:function(data){
				  if(data=="1"){
					  $("input[name='amountt"+b+"']").val(s)
					  $("#xj"+b).html(s*price.toFixed(2))
					  hj()
				  }
			  }
		  })
	  }
  }
  function sub(c){
	  var amount = $("input[name='amountt"+c+"']").val()
	  var price = parseInt($("#price"+c).html())
	  var s = parseInt(amount)+1
	  $.ajax({
		  url:"/webm/cart/update.do",
		  dataType:"text",
		  data:{id:c,amount:s},
		  type:"post",
		  success:function(data){
			  if(data=="1"){
				  $("input[name='amountt"+c+"']").val(s)
				  $("#xj"+c).html(s*price.toFixed(2))
				  hj()
			  }
		  }
	  })

  }
  function sc(b){
	  $.ajax({
		  url:"/webm/cart/delete.do",
		  dataType:"text",
		  data:{id:b},
		  type:"post",
		  success:function(data){
			  if(data=="1"){
				  layer.msg("删除成功")
				  init()
			  }
		  }
	  })
  }
  function qx(){
	  if($("input[name='choose']").prop("checked")){
		  $("input[name^='choose1']").prop("checked","checked")
		  yx()
		  hj()
	  }else{
		  $("input[name^='choose1']").prop("checked","")
		  yx()
		  hj()
	  }
  }  
  function yx(){
	  var a = $("input[name^='choose1']:checked").length
	  $("#yx").html(a)
  }
  function dx(b){
	  if($("input[name='choose1"+b+"']").prop("checked")){
		  yx()
		  hj()
	  }else{
		  yx()
		  hj()
	  }
  }
  function pl(){
	  var arr = new Array();
	  $("input[name^='choose1']:checked").each(function(a,dom){
		  arr.push(dom.value);
	  })
	  for(var i = 0;i<arr.length;i++){
		  sc(arr[i]);
	  }
	  yx()
  }
  function hj(){
	  var arr = new Array();
	  $("input[name^='choose1']:checked").each(function(a,dom){
		  arr.push(dom.value);
	  })
	  var hj = 0;
	  for(var i = 0;i<arr.length;i++){
		 hj += parseInt($("#xj"+arr[i]).html())
	  }

	  $("#yf").html(hj)
  }
  function jiesuan(){
	  var ids = []
	  $("input[name^='choose1']:checked").each(function(a,dom){
		  ids.push(dom.value)
	  })
	  if(ids.length==0){
		  layer.msg("请选择至少一件商品")
		  return
	  }
	  location.href="/webm/web/jsp/confirm.jsp?ids="+ids
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
  function select(){
	   var names = $("input[name='selectall']").val()
	   var t =1
	   location.href="/webm/web/jsp/list.jsp?names="+names+"&t="+t
  }
</script>
</body>
</html>






