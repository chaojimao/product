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
				<label class="layui-form-label">编号：</label>
				<div class="layui-input-inline">
					<input type="text" name="code" autocomplete="off"  readonly="readonly"
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">商品：</label>
				<div class="layui-input-inline">
					<select id="jjj" name="code2" lay-filter="sss" >
					</select>
 				</div>
			</div>
            <div class="layui-form-item">
				<label class="layui-form-label">数量：</label>
				<div class="layui-input-inline">
					<input type="text" name="amount" autocomplete="off" value=""
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">金额：</label>
				<div class="layui-input-inline">
					<input type="text" name="price" autocomplete="off" value=""
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
   var code = "<%= request.getParameter("code")%>"
   $(function(){
	   $("input[name='code']").val(code)
	   $.ajax({
		   url:"/webm/product/select.do",
		   data:{code:""},
		   dataType:"json",
		   type:"post",
		   success:function(data){
			   var html =""
			   $.each(data,function(i,dom){
				   var code2 = dom.code
				   html+= "<option value='"+code2+"'>"+dom.name+"</option>"
			   })
			   $("#jjj").html(html)
			   form.render("select")
		   }
	   })
   })
    form.on("select(sss)",function(data){
	   var m = data.value
	   console.log(data.value)
	   $.ajax({
	   	   url:"/webm/product/select.do",
		   type:"POST",
		   dataType:"json",
		   data:{code:m},
	       success:function(data){
	    	   $.each(data,function(i,dom){
	    		  $("input[name='price']").val(dom.price)
	    	   })
	       }
	    })
   })
   form.on("submit(madd)",function(data){
	   console.log(data.field)
	   $.ajax({
		   url:"/webm/ddgoods/add.do",
		   data:data.field,
		   dataType:"text",
		   type:"post",
		   success:function(data){
			   if(data=="1"){
				   layer.msg("添加成功")
				   closeThis(300)
			   }
		   }
	   })
   })
</script>
</body>
</html>