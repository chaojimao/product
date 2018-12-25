<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/web/header.jsp"%>
<title>Insert title here</title>
</head>
<body>
	<fieldset class="layui-elem-field" style="margin: 200px;">
		<legend>登录</legend>
		<div class='layui-field-box' style='padding:100px'>
			<form class="layui-form layui-form-pane" method="post" onsubmit="return false">
				<div class="layui-form-item">
					<label class="layui-form-label">账号</label>
					<div class="layui-input-inline">
						<input type="text" name="account" required lay-verify="required"
							placeholder="请输入账号" autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-inline">
						<input type="password" name="password" required
							lay-verify="required" placeholder="请输入密码" autocomplete="off"
							class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label"><img src="/webm/Chaojimao2" width="100%" height="100%" onclick="this.src='/webm/Chaojimao2?'+Math.random();"></label>
					<div class="layui-input-inline">
					    <input type="text" name="code" required lay-verify="required" placeholder="验证码"  autocomplete="off" class="layui-input">
                        
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-inline">
						<input class="layui-btn" type="button" lay-submit
							lay-filter="login" value="登录"> <input type="reset"
							class="layui-btn layui-btn-primary" value="重置">
					</div>
					<input type="button" value="返回注册" class="layui-btn"
						onclick="goJspReg()" />
				</div>
			</form>
		</div>
	</fieldset>
<script type="text/javascript">
  form.on("submit(login)",function(data){
	  $.ajax({
		  url:"/webm/admin/login.do",
		  data:data.field,
		  type:"post",
		  dataType:"text",
		  success:function(data){
			   if(data=="1"){
				   layer.msg("登陆成功");
				   location.href="/webm/web/jsp/adminlist.jsp"
			   }
			   if(data=="2"){
				   layer.msg("登陆失败请检查账号密码是否正确", {icon: 6});
			   }
			   if(data=="3"){
				   layer.msg("登陆失败请检查验证码是否正确", {icon: 6});
			   }
		  }
	  })
  })
</script>
</body>
</html>