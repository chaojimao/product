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
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>上传图片</legend>
</fieldset> 
<div class="layui-upload">
  <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button> 
  <button type="button" class="layui-btn" id="testListAction">开始上传</button>
  <div class="layui-upload-list">
    <table class="layui-table">
      <thead>
        <tr><th>文件名</th>
        <th>大小</th>
        <th>状态</th>
        <th>操作</th>
      </tr></thead>
      <tbody id="demoList"></tbody>
    </table>
  </div>  
</div> 
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
  <legend>图片列表</legend>
</fieldset>
<div class="layui-upload">
  <div class="layui-upload-list">
    <table class="layui-table">
      <thead>
        <tr><th>文件名</th>
        <th>图片</th>
        <th>操作</th>
      </tr></thead>
      <tbody id="demoList111"></tbody>
    </table>
  </div>  
</div> 
<script type="text/javascript" src="/webm/web/common/layui/layui.all.js"></script>
<script type="text/javascript">
var upload = layui.upload
var code = '<%=request.getParameter("code")%>';
var demoListView = $('#demoList'),uploadListIns = upload.render({
  elem: '#testList',
  url: '/webm/pic/sc.do',
  accept: 'file',
  multiple: true,
  data:{code:code},
  auto: false,
  bindAction: '#testListAction',
  choose: function(obj){   
    var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
    //读取本地文件
    obj.preview(function(index, file, result){
      var tr = $(['<tr id="upload-'+ index +'">'
        ,'<td>'+ file.name +'</td>'
        ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
        ,'<td>等待上传</td>'
        ,'<td>'
          ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
          ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
        ,'</td>'
      ,'</tr>'].join(''));
      
      //单个重传
      tr.find('.demo-reload').on('click', function(){
        obj.upload(index, file);
      });
      
      //删除
      tr.find('.demo-delete').on('click', function(){
        delete files[index]; //删除对应的文件
        tr.remove();
        uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
      });
      
      demoListView.append(tr);
    });
  }
  ,done: function(res, index, upload){
    if(res.code == 0){ //上传成功
      init()
      var tr = demoListView.find('tr#upload-'+ index)
      ,tds = tr.children();
      tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
      tds.eq(3).html(''); //清空操作
      return delete this.files[index]; //删除文件队列已经上传成功的文件
    }
    this.error(index, upload);
  }
  ,error: function(index, upload){
    var tr = demoListView.find('tr#upload-'+ index)
    ,tds = tr.children();
    tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
    tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
  }
});
function init(){
	$.ajax({
		  url:"/webm/pic/select.do",
		  data:{code:code},
		  dataType:"json",
		  type:"post",
		  success:function(data){
			  var html =""
			  $.each(data,function(i,dom){
				  if(dom.type=="1"){
					  var l="主图"
				  }else{
					  var l="设为主图"
				  }
				  html+="<tr><td>"+dom.url+"</td><td><img src='/image/"+dom.url+"'></td><td><button class='layui-btn' onclick='delete1(\""+dom.url+"\")'>删除</button><button class='layui-btn' onclick='zt(\""+dom.url+"\")'>"+l+"</button></td></tr>"
			  })
			  $("#demoList111").html(html)
		  }
	  })
}
$(function(){
    init();
})
function delete1(b){
	var url = b
	layer.confirm("是否删除",{icon:3,title:"提示"},function(index){
		$.ajax({
			url:"/webm/pic/delete.do",
			data:{url:b},
			dataType:"text",
			type:"post",
			success:function(data){
				if(data=="1"){
					layer.msg("删除成功")
					init();
				}else{
					layer.msg("删除失败")
				}
			}
		})
	}
	)
	
}
function zt(c){
	var url = c
	$.ajax({
		url:"/webm/pic/update.do",
		data:{url:c},
		dataType:"text",
		type:"post",
		success:function(data){
            if(data=="1"){
            	init()
            }
		}
	})
}
</script>
</body>
</html>