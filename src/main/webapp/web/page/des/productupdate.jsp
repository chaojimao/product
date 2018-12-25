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
<legend>修改信息</legend>
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
				<button class="layui-btn" name="anbd" lay-submit lay-filter="upd">确定</button>
				<button class="layui-btn" >重置</button>
			</div>
	    </form>
	</div>
<script type="text/javascript">
$(function(){
	$.ajax({
		url:"/webm/goods/add.do",
		dataType:"json",
		type:"post",
		data:{code:""},
		success:function(data){
			    var html = "<option value=''>无上级</option>" ;
			    $.each(data,function(i, dom) {
			        html += "<option value='"+dom.name+"'>"+dom.name+"</option>" ;
			    });
			    $("select[name='cate']").html(html);
			    form.render('select'); //刷新select选择框渲染
			    init();
		}
	})
})
function init(){
	var code = '<%=request.getParameter("code")%>';
	$.ajax({
		url:"/webm/product/select.do",
		data:{code:code},
		dataType:"json",
		type:"post",
		success:function(data){
			console.log(data)
			$.each(data,function(i,dom){
				$("input[name='code']").val(dom.code);
		        $("input[name='name']").val(dom.name);
		        $("input[name='des']").val(dom.des);
		        $("input[name='price']").val(dom.price);
		        $("input[name='amount']").val(dom.amount);
		        $("input[name='stat']").val(dom.stat);
		        $("option[value='"+dom.cate+"']").prop('selected','selected');
		        form.render('select');
		        $("input[name='code']").prop("readonly","readonly");
			})
			init3()
		}
	})
}
function init3(){
	$.ajax({
		url:"/webm/goods/add.do",
		data:{parentcode:""},
		dataType:"json",
		type:"post",
		success:function(data){
			var html = "<option value=''>无上级</option>"
			$.each(data,function(i,dom){
				html+="<option value='"+dom.code+"'>"+dom.name+"</option>"
			})
		 $("select[name='parentcode']").html(html);
		 form.render('select'); //刷新select选择框渲染
		 init4()
		}
	})
}
function init4(){
	var code = '<%=request.getParameter("code")%>';
	$.ajax({
		url:"/webm/product/select.do",
		data:{code:code},
		dataType:"json",
		type:"post",
		success:function(data){
			var s =""
			$.each(data,function(i,dom){
                s=dom.cate
			});
			init5(s)
		}
	})
}
function init5(s){
	var code = s;
	$.ajax({
		url:"/webm/goods/add.do",
		data:{name:code},
		dataType:"json",
		type:"post",
		success:function(data){
			console.log(data)
			$.each(data,function(i,dom){
		        $("option[value='"+dom.parentcode+"']").prop('selected','selected');
		        form.render('select');
			})
		}
	})
}
form.on("submit(upd)",function(data){
	$.ajax({
		url:"/webm/product/update.do",
		data:data.field,
		dateType:"text",
		type:"post",
		success:function(data){
			if (data == "1") {
		        layer.msg('修改成功');
		        closeThis(300);
		    } else {
		        layer.msg('修改失败');
		    }
		}
	})
})
</script>
</body>
</html>