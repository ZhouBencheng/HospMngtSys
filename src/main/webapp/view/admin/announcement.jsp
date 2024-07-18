<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
String title = request.getParameter("title");
String image = request.getParameter("image");
String content = request.getParameter("content");
String creator = request.getParameter("creator");
%>
<!DOCTYPE html>
<html>

<head>
  <title>Insove Medical Healthcare</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="author" content="">
  <meta name="keywords" content="">
  <meta name="description" content="">
  <link rel="stylesheet" type="text/css" href="../../css1/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="../../css1/style.css">
  <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/Swiper/9.4.1/swiper-bundle.min.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

  <script src="../../js1/modernizr.js"></script>
</head>

<body>
  <header id="header">
  </header>

  <section id="intro" style="background-color:#E8F0F1;">
    <div class="container">
      <div class="banner-content padding-large">
        <h1 class="display-3 fw-bold text-dark"><%=title%></h1>
        <span class="item"><a href="<c:url value="/announcementList"/>" class="">公告列表</a></span> &nbsp; <span class="">/</span> &nbsp; <span
          class=" item"><%=creator%></span>
      </div>
    </div>
  </section>

  <section class="padding-small">

    <div class="container">
      <div class="row">
        <div class="">
          <div class="post-content ">

            <img src="../../images/<%=image%>" alt="image" class="img-fluid my-5">


            <p><%=content%></p>


          </div><!--post-content-->
        </div>
      </div>
    </div>
  </section>

  <script src="../../js1/jquery-1.11.0.min.js"></script>
  <script src="https://cdn.bootcdn.net/ajax/libs/Swiper/11.0.5/swiper-bundle.min.js"></script>
  <script type="text/javascript" src="../../js1/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="../../js1/plugins.js"></script>
  <script type="text/javascript" src="../../js1/script.js"></script>
  <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</body>

</html>
