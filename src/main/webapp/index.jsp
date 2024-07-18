<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
  <link rel="stylesheet" type="text/css" href="css1/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="style.css">
  <link rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/Swiper/9.4.1/swiper-bundle.min.css" />
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

  <!-- script
    ================================================== -->
  <script src="js1/modernizr.js"></script>
</head>

<body data-bs-spy="scroll" data-bs-target="#header-nav" tabindex="0">

  <header id="header">
    <nav class="header-top pt-4 pb-5">
      <div class="container">
        <div class="row justify-content-between align-items-center">
          <div class="col-lg-5 col-md-4 col-sm-6">
            <a class="navbar-brand" href="index.html">
              <img src="images1/main-logo.png" class="logo">
            </a>
          </div>
          <div class="col-lg-4 col-md-4 d-md-block d-sm-none">
            <ul class="contact-list d-flex justify-content-lg-end flex-wrap list-unstyled m-0">
              <li class="pe-5 pe-lg-0 pe-xxl-5 pb-3 pb-lg-0">
                <svg class="location primary-color" width="24" height="24">
                  <use xlink:href="#location"></use>
                </svg>123 Arling, Miola, NY
              </li>
              <li class="ps-xl-3">
                <svg class="phone primary-color" width="24" height="24">
                  <use xlink:href="#phone"></use>
                </svg>(+86) 10086
              </li>
            </ul>
          </div>
          <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="btn-book text-end">
              <a href="booking.html" class="btn btn-medium btn-outline-primary btn-pill text-uppercase">Book Now</a>
            </div>
          </div>
        </div>
      </div>
    </nav>

    <nav id="primary-header" nav class="navbar navbar-expand-lg shadow-none" aria-label="navbar" height="30">
      <div class="container">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-primary"
          aria-controls="navbar-primary" aria-expanded="false" aria-label="Toggle navigation">
          <svg class="navbar-icon mt-3 primary-color-500 bg-light" width="50" height="50">
            <use xlink:href="#navbar-icon"></use>
          </svg>
        </button>
        <div class="header-bottom collapse navbar-collapse bg-light border-radius-10 py-2" id="navbar-primary">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item ps-4 pe-4 border-right">
              <a class="nav-link text-dark active p-0 mt-3 mt-lg-0" aria-current="page" href="index.jsp">首页</a>
            </li>
            <li class="nav-item ps-4 pe-4 border-right">
              <a class="nav-link text-dark p-0" href="javascript:void(0);" onclick="changeContent('/departmentsList')">科室管理</a>
            </li>
            <li class="nav-item ps-4 pe-4 border-right">
              <a class="nav-link text-dark p-0" href="javascript:void(0);" onclick="changeContent('/view/admin/doctors_list.jsp')">医生管理</a>
            </li>
            <li class="nav-item ps-4 pe-4 border-right">
              <a class="nav-link text-dark p-0" href="#book-appointment">排班管理</a>
            </li>
            <li class="nav-item ps-4 pe-4 border-right">
              <a class="nav-link text-dark p-0" href="javascript:void(0);" onclick="changeContent('/announcementList')">公告管理</a>
            </li>
            <li class="nav-item ps-4 pe-3 dropdown border-right">
              <a class="nav-link text-dark p-0 dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button"
                aria-expanded="false">统计报表 <iconify-icon icon="iconamoon:arrow-down-2-fill"></iconify-icon> </a>
              <ul class="dropdown-menu">
                <li class="py-1"><a href="about.html" class="dropdown-item text-uppercase">挂号数量 <span
                      class="badge bg-secondary">Pro</span></a></li>
                <li class="py-1"><a href="blog.html" class="dropdown-item text-uppercase">就诊数量 <span
                      class="badge bg-secondary">Pro</span></a></li>
                <li class="py-1"><a href="blog-single.html" class="dropdown-item text-uppercase">收入报表 <span
                      class="badge bg-secondary">Pro</span></a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </header>

  <iframe id="contentFrame" width="100%" height="600px"></iframe>
    <section id="intro" class="position-relative overflow-hidden">
      <div class="banner">
        <img src="images1/banner-image.jpg" alt="banner" class="img-fluid">
      </div>
    </section>
  </iframe>

  <script src="js1/jquery-1.11.0.min.js"></script>

  <script type="text/javascript" src="js1/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="js1/plugins.js"></script>
  <script type="text/javascript" src="js1/script.js"></script>
  <script>
    function changeContent(page) {
      var frame = document.getElementById('contentFrame');
      frame.src = page; // 根据实际情况，这里可能需要拼接完整的URL
    }
  </script>
</body>
</html>