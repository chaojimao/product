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
  <legend>添加收货地址</legend>
	<div>
		<form class="layui-form" action="" lay-filter="updateuser"
			onsubmit="return false">
			<div class="layui-form-item">
				<label class="layui-form-label">账号：</label>
				<div class="layui-input-inline">
					<input type="text" name="account" autocomplete="off" value=""  readonly="readonly"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">收件人：</label>
				<div class="layui-input-inline">
					<input type="text" name="username" autocomplete="off" value="" 
						class="layui-input">
				</div>
			</div>
            <div class="layui-form-item">
				<label class="layui-form-label">电话号：</label>
				<div class="layui-input-inline">
					<input type="text" name="tel" autocomplete="off" value=""
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">省：</label>
				<div class="layui-input-inline">
					<select id="a1" name="addr1"   lay-filter="addr1" >
					</select>
 				</div>
 				<label class="layui-form-label">市：</label>
				<div class="layui-input-inline">
					<select  id="a2" name="addr2"   lay-filter="addr2" >
					</select>
 				</div>
 				<label class="layui-form-label">区：</label>
				<div class="layui-input-inline">
					<select id="a3" name="addr3"   lay-filter="addr3" >
					</select>
 				</div>
			</div>
			 <div class="layui-form-item">
				<label class="layui-form-label">地址：</label>
				<div class="layui-input-inline">
					<input type="text" name="addr4" autocomplete="off" value=""
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">	
    <div class="layui-input-block">
      <input type="radio" name="type1" value="默认" title="默认"/>
      <input type="radio" name="type1" value="不默认" title="不默认"/>
    </div>
			
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">  </label>
				<button class="layui-btn" name="anbd" lay-submit lay-filter="madd">添加</button>
				<button class="layui-btn" >重置</button>
			</div>
			<input type="hidden" name="action" value="add">
	    </form>
	</div>
<script type="text/javascript">
   $(function(){
	   form.render()
       var s = "${login.account}"
       $("input[name='account']").val(s)
   })
  
    $(function(){
	   $.ajax({
	   	   url:"/webm/dict/select.do",
		   type:"POST",
		   dataType:"json",
		   data:{parentcode:"ca"},
	       success:function(data){
	    	   var html = "<option value=''>请选择</option>"
	    	   $.each(data,function(i,dom){
	    		  html+= "<option value='"+dom.code+"'>"+dom.name+"</option>"
	    	   })
	    	   $("#a1").html(html)
				  form.render("select")
	       }
	    })
   })
   form.on("select(addr1)",function(data){
	   $("select[name='addr2']").empty();
	   $("select[name='addr3']").empty();
	   form.render('select');
	   var m = data.value
	   console.log(data.value)
	   $.ajax({
	   	   url:"/webm/dict/select.do",
		   type:"POST",
		   dataType:"json",
		   data:{parentcode:m},
	       success:function(data){
	    	   var html = ""
	    	   $.each(data,function(i,dom){
	    		  html+= "<option value='"+dom.code+"'>"+dom.name+"</option>"
	    	   })
	    	   $("#a2").html(html)
				  form.render("select")
	       }
	    })
   })
   form.on("select(addr2)",function(data){
	   $("select[name='addr3']").empty();
	   form.render('select');
	   var m = data.value
	   console.log(data.value)
	   $.ajax({
	   	   url:"/webm/dict/select.do",
		   type:"POST",
		   dataType:"json",
		   data:{parentcode:m},
	       success:function(data){
	    	   var html = ""
	    	   $.each(data,function(i,dom){
	    		  html+= "<option value='"+dom.code+"'>"+dom.name+"</option>"
	    	   })
	    	   $("#a3").html(html)
				  form.render("select")
	       }
	    })
   })
   form.on("submit(madd)",function(data){
	   $.ajax({
			  url:"/webm/addr/insert.do",
			  type:"POST",
			  data:data.field,
			  dataType:"text",
			  success:function(data){
				 if(data=="1"){
					 layer.msg('添加成功');
				     closeThis(300);
				 }
			  }
		  })
   })
</script>
</body>
</html>