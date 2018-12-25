<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/web/header.jsp"%>
<title>收货地址维护</title>
</head>
<body>
<fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
    <legend>收货地址--修改信息</legend>

<form class="layui-form" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-inline">
            <input type="text" name="account" autocomplete="off" value=""  
						class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">收件人</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" placeholder="请输入收件人" autocomplete="off"
                class="layui-input">
        </div>
        <label class="layui-form-label">电话</label>
        <div class="layui-input-inline">
            <input type="text" name="tel" lay-verify="required" placeholder="请输入电话" autocomplete="off"
                class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">省</label>
        <div class="layui-input-inline">
            <select name="addr1" lay-verify="" lay-filter="addr1" lay-search></select>
        </div>
        <label class="layui-form-label">市</label>
        <div class="layui-input-inline">
            <select name="addr2" lay-verify="" lay-filter="addr2" lay-search></select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">区</label>
        <div class="layui-input-inline">
            <select name="addr3" lay-verify="" lay-search></select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地址</label>
        <div class="layui-input-block" style="width: 500px">
            <input type="text" name="addr4" lay-verify="required" placeholder="请输入地址" autocomplete="off"
                class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-inline">
            <input type="button" class="layui-btn" lay-submit lay-filter="upd" value="确定" />
            <input type="button" class="layui-btn" onclick="closeThis()" value="取消" />
        </div>
    </div>
    <input type="hidden" name="action" value="upd" />
    <input type="hidden" name="id" value="" />
</form>
</fieldset>
<script type="text/javascript">
var id = "<%= request.getParameter("id")%>"
$(function(){
	init()
	init2()
})
function init(){
	$.ajax({
		url:"/webm/dict/select.do",
		dataType:"json",
		type:"post",
		data:{parentcode:"ca"},
		success:function(data){
			    var html = "<option value=''></option>" ;
			    console.log(data)
			    $.each(data,function(i, dom) {
			        html += "<option value='"+dom.code+"'>"+dom.name+"</option>" 
			    })
			    $("select[name='addr1']").html(html);
			    form.render('select'); //刷新select选择框渲染
		}
	})
}
 function init2(){
	 $.ajax({
		 url:"/webm/addr/select.do",
		 data:{id:id},
		 dataType:"json",
		 type:"post",
		 success:function(data){
			 $.each(data,function(i,dom){	
				 $("input[name='account']").val(dom.account)
				 $("input[name='username']").val(dom.username)
				 $("input[name='tel']").val(dom.tel)
				 $("input[name='addr4']").val(dom.addr4);
// 				 $("select[name='addr1']").val(dom.addr1);
				 $("select[name='addr1'] option[value='"+dom.addr1+"']").prop('selected','selected');
				 $.ajax({
					 url:"/webm/dict/select.do",
						dataType:"json",
						type:"post",
						data:{parentcode:dom.addr1},
						success:function(data){
							    var html = "<option value=''></option>" ;
							    console.log(data)
							    $.each(data,function(i, dom) {
							        html += "<option value='"+dom.code+"'>"+dom.name+"</option>" 
							    })
							    $("select[name='addr2']").html(html);
							    $("select[name='addr2']").val(dom.addr2);
							    form.render('select'); //刷新select选择框渲染
					 }
				 })
			 $.ajax({
				 url:"/webm/dict/select.do",
					dataType:"json",
					type:"post",
					data:{parentcode:dom.addr2},
					success:function(data){
						    var html2 = "<option value=''></option>" ;
						    console.log(data)
						    $.each(data,function(i, dom) {
						        html2 += "<option value='"+dom.code+"'>"+dom.name+"</option>" 
						    })
						    $("select[name='addr3']").html(html2);
						    $("select[name='addr3']").val(dom.addr3);
						    form.render('select'); //刷新select选择框渲染
				 }
			 })
			
			 
		 })
	   }
	})
 }
 form.on("select(addr1)",function(data){
	   $("select[name='addr2']").empty();
	   $("select[name='addr3']").empty();
	   form.render('select');
	   var m = data.value
	   console.log(data.value)
	   $.ajax({
	   	   url:"/webm/dict/select.do",
		   type:"POST",
		   dataType:"json",
		   data:{parentcode:m},
	       success:function(data){
	    	   var html = ""
	    	   $.each(data,function(i,dom){
	    		  html+= "<option value='"+dom.code+"'>"+dom.name+"</option>"
	    	   })
	    	   $("select[name='addr2']").html(html)
				  form.render("select")
	       }
	    })
 })
 form.on("select(addr2)",function(data){
	   $("select[name='addr3']").empty();
	   form.render('select');
	   var m = data.value
	   console.log(data.value)
	   $.ajax({
	   	   url:"/webm/dict/select.do",
		   type:"POST",
		   dataType:"json",
		   data:{parentcode:m},
	       success:function(data){
	    	   var html = ""
	    	   $.each(data,function(i,dom){
	    		  html+= "<option value='"+dom.code+"'>"+dom.name+"</option>"
	    	   })
	    	   $("select[name='addr3']").html(html)
				  form.render("select")
	       }
	    })
 })
 form.on("submit(upd)",function(data){
	   $.ajax({
			  url:"/webm/addr/update.do",
			  type:"POST",
			  data:data.field,
			  dataType:"text",
			  success:function(data){
				 if(data=="1"){
					 layer.msg('修改成功');
				     closeThis(300);
				 }else{
					 layer.msg('修改失败');
				 }
			  }
		  })
 })
</script>
</body>
</html>