<%-- 
    Document   : success
    Created on : Apr 22, 2018, 1:02:06 AM
    Author     : User
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Nhà xe Minh Nhựt - An toàn - Tiết kiệm</title>
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/small-business.css" rel="stylesheet">
        <link href="css/hover.css" rel="stylesheet">
        <link href="css/fontawesome-all.css" rel="stylesheet"> 
    </head>
    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#"><img class="img_logo" src="img/logo_horizonal.png" width="150px"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active"> <a class="nav-link hvr-underline-from-left" href="#">Trang chủ
                                <span class="sr-only">(current)</span>
                            </a> </li>
                        <li class="nav-item"> <a class="nav-link hvr-underline-from-left" href="#">Đặt vé</a> </li>
                        <li class="nav-item"> <a class="nav-link hvr-underline-from-left" href="#">Giới thiệu</a> </li>
                        <li class="nav-item"> <a class="nav-link hvr-underline-from-left" href="#">Liên hệ</a> </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!--Page content-->
        <div class="container">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <c:if test="${requestScope.is_success_invoice == false}">
                        <c:set var="error_message" value="${requestScope.error_message}"></c:set>
                            <form action="ticket_3" method="post">
                                <h2>Ghế ${error_message} đã có người đặt. Xin vui lòng chọn ghế khác.</h2>
                            <button type="submit" name="button_action" value="choose_another_seat" class="btn btn-warning btn-flat">Chọn ghế khác</button>
                        </form>
                    </c:if>
                    <c:if test="${requestScope.is_success_invoice == true}">
                        <form action="index" method="post">
                            <h2>Thanh toán thành công. Thông tin hóa đơn đã được gửi dưới dạng tin nhắn đến điện thoại của bạn.</h2>
                            <h2>Xin vui lòng thanh toán hóa đơn trước ngày <strong>${sessionScope.start_date_string}</strong> tại phòng vé thuộc hãng xe Minh Nhựt.</h2>
                            <h2>Nếu có bất cứ thắc mắc nào liên quan tới thông tin hóa đơn, xin liên hệ đường dây nóng <a href="">19009999</a>.</h2>
                            <button type="submit" class="btn btn-success btn-flat" name="button_action" value="back_to_home_page">Quay lại trang chủ</button>
                        </form>
                    </c:if>
                </div>
                <div class="col-md-1"></div>
            </div>
            <!-- Footer -->
            <footer class="py-5 bg-dark">
                <div class="container">
                    <p class="m-0 text-center text-white">Copyright &copy; Minh Nhut Corporation</p>
                </div>
                <!-- /.container -->
            </footer>
        </div>
    </body>


</html>
