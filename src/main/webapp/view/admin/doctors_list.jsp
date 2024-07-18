<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="../../css/pintuer.css">
<link rel="stylesheet" href="../../css/admin.css">
<script src="../../js/jquery-3.7.1.min.js"></script>
<script src="../../js/utilities.js"></script>
</head>
<body>
<%--<form method="post" action="" id="listform">--%>
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong> <a href="" style="float:right; display:none;">添加字段</a></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li> <a class="button border-main icon-plus-square-o" href="add.html"> 添加内容</a> </li>
<%--        <li>搜索：</li>--%>
<%--        <li>首页--%>
<%--          <select name="s_ishome" class="input" onchange="changesearch()" style="width:60px; line-height:17px; display:inline-block">--%>
<%--            <option value="">选择</option>--%>
<%--            <option value="1">是</option>--%>
<%--            <option value="0">否</option>--%>
<%--          </select>--%>
<%--          &nbsp;&nbsp;--%>
<%--          推荐--%>
<%--          <select name="s_isvouch" class="input" onchange="changesearch()"  style="width:60px; line-height:17px;display:inline-block">--%>
<%--            <option value="">选择</option>--%>
<%--            <option value="1">是</option>--%>
<%--            <option value="0">否</option>--%>
<%--          </select>--%>
<%--          &nbsp;&nbsp;--%>
<%--          置顶--%>
<%--          <select name="s_istop" class="input" onchange="changesearch()"  style="width:60px; line-height:17px;display:inline-block">--%>
<%--            <option value="">选择</option>--%>
<%--            <option value="1">是</option>--%>
<%--            <option value="0">否</option>--%>
<%--          </select>--%>
<%--        </li>--%>
<%--        <if condition="$iscid eq 1">--%>
          <li>
            <select name="deptId" class="input" style="width:200px; line-height:17px;" onchange="changesearch()">
              <option value="">请选择科室</option>
              <option value="6">心内科</option>
                <option value="7">呼吸内科</option>
                <option value="8">消化内科</option>
                <option value="9">神经内科</option>
                <option value="10">内分泌科</option>
                <option value="11">普外科</option>
                <option value="12">骨科</option>
                <option value="13">泌尿外科</option>
                <option value="14">神经外科</option>
                <option value="15">儿童呼吸科</option>
<%--              <option value="">产品分类</option>--%>
<%--              <option value="">产品分类</option>--%>
<%--              <option value="">产品分类</option>--%>
            </select>
          </li>
<%--        </if>--%>
        <li>
          <input type="text" placeholder="请输入搜索姓名" name="docName" class="input" style="width:250px; line-height:17px;display:inline-block" />
            <input type="text" placeholder="请输入搜索工号" name="jobNumber" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
        <thead>
            <tr>
                <th width="100" style="text-align:left; padding-left:20px;">ID</th>
<!--                <th width="10%">排序</th>-->
                <th>工号</th>
                <th>姓名</th>
                <th>头像</th>
                <th>手机号</th>
                <th>挂号费</th>
                <th>入职日期</th>
                <th>科室名称</th>
                <th>职称</th>
<%--                <th width="10%">更新时间</th>--%>
                <th width="310">操作</th>
            </tr>
        </thead>

        <tbody id="docBody">
<%--        <tr>--%>
<%--            <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="id[]" value="" />--%>
<%--                1</td>--%>
<%--            <td><input type="text" name="sort[1]" value="1" style="width:50px; text-align:center; border:1px solid #ddd; padding:7px 0;" /></td>--%>
<%--            <td width="10%"><img src="../../images/11.jpg" alt="" width="70" height="50" /></td>--%>
<%--            <td>这是一套MUI后台精美管理系统，感谢您的支持</td>--%>
<%--            <td><font color="#00CC99">首页</font></td>--%>
<%--            <td>产品分类</td>--%>
<%--            <td>2016-07-01</td>--%>
<%--            <td><div class="button-group"> <a class="button border-main" href="add.html"><span class="icon-edit"></span> 修改</a> <a class="button border-red" href="javascript:void(0)" onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a> </div></td>--%>
<%--        </tr>--%>
        </tbody>

      <tr>
        <td colspan="8">
            <div class="pagelist">
                <a href="" id="pre">上一页</a>
<%--                <span class="current">1</span>--%>
<%--                <span>2</span>--%>
                <a href="javascript:void(0)" id="next" onclick="nextPage()">下一页</a>
                <a href="">尾页</a>
            </div>
        </td>
      </tr>
    </table>
  </div>
<%--</form>--%>
<script type="text/javascript">

//发送ajax请求 doctorsList
function initDocList(p,docName,jobNumber,deptId){
    console.log("initDocList called");
    $.ajax({
        url: "/doctorsList",
        type: "GET",
        dataType: "json",
        data: {"pageNum":p,"deptId":deptId,"docName":docName,"jobNumber":jobNumber},
        success: function (res) {
            // console.log($button.attr("deptPid"));
            console.log("res",res);
            // $('#subMenu' + index + ' tbody').empty();
            $("#docBody").empty();

            $.each(res.list, function (i, v) {
                var trObj = $("<tr></tr>");
                trObj.append ($("<td>"+(i+1)+"</td>"));
                trObj.append ($("<td>"+v.jobNumber+"</td>"));
                trObj.append ($("<td>"+v.name+"</td>"));
                trObj.append ($('<td><img width="70" height="50" src="../../images/'+v.avatar+'"></img>'));
                trObj.append ($("<td>"+v.phone+"</td>"));
                trObj.append ($("<td>"+v.registrationFee+"</td>"));
                trObj.append ($("<td>"+v.entryDate+"</td>"));
                trObj.append ($("<td>"+v.departments.departmentsName+"</td>"));
                trObj.append ($("<td>"+v.professionalTitles.titleName+"</td>"));

                trObj.append($('<td><a class="button border-main" href="/toEdit?deptId='+v.departmentId+'"><span class="icon-edit"></span> 修改</a> <a class="button border-red" href="javascript:void(0)" onclick="return del('+v.id+','+v.deptId+','+v.id+')"><span class="icon-trash-o"></span> 删除</a></td>'));

                trObj.appendTo($("#docBody"));
            });

            //将.pagelist下的span全部删除
            $(".pagelist span").remove()
            //页码遍历
            for(var i=0;i<res.pages;i++){
                //创建span
                var $span = $("<span onclick='changePage($(this).html())'>"+(i+1)+"</span>")

                if((i+1) == res.pageNum){
                    $span.attr("class","current")
                }

                $("#next").before($span)
            }
        }
    })
}
$(function (){
    console.log("Document ready");
    initDocList(1,"","","");
})

function changePage(p){
    // alert(p);
    initDocList(p);
}

function nextPage(){
    //获取到当前页码
    var currentPageNumber = $("span[class='current']").text()
    //当前页码+1
    initDocList(Number(currentPageNumber)+1)
}
//搜索
function changesearch(){
    var $docName = $("input[name='docName']").val().trim();
    var $jobNumber = $("input[name='jobNumber']").val().trim();
    var $deptId = $("select[name='deptId'] option:selected").val();

    console.log($docName,$jobNumber,$deptId);

    initDocList(1,$docName,$jobNumber,$deptId);
}

//单个删除
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){

	}
}

//全选
$("#checkall").click(function(){
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

//批量删除
function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {
		Checkbox=true;
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false;
		$("#listform").submit();
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

//批量排序
function sorts(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {
		Checkbox=true;
	  }
	});
	if (Checkbox){

		$("#listform").submit();
	}
	else{
		alert("请选择要操作的内容!");
		return false;
	}
}


//批量首页显示
function changeishome(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {
		Checkbox=true;
	  }
	});
	if (Checkbox){

		$("#listform").submit();
	}
	else{
		alert("请选择要操作的内容!");

		return false;
	}
}

//批量推荐
function changeisvouch(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {
		Checkbox=true;
	  }
	});
	if (Checkbox){


		$("#listform").submit();
	}
	else{
		alert("请选择要操作的内容!");

		return false;
	}
}

//批量置顶
function changeistop(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {
		Checkbox=true;
	  }
	});
	if (Checkbox){

		$("#listform").submit();
	}
	else{
		alert("请选择要操作的内容!");

		return false;
	}
}


//批量移动
function changecate(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {
		Checkbox=true;
	  }
	});
	if (Checkbox){

		$("#listform").submit();
	}
	else{
		alert("请选择要操作的内容!");

		return false;
	}
}

//批量复制
function changecopy(o){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {
		Checkbox=true;
	  }
	});
	if (Checkbox){
		var i = 0;
	    $("input[name='id[]']").each(function(){
	  		if (this.checked==true) {
				i++;
			}
	    });
		if(i>1){
	    	alert("只能选择一条信息!");
			$(o).find("option:first").prop("selected","selected");
		}else{

			$("#listform").submit();
		}
	}
	else{
		alert("请选择要复制的内容!");
		$(o).find("option:first").prop("selected","selected");
		return false;
	}
}

</script>
</body>
</html>
