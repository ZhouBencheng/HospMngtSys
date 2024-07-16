<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>科室列表</title>
    <link rel="stylesheet" href="../../css/pintuer.css">
    <link rel="stylesheet" href="../../css/admin.css">
    <script src="../../js/jquery-3.7.1.min.js"></script>
    <script src="../../js/utilities.js"></script>
    <script>
        var isRequestInProgress = false;
        function toggleSubMenu(index) {
            if (isRequestInProgress) return;
            isRequestInProgress = true;
            var $button = $('button[onclick="toggleSubMenu('+ index +')"]');
            console.log("Toggling sub menu for index:", index, "with deptPid:", $button.attr("deptPid"));

           $button.text($button.text() === '+' ? '-' : '+');
           var $subMenu = $('#subMenu' + index);
           $subMenu.css('display', $subMenu.css('display') === 'none' ? 'table-row' : 'none');

           $.ajax({
                url: "/departmentsSubList",
                type: "GET",
                dataType: "json",
                data: {"deptPid": $button.attr("deptPid")},
                success: function (res) {
                    // console.log($button.attr("deptPid"));
                    console.log(res);
                    $('#subMenu' + index + ' tbody').empty();
                    $.each(res, function (i, v) {
                        console.log(v);
                        var trObj = $("<tr></tr>");
                        trObj.append ($("<td>"+v.departmentsId+"</td>"));
                        trObj.append ($("<td>"+v.departmentsName+"</td>"));
                        trObj.append ($("<td>"+v.departmentsDescription+"</td>"));
                        trObj.append('<td>' +
                                                    '<div class="button-group">' +
                                                        '<a class="button border-main" href="view/admin/edit.jsp?deptId='+v.departmentsId+'&deptName='+v.departmentsName+'&deptDesc='+v.departmentsDescription+'">' +
                                                            '<span class="icon-edit"></span> 修改' +
                                                        '</a>' +
                                                        '<a class="button border-red" href="javascript:void(0)" onclick="return del('+v.departmentsId+')">' +
                                                            '<span class="icon-trash-o"></span> 删除' +
                                                        '</a>' +
                                                    '</div>' +
                                                '</td>'
                        );
                        trObj.appendTo($("#subMenu" + index + " tbody"));
                    })
                    isRequestInProgress = false;
                },
                error: function () {
                    console.log("Error occurred while fetching sub departments list")
                    isRequestInProgress = false;
                }
           })
        }
    </script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
  <div class="padding border-bottom">
    <button type="button" class="button border-yellow" onclick="window.location.href='view/admin/add.jsp'"><span class="icon-plus-square-o"></span> 添加分类</button>
  </div>
  <table class="table table-hover text-center">
    <tr>
        <td>展开折叠</td>
        <td>ID</td>
        <td>科室名称</td>
        <td>科室PID</td>
        <td>科室等级</td>
        <td>科室路径</td>
        <td>描述</td>
        <td>操作</td>
    </tr>

    <c:forEach items="${pageInfo.list}" var="dept" varStatus="vs">
        <tr>
            <td><button deptPid="${vs.index+1}" onclick="toggleSubMenu(${vs.index+1})">+</button></td>
            <td>${vs.index + 1}</td>
            <td>${dept.departmentsName}</td>
            <td>${dept.departmentsPid}</td>
            <td>${dept.departmentsLevel}</td>
            <td>${dept.departmentsPath}</td>
            <td>${dept.departmentsDescription}</td>
            <td>
                <div class="button-group">
                    <a class="button border-main" href="view/admin/edit.jsp?deptId=${dept.departmentsId}
                                                                 &deptName=${dept.departmentsName}
                                                                 &deptDesc=${dept.departmentsDescription}">
                        <span class="icon-edit"></span>
                        修改
                    </a>
                    <a class="button border-red" href="javascript:void(0)" onclick="return del(${dept.departmentsId})">
                        <span class="icon-trash-o"></span>
                        删除
                    </a>
                </div>
            </td>
        </tr>
        <tr style="display: none" id="subMenu${vs.index+1}">
            <td colspan="7">
                <div class="panel admin-panel">
                    <table class="table table-hover text-center">
                        <tr>
                            <td>ID</td>
                            <td>科室名称</td>
                            <td>描述</td>
                            <td>操作</td>
                        </tr>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="8">
            <div class="pagelist">
                <a href="<c:url value="/departmentsList?pageNum=${pageInfo.prePage}"/>">上一页</a>
                <c:forEach items="${pageInfo.navigatepageNums}" var="i">
                    <c:choose>
                        <c:when test="${pageInfo.pageNum == i}">
                            <a href="<c:url value="/departmentsList?pageNum=${i}"/>" style="background-color: #09F">${i}</a>
                        </c:when>
                        <c:when test="${pageInfo.pageNum != i}">
                            <a href="<c:url value="/departmentsList?pageNum=${i}"/>">${i}</a>
                        </c:when>
                    </c:choose>
                </c:forEach>
                <c:if test="${pageInfo.isLastPage}">
                    <a href="javascript:alert('已经是最后一页了')">下一页</a>
                </c:if>
                <c:if test="${!pageInfo.isLastPage}">
                    <a href="<c:url value="/departmentsList?pageNum=${pageInfo.nextPage}"/>">下一页</a>
                </c:if>
                <a href="<c:url value="/departmentsList?pageNum=${pageInfo.pages}"/>">尾页</a>
            </div>
        </td>
    </tr>
  </table>
</div>
<script type="text/javascript">
function del(id){
	if(confirm("您确定要删除吗?")){
        window.location.href = "/departmentsDelete?deptId=" + encodeURIComponent(id);
	}
}
</script>
</body>
</html>
