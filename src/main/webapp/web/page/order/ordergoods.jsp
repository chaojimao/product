<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<meta charset="UTF-8">
<title>订单商品</title>
</head>
<body>
<form class="layui-form" method='post' onsubmit='return false;'>
		<div class="layui-form-item">
			<div class="layui-input-inline">
			<button class="layui-btn" lay-submit lay-filter="add" onclick="jia()" 
					name='add'>添加</button>
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
					<th>订单</th>
					<th>商品</th>
					<th>金额</th>
					<th>数量</th>
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
var code = "<%= request.getParameter("code")%>"
$(function(){
	 init()
})
 function init(){
	$.ajax({
		url:"/webm/ddgoods/selectlll.do",
		data:{code:code},
		dataType:"json",
		type:"POST",
		success:function(data){
			    var html = ""
				$.each(data,function(i,dom){
					var code = dom.code
					var name = dom.name
					var price = dom.price
					var amount = dom.amount
					var id = dom.id
					html+="<tr><td>"+code+"</td><td>"+name+"</td><td>"+price+"</td><td>"+amount+"</td><td><button class='layui-btn' onclick='delete1(\""+id+"\")'>删除</button></td></tr>"
				})
				$("#tbody").html(html)
		  }
	})
}  
function jia(){
	layer.open({
    	type : 2,
 		area : [ '500px', '350px' ],
 		fixed : false, // 不固定
 		maxmin : true,
 		content : "/webm/web/page/order/goodsadd.jsp?code="+code,
 	    end:function(){
 	    	init()
 	    }
     })
}
function delete1(s){
	 layer.confirm("是否删除",{icon:3,title:"提示"},function(index){
		 $.ajax({
	    	 url:"/webm/ddgoods/delete.do",
	    	 data:{id:s},
	    	 dataType:"text",
	    	 type:"post",
	    	 success:function(data){
	    		 if(data=="1"){
	    			 layer.msg("删除成功")
	    			 init()
	    		 }
	    		 if(data=="2"){
	    			 layer.msg("删除失败")
	    		 }
	    	 }
	     })
	 })
}
</script>
</body>
</html>