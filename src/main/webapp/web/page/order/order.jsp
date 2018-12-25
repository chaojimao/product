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
			<label class="layui-form-label">用户名</label>
			<div class="layui-input-inline">
				<input type="text" name="username" placeholder="请输入想查找的用户"
					autocomplete="off" class="layui-input">
				
			</div>
			<label class="layui-form-label">地址</label>
			<div class="layui-input-inline">
				<input type="text" name="address" placeholder="请输入想查的地址"
					autocomplete="off" class="layui-input">
				
			</div>
			<label class="layui-form-label">编号</label>
			<div class="layui-input-inline">
				<input type="text" name="code" placeholder="请输入想查找的编号"
					autocomplete="off" class="layui-input">
				
			</div>
			<div class="layui-input-inline">
			<button class="layui-btn" lay-submit lay-filter="selectone" id="selectone"
					name='select'>查询</button>
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
					<th>编号</th>
					<th>用户</th>
					<th>地址</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id='tbody'></tbody>
		</table>
		<div id="pageInfoUser" style="text-align: right; padding-right: 30px"></div>
		<input type="hidden" name="action" value="list"> 
		<input type="hidden" name="pageIndex" value="1"> 
		<input	type="hidden" name="pageLimit" value="10">
	</form>
<script type="text/javascript">
	 $(function(){
		 $("#selectone").click()
	 })
    form.on("submit(selectone)",function(data){
    	$.ajax({
			url:"/webm/order/page.do",
			data:data.field,
			dataType:"json",
			type:"POST",
			success:function(data){
                    var curr = $("input[name='pageIndex']").val()
                    var limit = $("input[name='pageLimit']").val()
				    var html = ""
					$.each(data.list,function(i,dom){
						var code = dom.code
						var username = dom.username
						var address = dom.address
						var stat = dom.stat
						html+="<tr><td>"+(i+1+(curr-1)*limit)+"</td><td>"+code+"</td><td>"+username+"</td><td>"+address+"</td><td>"+stat+dom.time+"</td><td><button class='layui-btn' onclick='xg(\""+code+"\")'>修改</button><button class='layui-btn' onclick='delete1(\""+code+"\")'>删除</button><button class='layui-btn' onclick='dd(\""+code+"\")'>订单商品</button></td></tr>"
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
    })   
	 function xg(b){
		 layer.open({
	        	type : 2,
	     		area : [ '800px', '450px' ],
	     		fixed : false, // 不固定
	     		maxmin : true,
	     		content : "/webm/web/page/order/orderupdate.jsp?code="+b,
	     		end:function(){
	     			location.href="/webm/web/page/order/order.jsp"
	     		}
	         })
	 }
	 function delete1(c){
		 layer.confirm("是否删除",{icon:3,title:"提示"},function(index){
			 $.ajax({
		    	 url:"/webm/order/delete.do",
		    	 data:{code:c},
		    	 dateType:"text",
		    	 type:"post",
		    	 success:function(data){
		    		 if(data=="1"){
		    			 layer.msg("删除成功")
		    			 location.href="/webm/web/page/order/order.jsp"
		    		 }
		    		 if(data=="2"){
		    			 layer.msg("删除失败存在子级不能删除")
		    		 }
		    	 }
		     })
		 })
	 }
	 function dd(s){
		 var code = s
		 layer.open({
	        	type : 2,
	     		area : [ '800px', '450px' ],
	     		fixed : false, // 不固定
	     		maxmin : true,
	     		content : "/webm/web/page/order/ordergoods.jsp?code="+s
	         })
	 }
</script>
</body>
</html>