<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>增加内容</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="<c:url value="/departmentsSave"/>">
      <div class="form-group">
        <div class="label">
          <label>科室：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="" name="departmentName" data-validate="required:请输入父科室" />
          <div class="tips"></div>
        </div>
      </div>

      <if condition="$iscid eq 1">
        <div class="form-group">
          <div class="label">
            <label>分类标题：</label>
          </div>
          <div class="field">
            <select name="deptPid" class="input w50">
              <option value="-1">无父科室</option>
              <option value="1">内科</option>
              <option value="2">外科</option>
              <option value="3">儿科</option>
              <option value="4">妇产科</option>
              <option value="5">眼科</option>
            </select>
            <div class="tips"></div>
          </div>
        </div>
      </if>
      <div class="form-group">
        <div class="label">
          <label>科室描述：</label>
        </div>
        <div class="field">
          <textarea class="input" name="departmentDescription" style=" height:90px;"></textarea>
          <div class="tips"></div>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>
