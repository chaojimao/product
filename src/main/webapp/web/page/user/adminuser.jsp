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
<form class="layui-form" method='post' onsubmit='return false;'>
		<div class="layui-form-item">
			<label class="layui-form-label">账号</label>
			<div class="layui-input-block" style='padding-right: 600px;'>
				<input type="text" name="account" placeholder="请输入想查找的账号"
					autocomplete="off" class="layui-input">
			</div>
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-block" style='padding-right: 600px;'>
				<input type="text" name="username" placeholder="请输入想查找的姓名"
					autocomplete="off" class="layui-input">
				<button class="layui-btn" lay-submit lay-filter="add" name='add'
					id='add'>添加</button>
				<button class="layui-btn" lay-submit lay-filter="selectone"
					name='selectone'>查询</button>
			</div>
		</div>
		<table class="layui-table">
			<colgroup>
				<col width="150">
				<col width="200">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th>序号</th>
					<th>账号</th>
					<th>姓名</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id='tbody'>
			</tbody>
		</table>
		<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>
		<input type="hidden" name="action" value="list"> 
		<input type="hidden" name="pageIndex" value="1"> 
		<input	type="hidden" name="pageLimit" value="10">
	</form>
<script type="text/javascript">
form.on("submit(selectone)",function(data){
	  init(data);
})
function init(data){
	$.ajax({
		url:"/webm/user/usermessage.do",
		data:data.field,
		dataType:"json",
		type:"POST",
		success:function(data){
               var curr = $("input[name='pageIndex']").val()
               var limit = $("input[name='pageLimit']").val()
			    var html = ""
				$.each(data.list,function(i,dom){
					var code = dom.account
					var name = dom.username
					html+="<tr><td>"+(i+1+(curr-1)*limit)+"</td><td>"+code+"</td><td>"+name+"</td><td><button class='layui-btn' onclick='xg(\""+code+"\")'>修改</button><button class='layui-btn' onclick='delete1(\""+code+"\")'>删除</button></td></tr>"
				})
				$("#tbody").html(html)
                laypage.render({
	                   elem:'pageInfoUser',
	                   count:data.count,
	                   curr:curr,//当前页
	                   limit:limit,//每页显示的条数
	                   layout:['count','prev','page','next','limit','skip'],
	                   jump:function(obj,first){
	                	   var curr = $("input[name='pageIndex']").val(obj.curr)
	                       var limit = $("input[name='pageLimit']").val(obj.limit)
	                       if(!first){
	                    	   $("#selectone").click()
	                       }	
	                   }
               })
		  }
	})
}
//form.on("submit(selectone)",function(data){
//	console.log(111111111)
//	$.ajax({
//		url:"/dd/Chaojimao1?action=selectone",
//		data:data.field,
//		dataType:"json",
//		type:"POST",
//		success:function(data){
//			   if(data.xggg==0){
//                   location.href="/dd/web/jsp/usermessage.jsp"
//			   }
//			}
//	})
//})
function xg(b){
	layer.open({
		type:2,
		area:['800px','450px'],
		fixed:false,
		maxmin:true,
		content:
			"/webm/web/page/user/updateuser.jsp?code="+b,
		end: function() {
 			location.href="/webm/web/page/user/adminuser.jsp"
 			
		}
	})
}
function delete1(s){
	layer.confirm("是否删除",{icon:3,title:"提示"},function(index){
		$.ajax({
			url:"/webm/user/delete.do",
			data:{account:s},
			dataType:"json",
			type:"post",
			success:function(data){
				if(data=="1"){
					layer.msg("删除成功")
					seclick()
				}
				if(data=="2"){
					layer.msg("用户存在为完成订单，不能删除账号")
				}
			}
		})
	})
}
seclick();
function seclick(){
	$("button[name='selectone']").click()
}
</script>
</body>
</html>