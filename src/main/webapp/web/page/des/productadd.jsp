<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<legend>添加信息</legend>
	<div>
		<form class="layui-form" action="" lay-filter="updateuser"
			onsubmit="return false">
			<div class="layui-form-item">
				<label class="layui-form-label">一级分类</label>
				<div class="layui-input-inline">
					<select id="jjj" name="parentcode"   lay-filter="add1" >
					</select>
 				</div>
 				<label class="layui-form-label">二级分类</label>
				<div class="layui-input-inline">
					<select id="lll" name="cate"  >
					</select>
 				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">名称：</label>
				<div class="layui-input-inline">
					<input type="text" name="name" autocomplete="off" value=""
						class="layui-input">
				</div>
				<label class="layui-form-label">编号：</label>
				<div class="layui-input-inline">
					<input type="text" name="code" autocomplete="off" value=""
						class="layui-input">
				</div>
			</div>
            <div class="layui-form-item">
				<label class="layui-form-label">单价：</label>
				<div class="layui-input-inline">
					<input type="text" name="price" autocomplete="off" value=""
						class="layui-input">
				</div>
				<label class="layui-form-label">库存：</label>
				<div class="layui-input-inline">
					<input type="text" name="amount" autocomplete="off" value=""
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">描述：</label>
				<div class="layui-input-inline">
					<input type="text" name="des" autocomplete="off" value=""
						class="layui-input">
				</div><label class="layui-form-label">状态：</label>
				<div class="layui-input-inline">
					<input type="text" name="stat" autocomplete="off" value=""
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
			    <label class="layui-form-label">  </label>
				<button class="layui-btn" name="anbd" lay-submit lay-filter="madd">添加</button>
				<button class="layui-btn" >重置</button>
			</div>
	    </form>
	</div>
<script type="text/javascript">
$(function(){
	   form.render("select")
})
$(function(){
	   $.ajax({
	   	   url:"/webm/goods/add.do",
		   type:"POST",
		   dataType:"json",
		   data:{parentcode:"type1"},
	       success:function(data){
	    	   var html = "<option value=''>请选择</option>"
	    	   $.each(data,function(i,dom){
	    		  html+= "<option value='"+dom.code+"'>"+dom.name+"</option>"
	    	   })
	    	   $("#jjj").html(html)
				  form.render("select")
	       }
	    })
   })
   form.on("select(add1)",function(data){
	   $("select[name='cate']").empty();
	   form.render('select');
	   var m = data.value
	   console.log(data.value)
	   $.ajax({
	   	   url:"/webm/goods/add.do",
		   type:"POST",
		   dataType:"json",
		   data:{parentcode:m},
	       success:function(data){
	    	   var html = ""
	    	   $.each(data,function(i,dom){
	    		  html+= "<option value='"+dom.name+"'>"+dom.name+"</option>"
	    	   })
	    	   $("#lll").html(html)
				  form.render("select")
	       }
	    })
   })
   form.on("submit(madd)",function(data){
	   $.ajax({
		   url:"/webm/product/insert.do",
		   type:"post",
		   data:data.field,
		   dataType:"text",
		   success:function(data){
			   alert("1111")
			   console.log(data)
			   if(data=="1"){
				   layer.msg("添加成功")
				   closeThis(300)
			   }
			   if(data=="2"){
				   layer.msg("添加失败已存在此编号不能重复添加")
			   }
		   }
	   })
   })
</script>
</body>
</html>