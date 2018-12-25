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
				<label class="layui-form-label">上级：</label>
				<div class="layui-input-inline">
					<select id="jjj" name="parentcode"   lay-filter="" >
					</select>
 				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">名称：</label>
				<div class="layui-input-inline">
					<input type="text" name="name" autocomplete="off" value=""
						class="layui-input">
				</div>
			</div>
            <div class="layui-form-item">
				<label class="layui-form-label">编号：</label>
				<div class="layui-input-inline">
					<input type="text" name="code" autocomplete="off" value=""
						class="layui-input">
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
<script>
  $(function(){
	  $.ajax({
		  url:"/dd/Chaojimao3",
		  type:"POST",
		  data:{action:"selectadd"},
		  dataType:"json",
		  success:function(data){
			  var html = "<option value=''>无上级</option>"
			  $.each(data,function(i,dom){
				  html+="<option value='"+dom.code+"'>"+dom.name+"</option>"
			  })
			  $("#jjj").html(html)
			  form.render("select")
		  }
	  })
  })
  form.on("submit(madd)",function(data){
	  console.log(data.field)
	  $.ajax({
		  url:"/dd/Chaojimao3",
		  type:"POST",
		  data:data.field,
		  dataType:"json",
		  success:function(data){
			  if(data.yes==0){
				  layer.msg("修改成功")
				    closeThis(300);
			  }else{
				  layer.msg("编号已存在，请重新添加")
			  }
		  }
	  })
  })
</script>
</body>
</html>