<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>商品分类维护</title>
</head>
<body>
<fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
    <legend>修改信息</legend>

<form class="layui-form" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">上级</label>
        <div class="layui-input-inline">
            <select name="parentcode" lay-verify="" lay-search>
            </select>     
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-inline">
            <input type="text" name="code" 
            lay-verify="required" placeholder="请输入编号" 
            autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-inline">
            <input type="text" name="name" 
            lay-verify="required" placeholder="请输入名称" 
            autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">描述</label>
        <div class="layui-input-inline">
            <input type="text" name="des" 
            lay-verify="required" placeholder="请输入描述" 
            autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-inline">
            <input type="button" class="layui-btn" 
            lay-submit lay-filter="upd" value="确定" />
            <input type="button" class="layui-btn" 
            onclick="closeThis()" value="取消" />
        </div>
    </div>
    <input type="hidden" name="action" value="upd" />
</form>
</fieldset>
<script type="text/javascript">
$(function(){
	$.ajax({
		url:"/webm/goods/add.do",
		dataType:"json",
		type:"post",
		data:{parentcode:""},
		success:function(data){
			    var html = "<option value=''>无上级</option>" ;
			    $.each(data,function(i, dom) {
			        html += "<option value='"+dom.code+"'>"+dom.name+"</option>" ;
			    });
			    $("select[name='parentcode']").html(html);
			    form.render('select'); //刷新select选择框渲染
			    init();
		}
	})
})
function init(){
	var code = '<%=request.getParameter("code")%>';
	alert(code)
	$.ajax({
		url:"/webm/goods/add.do",
		data:{code:code},
		dataType:"json",
		type:"post",
		success:function(data){
			console.log(data)
			$.each(data,function(i,dom){
				$("input[name='code']").val(dom.code);
		        $("input[name='name']").val(dom.name);
		        $("input[name='des']").val(dom.des);
		        $("option[value='"+dom.parentcode+"']").prop('selected','selected');
		        form.render('select');
		        $("input[name='code']").prop("readonly","readonly");
			})
		}
	})
}
form.on("submit(upd)",function(data){
	$.ajax({
		url:"/webm/goods/update.do",
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