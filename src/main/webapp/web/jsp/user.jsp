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
        <a href="">我的订单</a>
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

<div class="layui-container userpublic house-userPer">
  <div class="layui-row layui-col-space20">
    <p class="layui-hide-xs title">首页 &gt; <span>个人中心</span></p>
    <div class="layui-col-sm2">
      <ul class="user-list">
        <li class="active"><a href="/webm/web/jsp/user.jsp">个人中心</a></li>
        <li><a href="">消息中心</a></li>
        <li><a href="/webm/web/jsp/useradd.jsp">地址管理</a></li>
        <li><a href="/webm/web/jsp/usercol.jsp">我的收藏</a></li>
        <li><a href="">优惠券</a></li>
        <li><a href="">服务中心</a></li>
      </ul>
    </div>
    <div class="layui-col-sm10">
      <div class="user-person">
        <div class="person">
          <img src="/webm/web/common/static/img/person.png">
          <div class="name">
            <p id="username2"></p>
            <span><i>VIP2</i></span>
          </div>
        </div>
        <ul>
          <li>优惠券<span>10张</span></li>
          <li>礼品卡<span>1张</span></li>
          <li>积分<span>1000</span></li>
          <li>待发货<span>12个</span></li>
          <li>待收货<span>2个</span></li>
          <li>待评价<span>2个</span></li>
        </ul>
      </div> 
    </div>
    <div class="layui-col-sm10">
      <div class="layui-tab layui-tab-brief">
        <ul class="layui-tab-title">
          <li class="layui-this">全部订单</li>
          <li>等待发货</li>
          <li>已发货</li>
          <li>交易完成</li>
        </ul>
        <div class="layui-tab-content">
          <div class="layui-tab-item layui-show">
            <table class="layui-table" id="house-user-order" lay-filter="house-user-order" style="margin:0;width:994.69px">
                <colgroup>
                  <col width="10%">
                  <col width="25%">
                  <col width="20%">
                  <col width="20%">
                  <col width="20%">
               </colgroup>
    <thead>
      <tr>
        <th style="height:40px">订单信息</th>
        <th style="height:40px">用户名</th>
        <th style="height:40px">收货地址</th>
        <th style="height:40px">订单状态+订单时间</th>
        <th style="height:40px">订单操作</th>
      </tr> 
    </thead>
    <tbody id="zs"></tbody>
            </table>
          </div>
          <div class="layui-tab-item">
            
          </div>
        </div>
      </div>      
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
      var name = "${login.username}"
      var s = "${login.account}"
	  $(function(){
		 if(name==""||name==null){
			 $("#username").html("登陆")
		 }else{
			 $("#username").html(name)
			 $("#username2").html(name)
			 init()
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
        	$.ajax({
        		url:"/webm/order/select.do",
        		data:{account:s},
        		dataType:"json",
        		type:"post",
        		success:function(data){
        			console.log(data)
        			$.each(data,function(i,dom){
        				html+="<tr><td>"+dom.code+"</td><td>"+dom.username+"</td><td>"+dom.address+"</td><td>"+dom.stat+dom.time+"</td><td><a href='javascript:ck(\""+dom.code+"\")'>查看商品详情</a></td></tr>"
        			})
        			$("#zs").html(html)
        		}
        	})
    }
    function ck(s){
    	layer.open({
			type:2,
			area:['1000px','450px'],
			fixed:false,
			maxmin:true,
			content:
				"/webm/web/jsp/spxq.jsp?code="+s
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