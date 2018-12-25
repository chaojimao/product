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
      <a class="banner" href="/webm/web/jsp/index.jsp">
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

<div class="layui-container house-detail">
  <p class="title"><a href="/webm/web/jsp/index.jsp">首页</a> &gt; <a href="/webm/web/jsp/list.jsp">家居用品</a> &gt; <span>产品详情</span></p>
  <div class="layui-row price">
    <div class="layui-col-sm6">
      <div class="intro-img" id="zt"></div>
      <ul class="thumb" id="ft">
<!--         <li><img src="/webm/web/common/static/img/goods_img2.jpg"></li> -->
<!--         <li><img src="/webm/web/common/static/img/goods_img3.jpg"></li> -->
<!--         <li><img src="/webm/web/common/static/img/goods_img4.jpg"></li> -->
<!--         <li><img src="/webm/web/common/static/img/goods_img5.jpg"></li> -->
      </ul>
    </div>
    <div class="layui-col-sm6 shopChoose">
      <div class="title"><p id="goodsname"></p>好评率  <span>90%</span></div>
      <p id="price"></p>
      <dl id="amount"></dl>
      <dl><dt>颜色</dt><dd>白色</dd><dd class="active">灰色</dd><dd>黑色</dd></dl>
      <dl><dt>尺寸</dt><dd>1.2米</dd><dd class="active">0.5米</dd></dl>
      <div class="number layui-form">
        <label>数量</label>
        <div class="layui-input-inline btn-input">
          <button class="layui-btn layui-btn-primary sup">-</button>
          <input type="text" class="layui-input" name="amount">
          <button class="layui-btn layui-btn-primary sub">+</button>
        </div>
        <p class="inputTips">已超出库存数量！</p>
      </div>
      <div class="shopBtn">
        <button class="layui-btn layui-btn-primary sale">立即购买</button>
        <button class="layui-btn shop" onclick="cart()"><i class="layui-icon layui-icon-house-shop"></i>加入购物车</button>
        <button class="layui-btn layui-btn-primary collect"><i class="layui-icon layui-icon-rate" id="collect"></i>收藏</button>
      </div>
    </div>
  </div>
  <div class="layui-row layui-col-space30">
    <div class="layui-col-sm8 detailTab">
      <div class="layui-tab layui-tab-brief">
        <ul class="layui-tab-title">
          <li class="layui-this">详情</li>
          <li>评论 <span>(120)</span></li>
        </ul>
        <div class="layui-tab-content">
          <div class="layui-tab-item layui-show">
            <img src="/webm/web/common/static/img/goods_img3.jpg">
            <img src="/webm/web/common/static/img/goods_img4.jpg">
            <img src="/webm/web/common/static/img/goods_img5.jpg">
          </div>
          <div class="layui-tab-item">
            <div class="comment">
              <ul>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
                <li>
                  <div class="img"><img src="/webm/web/common/static/img/person.png"></div>
                  <p class="txt">质量还可以！纯棉的，盖着挺舒服的，对皮肤也好。</p>
                  <p class="time">2018年05月02日 11:20</p>
                </li>
              </ul>
              <div id="detailList"></div>
              </div>
          </div>
        </div>
      </div>  
    </div>
    <div class="layui-col-sm4 detailCom">
      <p class="title">热销推荐</p>
      <ul class="detailCom-content hot-sell"> 
        <li><a class="text">
          <div><img src="/webm/web/common/static/img/goods_img6.jpg"></div>
          <p>森系小清新四件套</p>
          <p class="price">￥200</p>
        </a></li>
        <li><a class="text">
          <div><img src="/webm/web/common/static/img/goods_img7.jpg"></div>
          <p>森系小清新四件套</p>
          <p class="price">￥200</p>
        </a></li>
        <li><a class="text">
          <div><img src="/webm/web/common/static/img/goods_img8.jpg"></div>
          <p>森系小清新四件套</p>
          <p class="price">￥200</p>
        </a></li>
        <li><a class="text">
          <div><img src="/webm/web/common/static/img/goods_img9.jpg"></div>
          <p>森系小清新四件套</p>
          <p class="price">￥200</p>
        </a></li>
        <li><a class="text">
          <div><img src="/webm/web/common/static/img/goods_img6.jpg"></div>
          <p>森系小清新四件套</p>
          <p class="price">￥200</p>
        </a></li>
      </ul>
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
<script src="/webm/web/common/layui/layui.js"></script>
<script type="text/javascript">
  var account = "${login.account}"
  var code = "<%= request.getParameter("code")%>"
  layui.config({
    base: '/webm/web/common/static/js/' 
  }).use('house'); 
	var name = "${login.username}"
	  $(function(){
		 if(name==""){
			 $("#username").html("登陆")
		 }else{
			 $("#username").html(name)
		 }
	  })
	  function dl(){
		if(name=""){
			loction.href="/webm/web/jsp/login.jsp"
		}else{
			
		}
	}
  $(function(){
	  $.ajax({
		  url:"/webm/pic/select.do",
		  dataType:"json",
		  data:{code:code},
		  type:"post",
		  success:function(data){
			  var html = ""
			  var html2 = ""
			  $.each(data,function(i,dom){
				  if(dom.type=="1"){
					  html+="<img src='/image/"+dom.url+"'>"
				  }
				  if(dom.type=="2"){
					  html2+="<li><img src='/image/"+dom.url+"'></li>"
				  }
			  })
			  $("#zt").html(html)
			  $("#ft").html(html2)
		  }
	  })
  })
  $(function(){
	  $.ajax({
		  url:"/webm/product/select.do",
		  dataType:"json",
		  data:{code:code},
		  type:"post",
		  success:function(data){
			  var html = ""
			  var html2 = ""
			  var html3 =""
			  $.each(data,function(i,dom){
                  html+="<span class='layui-badge'>新品</span>"+dom.name+""
                  html2+="<span>￥<big><b>"+dom.price+"</b></big></span>原价￥<big><del>399</del></big>"
                  html3+="<dt>数量</dt><dd>"+dom.amount+"</dd>"
			  })
			  $("#goodsname").html(html)
			  $("#price").html(html2)
			  $("#amount").html(html3)
		  }
	  })
  })
  function cart(){
	  var amount = $("input[name='amount']").val()
	  if(account==""||account==null){
		  layer.msg("登陆后才可添加购物车")
	  }else{
		  $.ajax({
			  url:"/webm/cart/insert.do",
			  dataType:"json",
			  data:{code:code,amount:amount,account:account},
			  type:"post",
			  success:function(data){
				  if(data=="1"){
					  location.href="/webm/web/jsp/usershop.jsp"
				  }else{
					  lay.msg("添加购物车失败")
				  }
			  }
		  })
	  }
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