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
			  <p>总件数：<big id="all1"></big></p>
			  <p>总价格：<big id="all2"></big></p>
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
			    var all1 = 0
			    var all2 =0
				$.each(data,function(i,dom){
					console.log(dom.url)
					var code = dom.code
					var name = dom.name
					var price = dom.price
					var amount = dom.amount
					var id = dom.id
					all1+=amount
					all2+=price
					html+="<tr><td>"+code+"</td><td>"+name+"<img src='/image/"+dom.url+"'></td><td>"+price+"</td><td>"+amount+"</td>`</tr>"
				})
				$("#tbody").html(html)
				$("#all1").html(all1)
				$("#all2").html(all2)
		  }
	})
}  
</script>
</body>
</html>