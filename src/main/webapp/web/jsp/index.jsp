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
        <a href="login.html"><i class="layui-icon layui-icon-username"></i></a>
        <a href="usershop.html"><i class="layui-icon layui-icon-house-shop"></i></a>
      </span>
    </div> 
    <div class="house-banner layui-form">
      <a class="banner" href="index.html">
        <img src="/webm/web/common//static/img/banner.png" alt="家居商城">
      </a>
      <div class="layui-input-inline">
        <input type="text" name="selectall" placeholder="搜索好物" class="layui-input"><a href="javascript:select()" class="layui-icon layui-icon-house-find"></a>
      </div>
      <a class="shop" href="/webm/web/jsp/usershop.jsp"><i class="layui-icon layui-icon-house-shop"></i><span class="layui-badge">1</span></a>
    </div>
    <ul class="layui-nav close">
      <li class="layui-nav-item layui-this"><a href="/webm/web/jsp/index.jsp">首页</a></li>
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
<div class="layui-fulid">
  <div class="layui-carousel house-carousel" id="house-carousel" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 500px;">
    <div carousel-item>
      <div class="layui-this"><img src="/webm/web/common/static/img/banner.jpg"></div>
      <div class=""><img src="/webm/web/common/static/img/paging_banner.jpg"></div>
    </div>
    </div>
   </div>
 <div class="layui-carousel-ind"><ul><li class="layui-this"></li><li class=""></li></ul></div><button class="layui-icon layui-carousel-arrow" lay-type="sub"></button><button class="layui-icon layui-carousel-arrow" lay-type="add"></button></div>
<div class="layui-container">
   <ul class="layui-nav" style="background-color: gray" id="shang">
</ul>
</div>

<div class="layui-container">
  <div class="hot-cate">
    <p class="house-title">热门分类</p>
    <div class="layui-row">
      <div class="layui-col-xs4 cateFir cate">
        <a href="/webm/web/jsp/list.jsp">
          <img src="/webm/web/common//static/img/home_img1.png"/>
          <div>
            <p>家居用品</p>
            <span>18元起</span>
          </div>
        </a>
      </div>
      <div class="layui-col-xs4 cateSec cate">
        <a href="/webm/web/jsp/list.jsp">
          <img src="/webm/web/common//static/img/home_img2.png">
          <div>
            <p>小家电</p>
            <span>59元起</span>
          </div>
        </a>  
      </div>
      <div class="layui-col-xs4 cateThir cate">
        <a href="/webm/web/jsp/list.jsp">
          <img src="/webm/web/common//static/img/home_img3.png">
          <div>
            <p>洗护用品</p>
            <span>18元起</span>
          </div>
        </a>
      </div>
    </div>
  </div>
  <div class="hot-sell">
    <p class="house-title">热销推荐<a href="">更多优品  &gt;</a></p>
    <div class="layui-row layui-col-space20">
      <a href="/webm/web/jsp/detail.jsp" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img4.jpg"></div>
        <p>一盏好看的台灯</p>
        <p class="price">￥200</p>
      </a>
      <a href="/webm/web/jsp/detail.jsp" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img5.jpg"></div>
        <p>时尚瓷碗7件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img6.jpg"></div>
        <p>智能电吹风</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img7.jpg"></div>
        <p>一盏好看的台灯</p>
        <p class="price">￥200</p>
      </a>
    </div>
  </div>
  <div class="hot-sell">
    <p class="house-title">新品推荐<a href="">更多优品  &gt;</a></p>
    <div class="layui-row layui-col-space20">
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img8.jpg"></div>
        <p>蒂芙尼蓝化妆刷</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img9.jpg"></div>
        <p>玻璃洗漱三件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img10.jpg"></div>
        <p>清洁力强劲浴球</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img11.jpg"></div>
        <p>瘦脸仪</p>
        <p class="price">￥200</p>
      </a>
    </div>
  </div>
</div>

<div class="layui-fulid" id="goodsAll"></div>

<div class="layui-container">
  <div class="hot-sell">
    <p class="house-title">猜您喜欢<a href="">更多新品  &gt;</a></p>
    <div class="layui-row layui-col-space20">
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img12.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img13.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img14.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img15.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img12.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img13.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img14.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img15.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img12.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img13.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img14.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img15.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img12.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img13.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img14.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
      <a href="detail.html" class="layui-col-xs3 text">
        <div><img src="/webm/web/common//static/img/home_img15.jpg"></div>
        <p>森系小清新四件套</p>
        <p class="price">￥200</p>
      </a>
    </div>
  </div>
</div>

<div class="layui-fulid" id="champ">
  <div class="layui-row">
    <a href="/webm/web/jsp/list.jsp" class="layui-col-xs3">
      <img src="/webm/web/common//static/img/home_img16.jpg">
    </a>
    <a href="/webm/web/jsp/list.jsp" class="layui-col-xs6">
      <img src="/webm/web/common//static/img/home_img17.jpg">
    </a>
    <a href="/webm/web/jsp/list.jsp" class="layui-col-xs3">
      <img src="/webm/web/common//static/img/home_img20.jpg">
    </a>
    <a href="/webm/web/jsp/list.jsp" class="layui-col-xs3">
      <img src="/webm/web/common//static/img/home_img18.jpg">
    </a>
    <a href="/webm/web/jsp/list.jsp" class="layui-col-xs3">
      <img src="/webm/web/common//static/img/home_img19.jpg">
    </a>
    <a href="/webm/web/jsp/list.jsp" class="layui-col-xs3">
      <img src="/webm/web/common//static/img/home_img21.jpg">
    </a>
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
<script src="/webm/web/common/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
layui.use('element', function(){
	  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
	  
	  //监听导航点击
	  element.on('nav(demo)', function(elem){
	    //console.log(elem)
	    layer.msg(elem.text());
	  });
	});
  layui.config({
    base: '/webm/web/common/static/js/' 
  }).use('house'); 
  var s = "${login.username}"
   $(function(){
	   init()
	   if(s==""){
		   $("#username").html("登陆")
	   }else{
		   $("#username").html(s)
	   }
   })
   function init(){
	   $.ajax({
		   url:"/webm/goods/add.do",
		   dataType:"json",
		   data:{parentcode:"type1"},
		   type:"post",
		   success:function(data){
			   var html="<li class='layui-nav-item'><a>家居用品</a></li>"
			   $.each(data,function(i,dom){
				   html+="</li><li class='layui-nav-item'><a href='javascript:;'>"+dom.name+"</a><dl class='layui-nav-child' id='dll"+dom.code+"'></dl></li>"
				   $.ajax({
					   url:"/webm/goods/add.do",
					   dataType:"json",
					   data:{parentcode:dom.code},
					   type:"post",
					   success:function(data){
						   var html2=""
						   $.each(data,function(i,dom){
							   html2+="<dd><a href='/webm/web/jsp/detail2.jsp?code="+dom.name+"'>"+dom.name+"</a></dd>"
						   })
						   $("#dll"+dom.code).html(html2)
					   }
				   })
			   })
			   $("#shang").html(html)
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
	   if(s==""){
		   location.href="/webm/web/jsp/login.jsp"
	   }else{
		   
	   }
   }
   function select(){
	   var names = $("input[name='selectall']").val()
	   var t =1
	   location.href="/webm/web/jsp/list.jsp?names="+names+"&t="+t
   }
</script>
</body>
</html>