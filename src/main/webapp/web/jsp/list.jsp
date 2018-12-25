<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/web/header.jsp"%>
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
      <a class="banner" href="/webm/web/jsp/index.jsp">
        <img src="/webm/web/common/static/img/banner.png" alt="家居商城">
      </a>
      <div class="layui-input-inline">
        <input type="text"  name="selectall" placeholder="搜索好物" class="layui-input">
<!--         <button class="layui-icon layui-icon-house-find"  name="select" onclick="select()"></button> -->
         <a href="javascript:select()" class="layui-icon layui-icon-house-find"></a>
      </div>
      <a class="shop" href="/webm/web/jsp/usershop.jsp"><i class="layui-icon layui-icon-house-shop"></i><span class="layui-badge">1</span></a>
    </div>
    <ul class="layui-nav close">
      <li class="layui-nav-item "><a href="/webm/web/jsp/index.jsp">首页</a></li>
      <li class="layui-nav-item  layui-this"><a href="/webm/web/jsp/list.jsp">居家用品</a></li>
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

<div class="layui-container house-list">
  <p class="classify"><a href="/webm/web/jsp/index.jsp">首页</a> &gt; <span>家居用品</span></p>
<!--   <div class="list-banner"></div> -->
  
  <div class="filter">
    <div><span>分类：</span><ul><li class="active">全部</li><li><a href="javascript:s1()">床品</a></li><li>灯具</li><li>布艺</li><li>收纳</li><li>小家具</li></ul></div>
    <div><span>季节：</span><ul><li class="active">全部</li><li>春</li><li>夏</li><li>秋</li><li>冬</li></ul></div>
    <div><span>排序：</span><ul><li class="active">默认</li><li>价格<i class="layui-icon layui-icon-house-up"></i><i class="layui-icon layui-icon-triangle-d"></i></li><li>上架时间</li></ul></div>
  </div>
<div id="shoplist" class="layui-row layui-col-space25">  
</div>
<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>
		<input type="hidden" name="pageIndex" value="1"> 
		<input	type="hidden" name="pageLimit" value="12">
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
$(function(){
	  var tt = "<%= request.getParameter("t")%>"
	  console.log(tt=="1")
	  if(tt=="1"){
		  aas()
	  }else{
		  select()
	  }
})
     var name = "${login.username}"
	  $(function(){
		 if(name==""||name==null){
			 $("#username").html("登陆")
		 }else{
			 $("#username").html(name)
		 }
	  })
	  function dl(){
		if(name==""||name==null){
			location.href="/webm/web/jsp/login.jsp"
		}else{
			
		}
	}
     
     
     
     function  aas(){
    	 var names = "<%= request.getParameter("names")%>"
   		  var curr = $("input[name='pageIndex']").val()
          var limit = $("input[name='pageLimit']").val()
 $.ajax({
	 url:"/webm/product/zhanshi.do",
	  data:{name:names,pageIndex:curr,pageLimit:limit},
	  dataType:"json",
	  type:"post",
	  success:function(data){
		  console.log(data)
		  var html = ""
		  $.each(data.list,function(i,dom){
			  html+="<div class='layui-col-xs6 layui-col-sm3'><div class='list-detail'><div class='img'><img src='/image/"+dom.url+"' style='width:480px;height:300px'></div><p class='title'><a href='javascript:xq(\""+dom.code+"\")'>"+dom.name+"</a></p><p><span class='price'>"+dom.price+"</span><span>1266</span>人付款</p></div></div>"
		 })
		 $("#shoplist").html(html)
		  laypage.render({
	                   elem:'pageInfoUser',
	                   count:data.count,
	                   curr:curr,//当前页
	                   limit:limit,//每页显示的条数
	                   limits:["12","24"],
	                   layout:['count','prev','page','next','limit','skip'],
	                   jump:function(obj,first){
	                	   var curr = $("input[name='pageIndex']").val(obj.curr)
	                       var limit = $("input[name='pageLimit']").val(obj.limit)
	                      // select()
	                       if(!first){
                               aas()
	                       }
	                   }
                })
	 }
})
     }
     
     
     
     
  function select(){
	 var m = $("input[name='selectall']").val();

			  var curr = $("input[name='pageIndex']").val()
              var limit = $("input[name='pageLimit']").val()
	 $.ajax({
		 url:"/webm/product/zhanshi.do",
		  data:{name:m,pageIndex:curr,pageLimit:limit},
		  dataType:"json",
		  type:"post",
		  success:function(data){
			  console.log(data)
			  var html = ""
			  $.each(data.list,function(i,dom){
				  html+="<div class='layui-col-xs6 layui-col-sm3'><div class='list-detail'><div class='img'><img src='/image/"+dom.url+"' style='width:480px;height:300px'></div><p class='title'><a href='javascript:xq(\""+dom.code+"\")'>"+dom.name+"</a></p><p><span class='price'>"+dom.price+"</span><span>1266</span>人付款</p></div></div>"
			 })
			 $("#shoplist").html(html)
			  laypage.render({
    	                   elem:'pageInfoUser',
    	                   count:data.count,
    	                   curr:curr,//当前页
    	                   limit:limit,//每页显示的条数
    	                   limits:[12,24],
    	                   layout:['count','prev','page','next','limit','skip'],
    	                   jump:function(obj,first){
    	                	   var curr = $("input[name='pageIndex']").val(obj.curr)
    	                       var limit = $("input[name='pageLimit']").val(obj.limit)
    	                      // select()
    	                       if(!first){
                                   select()
    	                       }
    	                   }
                    })
		 }
	})
  }
  function s1(){
	  $.ajax({
		  url:"/webm/product/select.do",
		  dataType:"json",
		  data:{cate:"被褥"},
		  type:"post",
		  success:function(data){
			  var html = ""
				  $.each(data,function(i,dom){
					  html+="<div class='layui-col-xs6 layui-col-sm3'><div class='list-detail'><div class='img'><img src='/image/"+dom.url+"' style='width:480px;height:300px'></div><p class='title'><a href='/webm/web/jsp/detail.jsp'>"+dom.name+"</a></p><p><span class='price'>"+dom.price+"</span><span>1266</span>人付款</p></div></div>"
				 })
				 $("#shoplist").html(html)
				 $("#pageInfoUser").html("")
		  }
	  })
  }
  function xq(b){
	  location.href="/webm/web/jsp/detail.jsp?code="+b
  }
</script>
</body>
</html>













