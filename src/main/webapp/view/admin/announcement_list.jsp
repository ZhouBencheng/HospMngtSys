<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>公告列表</title>
    <link rel="stylesheet" href="../../css/pintuer.css">
    <link rel="stylesheet" href="../../css/admin.css">
    <script src="../../js/jquery-3.7.1.min.js"></script>
    <script src="../../js/utilities.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="padding border-bottom">
    <button type="button" class="button border-yellow" onclick="window.location.href='view/admin/announcement_add.jsp'"><span class="icon-plus-square-o"></span> 添加公告</button>
  </div>
  <table class="table table-hover text-center">
    <tr>
        <td>ID</td>
        <td>公告标题</td>
        <td>公告内容</td>
        <td>发布时间</td>
        <td>文章作者</td>
    </tr>

    <c:forEach items="${pageInfo.list}" var="ann" varStatus="vs">
        <tr>
            <td>${ann.announcementId}</td>
            <td>${ann.title}</td>
            <td>${fn:substring(ann.content, 0, 20)}...</td>
            <td>${ann.creationTime}</td>
            <td>${ann.creator}</td>
            <td>
                <div class="button-group">
                    <a class="button border-red" href="javascript:void(0)" onclick="return del(${ann.announcementId})">
                        <span class="icon-trash-o"></span>
                        删除
                    </a>
                </div>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="8">
            <div class="pagelist">
                <a href="<c:url value="/announcementList?pageNum=${pageInfo.prePage}"/>">上一页</a>
                <c:forEach items="${pageInfo.navigatepageNums}" var="i">
                    <c:choose>
                        <c:when test="${pageInfo.pageNum == i}">
                            <a href="<c:url value="/announcementList?pageNum=${i}"/>" style="background-color: #09F">${i}</a>
                        </c:when>
                        <c:when test="${pageInfo.pageNum != i}">
                            <a href="<c:url value="/announcementList?pageNum=${i}"/>">${i}</a>
                        </c:when>
                    </c:choose>
                </c:forEach>
                <c:if test="${pageInfo.isLastPage}">
                    <a href="javascript:alert('已经是最后一页了')">下一页</a>
                </c:if>
                <c:if test="${!pageInfo.isLastPage}">
                    <a href="<c:url value="/announcementList?pageNum=${pageInfo.nextPage}"/>">下一页</a>
                </c:if>
                <a href="<c:url value="/announcementList?pageNum=${pageInfo.pages}"/>">尾页</a>
            </div>
        </td>
    </tr>
  </table>
</div>
<script type="text/javascript">
function del(id){
	if(confirm("您确定要删除吗?")){

	}
}
</script>
</body>
</html>
