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
<legend>修改用户信息</legend>
	<div>
		<form class="layui-form" action="" lay-filter="updateuser"
			onsubmit="return false">
			<div class="layui-form-item">
				<label class="layui-form-label">账号：</label>
				<div class="layui-input-inline">
					<input type="text" name="account" readonly="readonly"
						autocomplete="off" class="layui-input" value="">  
<%-- 						${login.account} 对象。账号 --%>
 				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">用户名：</label>
				<div class="layui-input-inline">
					<input type="text" name="username" autocomplete="off" value=""
						class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码：</label>
				<div class="layui-input-inline">
					<input type="text" name="password" autocomplete="off" value=""
						class="layui-input">
				</div>
			</div>
			<div class="layui-input-inline">
				<input type="button" class="layui-btn" lay-submit lay-filter="uud"
					value="修改"> <input type="reset"
					class="layui-btn layui-btn-primary" value="重置">
			</div>
<!-- 			<input type="hidden" name="action" value="update"> -->
	    </form>
</div>
<script type="text/javascript">
  $(function(){
  var account = '<%= request.getParameter("code")%>'
	  $.ajax({
		  url:"/webm/user/select.do",
		  data:{account:account},
		  dataType:"json",
		  type:"post",
		  success:function(data){
             $.each(data,function(i,dom){
            	 form.val("updateuser",{
                    "password":dom.password,
  					"account":dom.account,
  					"username":dom.username
  				})
             })
            	
		  }
	  })
  })
  form.on("submit(uud)",function(data){
			$.ajax({
				url:"/webm/user/updateuser.do",
				data:data.field,
				dataType:"text",
				type:"POST",
				success:function(data){
					if(data=="1"){
						layer.msg("修改成功")
					    closeThis(300);
					}else{
						layer.msg("修改失败")
					}
				}
			})
		})
</script>
</body>
</html>