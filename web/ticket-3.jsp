<%-- 
    Document   : ticket-3
    Created on : Apr 21, 2018, 9:51:10 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
        <!-- Page Content -->
        <div class="container">
            <div id="steps" class="container">
                <ul class="list-step clearfix">
                    <li>Chọn tuyến <span></span> </li>
                    <li>Chọn ghế <span></span></li>
                    <li class="active first">Thông tin khách hàng <span></span></li>
                    <li>Thanh toán <span></span></li>
                </ul>
            </div>
            <!-- Heading Row -->
            <div class="row my-4">
                <div class="col-lg-6">
                    <form>
                        <h1>Thông tin mua vé:</h1>
                        <div class="contentform">
                            <div class="form-group">
                                <p>Họ và tên <span>*</span></p>
                                <input type="text" name="prenom" id="prenom" data-rule="required" class="info-customer-name" />
                                <div class="validation"></div>
                            </div>
                            <div class="leftcontact">
                                <div class="form-group">
                                    <p>Email</p>
                                    <input type="text" name="prenom" id="prenom" data-rule="required" class="info-customer" />
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                    <p>Di động <span>*</span></p>
                                    <input type="text" name="prenom" id="prenom" data-rule="required" class="info-customer" />
                                    <div class="validation"></div>
                                </div>
                            </div>
                            <div class="rightcontact">
                                <div class="form-group">
                                    <p>Ngày sinh</p>
                                    <input type="date" name="prenom" id="prenom" data-rule="required" class="info-customer" placeholder="dd/mm/yyyy" />
                                    <div class="validation"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" style="height: 50px">
                            <div class="form-section">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-ms-12" style="height: 0px"> <a class="btn btn-primary btn-flat" style="color: white;margin-left: 18px"><i class="fa fa-arrow-left icon-flat bg-btn-actived" ></i> Quay lại</a>
                                    <button type="submit" class="btn btn-success btn-flat"><i class="fa fa-arrow-right icon-flat "></i>Tiếp tục</button>
                                </div>
                            </div> 
                        </div>

                    </form>
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-6 result-panel">
                    <h1 class="title-name">Điều khoản và lưu ý</h1>
                    <div class="row mg-t10 row-content">
                        <div class="panel" style="min-height: 390px; user-select: text;">
                            <div style="user-select: text;">
                                <p class="text-justify" style="user-select: text;">(*) Quý khách vui lòng mang email có chứa mã vé đến văn phòng để đổi vé lên xe trước giờ xuất bến ít nhất <strong class="text-primary">60 phút</strong> để chúng tôi trung chuyển.</p>
                                <p class="text-justify">(*) Thông tin hành khách phải chính xác, nếu không sẽ không thể lên xe hoặc hủy/đổi vé</p>
                                <p class="text-justify">(*) Quý khách không được đổi / trả vé vào các ngày Lễ Tết ( ngày thường quý khách được quyền chuyển đổi hoặc hủy vé <strong class="text-primary">một lần</strong> duy nhất trước giờ xe chạy 24 giờ), phí hủy vé 10%. </p>
                                <p class="text-justify" style="user-select: text;">(*) Nếu quý khách có nhu cầu trung chuyển, vui lòng liên hệ số điện thoại
                                    <strong class="text-primary" style="font-size: 1.2em;">1900 6067</strong> 
                                    trước khi đặt vé. Chúng tôi sẽ không đón/ trung chuyển tại những điểm xe trung chuyển không thể tới được.
                                </p>
                            </div>

                        </div>
                    </div>
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
            <!-- Bootstrap core JavaScript -->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
