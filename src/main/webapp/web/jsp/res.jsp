<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<meta charset="UTF-8">
<title>注册</title>
</head>
<body>
	<fieldset class="layui-elem-field" style="margin:200px">
	<legend>注册</legend>
	<div ><!-- class="layui-field-box" style="padding-right:100px;padding-left:50px;" -->
		<form class="layui-form layui-form-pane"  onsubmit="return false;" method="post">
			  <div class="layui-form-item">
                <label class="layui-form-label">账号：</label>
                 <div class="layui-input-block">
                    <input type="text" name="account" lay-verify="required"  autocomplete="off" placeholder="必填" class="layui-input">
                 </div>
              </div>
			 <div class="layui-form-item">
             <label class="layui-form-label">密码：</label>
                <div class="layui-input-block">
                  <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
             </div>
			 <div class="layui-form-item">
             <label class="layui-form-label">用戶名：</label>
                <div class="layui-input-block">
                  <input type="text" name="username" lay-verify="title" autocomplete="off" placeholder="必填" class="layui-input">
                </div>
             </div>
			<div class="layui-form-pane">
				
				<div class="layui-input-inline">
						<input type="button" class="layui-btn"  lay-submit lay-filter="reg"
							value="注册"> <input type="reset"
							class="layui-btn layui-btn-primary" value="重置">
					</div>
						<input  type="button" class="layui-btn" onclick="dl()" value="返回登陆">
						<input type="button" value="首页" class="layui-btn"
						onclick="sy()" />
			</div>
			<input type="hidden" name="action" value="res"/>
		</form>
	</div>
</fieldset>
<script type="text/javascript">
form.on('submit(reg)',function(data){
	$.ajax({
		url:"/webm/user/res.do",
		data:data.field,
		dataType:"text",
		type:"post",
		success:function(data){
			if(data==0){
				layer.msg("注册成功", {icon: 6});
			}else{
				layer.msg("账号已存在请重新注册");
			}
		}
	})
})
function dl(){
	location.href="/webm/web/jsp/login.jsp"
}
function sy(){
	   location.href="/webm/web/jsp/index.jsp"
}
</script>
</body>
</html>