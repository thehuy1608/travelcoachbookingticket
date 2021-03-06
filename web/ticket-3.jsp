<%-- 
    Document   : ticket-4
    Created on : Apr 21, 2018, 9:51:16 AM
    Author     : User
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

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
        <link href="css/fontawesome-all.css" rel="stylesheet"> </head>

    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#"><img class="img_logo" src="img/logo_horizonal.png" width="150px"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"> <a class="nav-link hvr-underline-from-left" href="index.jsp">Trang chủ
                                
                            </a> </li>
                        <li class="nav-item active"> <a class="nav-link hvr-underline-from-left" href="#">Đặt vé<span class="sr-only">(current)</span></a> </li>
                        <li class="nav-item"> <a class="nav-link hvr-underline-from-left" href="#">Giới thiệu</a> </li>
                        <li class="nav-item"> <a class="nav-link hvr-underline-from-left" href="#">Liên hệ</a> </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page Content -->
        <div class="container">
            <div id="steps" class="container">
                <ul class="list-step clearfix">
                    <li>Chọn tuyến <span></span> </li>
                    <li>Chọn ghế <span></span></li>
                    <li class="active first">Thanh toán <span></span></li>
                </ul>
            </div>
            <!-- Heading Row -->
            <div class="row justify-content-center">
                <div class="col-sm"></div>
                <div class="col-10">
                    <form action="ticket_3" method="post">
                        <h1>Thông tin hóa đơn:</h1>
                        <div class="contentform">
                            <div class="form-group">
                                <p>Họ và tên <span>*</span></p>
                                <input type="text" name="customer_name" id="" class="info-payment" required/> </div>
                            <div class="form-group">
                                <p>Số điện thoại <span>*</span></p>
                                <input type="text" name="customer_phone_number" id="" class="info-payment" required/> </div>
                            <div class="form-group">
                                <p>Chuyến đi <span></span></p>
                                <input type="text" name="" id="" class="info-payment" value="${sessionScope.trip_name}" disabled/> </div>
                            <div class="form-group">
                                <p>Trạm khởi hành <span></span></p>
                                <input type="text" name="" id="" class="info-payment" value="${sessionScope.departure_station}" disabled/> </div>
                            <div class="form-group">
                                <p>Trạm kết thúc <span></span></p>
                                <input type="text" name="" id="" class="info-payment" value="${sessionScope.destination_station}" disabled/> </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 col-ms-12">
                                        <p>Ngày khởi hành <span><i class="fa fa-calendar-alt"></i></span></p>
                                        <input type="text" name="" id="" value="${sessionScope.start_date_string}" class="info-payment" disabled/> </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 col-ms-12">
                                        <p>Giờ khởi hành <span><i class="fa fa-clock"></i></span></p>
                                        <input type="text" name="" id="" class="info-payment" value="${sessionScope.start_time_string}" disabled/> </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 col-ms-12">
                                        <p>Ngày đến <span><i class="fa fa-calendar-alt"></i></span></p>
                                        <input type="text" name="" id="" value="${sessionScope.end_date_string}" class="info-payment" disabled/> </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 col-ms-12">
                                        <p>Giờ đến <span><i class="fa fa-clock"></i></span></p>
                                        <input type="text" name="" id="" class="info-payment" value="${sessionScope.end_time_string}" disabled/> </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 col-ms-12">
                                        <p>Số vé đã đặt <span><i class="fa fa-ticket-alt"></i></span></p>
                                        <input type="text" name="" id="" class="info-payment" value="${sessionScope.number_of_tickets}" disabled/> </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 col-ms-12">
                                        <p>Vị trí ngồi <span></span></p>
                                        <input type="text" name="" id="" class="info-payment" value="${sessionScope.chosen_seat_numbers_string}" disabled/> </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 col-ms-12">
                                        <p>Giá vé <span><i class="fa fa-money-bill-alt"></i></span></p>
                                        <input type="text" name="" id="" class="info-payment" value="${sessionScope.ticket_price}" disabled/> </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 col-ms-12">
                                        <p>Tổng tiền thanh toán <span></span></p>
                                        <input type="text" name="" id="" class="info-payment" value="${sessionScope.total_price}" disabled/> </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-section">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-ms-12"> 
                                <c:url var="back_to_ticket_2_link" value="/ticket_3" context="/TravelCoachBookingTicket">
                                    <c:param name="button_action" value="back_to_ticket_2"></c:param>
                                </c:url>
                                <a onclick="handleOnclickButtonBackToTicket2(this)"  href="${back_to_ticket_2_link}" class="btn btn-primary btn-flat" style="color: white;margin-left: 20px"><i class="fa fa-arrow-left icon-flat bg-btn-actived" ></i> Quay lại</a>
                                <button type="submit" class="btn btn-success btn-flat" name="button_action" value="order"><i class="fa fa-arrow-right icon-flat "></i>Đặt vé</button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-sm">
                    <!-- /.col-md-4 -->
                </div>
                <!-- /.row -->
                <!-- Call to Action Well -->
            </div>
            <!-- /.container -->
            <!-- Footer -->
            <footer class="py-5 bg-dark">
                <div class="container">
                    <p class="m-0 text-center text-white">Copyright &copy; Minh Nhut Corporation</p>
                </div>
                <!-- /.container -->
            </footer>
        </div>
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script>
            function handleOnclickButtonBackToTicket2(element) {
                alert('Xin vui lòng chọn lại vị trí ghế ngồi.');
            }
        </script>
    </body>

</html>
