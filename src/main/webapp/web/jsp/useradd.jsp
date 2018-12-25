<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="user">

<div class="house-header">
  <div class="layui-container">
    <div class="house-nav">
     <span class="layui-breadcrumb" lay-separator="|" style="visibility: visible;">
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
      <a class="banner" href="/webm/web/jsp/index.jsp">
        <img src="/webm/web/common/static/img/banner.png" alt="家居商城">
      </a>
      <div class="layui-input-inline">
        <input type="text" placeholder="搜索好物" class="layui-input"><i class="layui-icon layui-icon-house-find"></i>
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

<div class="layui-container userpublic useradd">
  <div class="layui-row layui-col-space20">
    <p class="layui-hide-xs title">首页 &gt; <span>个人中心</span></p>
    <div class="layui-col-sm2">
      <ul class="user-list">
        <li><a href="/webm/web/jsp/user.jsp">个人中心</a></li>
        <li><a href="">消息中心</a></li>
        <li class="active"><a href="useradd.html">地址管理</a></li>
        <li><a href="usercol.html">我的收藏</a></li>
        <li><a href="">优惠券</a></li>
        <li><a href="">服务中心</a></li>
      </ul>
    </div>
    <div class="layui-col-sm10">
      <table class="layui-table" id="user-address" lay-filter="user-address">
        <colgroup>
      <col width="5%">
      <col width="20%">
      <col width="20%">
      <col width="20%">
      <col>
    </colgroup>
    <thead>
      <tr>
        <th style="height:40px"></th>
        <th style="height:40px">收货人</th>
        <th style="height:40px">地址</th>
        <th style="height:40px">联系方式</th>
        <th style="height:40px">操作</th>
      </tr> 
    </thead>
    <tbody id="zs"></tbody>
      </table>
      <button class="layui-btn layui-btn-primary address-add" onclick="add()"><i class="layui-icon layui-icon-add-1">添加新的收货地址</i></button>
    </div>
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
  var s = "${login.account}"
  var name = "${login.username}"
  $(function(){
	 if(name==""){
		 $("#username").html("登陆")
	 }else{
		 select()
		 $("#username").html(name)
	 }
  })
  function dl(){
	if(name=""){
		loction.href="/webm/web/jsp/login.jsp"
	}else{
		
	}
}
  function select(){
	  $.ajax({
		  url:"/webm/addr/select.do",
		  data:{account:s},
		  dataType:"json",
		  type:"post",
		  success:function(data){
			  console.log(data)
			  var html=""
			  $.each(data,function(i,dom){
				 if(dom.type1=="默认"){
					 html+="<tr><td>"+dom.type1+"</td><td>"+dom.username+"</td><td>"+dom.address1+dom.address2+dom.address3+dom.addr4+"</td><td>"+dom.tel+"</td><td><button class='layui-btn' onclick='xg(\""+dom.id+"\")'>修改</button><button class='layui-btn' onclick='sc(\""+dom.id+"\")'>删除</button></td></tr>"
				 }else{
					 html+="<tr><td></td><td>"+dom.username+"</td><td>"+dom.address1+dom.address2+dom.address3+dom.addr4+"</td><td>"+dom.tel+"</td><td><button class='layui-btn' onclick='xg(\""+dom.id+"\")'>修改</button><button class='layui-btn' onclick='sc(\""+dom.id+"\")'>删除</button></td></tr>"
				 }
			  })
			  $("#zs").html(html)
		  }
	  })
  }
   function add(){
	   layer.open({
			type:2,
			area:['1000px','450px'],
			fixed:false,
			maxmin:true,
			content:
				"/webm/web/jsp/address.jsp",
			end: function() {
               select()
			}
		})
   }
   function xg(b){
	   layer.open({
			type:2,
			area:['1000px','450px'],
			fixed:false,
			maxmin:true,
			content:
				"/webm/web/jsp/addupdate.jsp?id="+b,
			end: function() {
              select()
			}
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