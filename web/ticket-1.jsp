<%-- 
    Document   : ticket-1
    Created on : Apr 21, 2018, 9:50:21 AM
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
                    <li class="active first">Chọn tuyến <span></span> </li>
                    <li>Chọn ghế <span></span></li>
                    <li>Thông tin khách hàng <span></span></li>
                    <li>Thanh toán <span></span></li>
                </ul>
            </div>
            <!-- Heading Row -->
            <div class="row my-4">
                <div class="col-lg-6">
                    <form>
                        <h1>Thông tin mua vé:</h1>
                        <div class="contentform">
                            <div class="leftcontact">
                                <div class="form-group">
                                    <p>Điểm khởi hành <span>*</span></p><span class="icon-case"><i class="fa fa-bus"></i></span>
                                    <select name="idOrigin" id="idOrigin" class="form-control selectpicker bs-select-hidden">
                                        <option value="ANGIANG">An Giang (Châu Đốc,Long Xuyên) </option>
                                        <option value="BUONMATHUOT">Buôn Ma Thuột</option>
                                        <option value="BINHMINH">Bình Minh</option>
                                        <option value="BINHDINH">Bình Định</option>
                                        <option value="BACLIEU">Bạc Liêu</option>
                                        <option value="BAOLOC">Bảo Lộc</option>
                                        <option value="BENTRE">Bến Tre</option>
                                        <option value="CAMRANH">Cam Ranh</option>
                                        <option value="CAOLANH">Cao Lãnh</option>
                                        <option value="CHAUDOC">Châu Đốc</option>
                                        <option value="CAMAU">Cà Mau</option>
                                        <option value="CANTHO">Cần Thơ</option>
                                        <option value="HUE">Huế</option>
                                        <option value="HANOI">Hà Nội</option>
                                        <option value="HATIEN">Hà Tiên</option>
                                        <option value="HAUGIANG">Hậu Giang</option>
                                        <option value="HONGNGU">Hồng Ngự</option>
                                        <option value="KIENGIANG">Kiên Giang</option>
                                        <option value="LONGXUYEN">Long Xuyên</option>
                                        <option value="LAMDONG">Lâm Đồng</option>
                                        <option value="MUINE">Mũi Né</option>
                                        <option value="NAMDINH">Nam Định</option>
                                        <option value="NHATRANG">Nha Trang</option>
                                        <option value="NINHHOA">Ninh Hòa</option>
                                        <option value="NAMCAN">Năm Căn</option>
                                        <option value="PHANTHIET">Phan Thiết</option>
                                        <option value="PHUYEN">Phú Yên</option>
                                        <option value="QUINHON">Qui Nhơn</option>
                                        <option value="QUANGNGAI">Quảng Ngãi</option>
                                        <option value="RACHGIA">Rạch Giá</option>
                                        <option value="SADEC">Sa Đéc</option>
                                        <option value="SOCTRANG">Sóc Trăng</option>
                                        <option value="TPHCM">TP.Hồ Chí Minh</option>
                                        <option value="THOTNOT">Thốt Nốt</option>
                                        <option value="TRAVINH">Trà Vinh</option>
                                        <option value="TUYHOA">Tuy Hòa</option>
                                        <option value="VINHLONG">Vĩnh Long</option>
                                        <option value="VUNGTAU">Vũng Tàu</option>
                                        <option value="VITHANH">Vị Thanh</option>
                                        <option value="DALAT">Đà Lạt</option>
                                        <option value="DANANG">Đà Nẵng</option>
                                        <option value="DAINGAI">Đại Ngãi</option>
                                        <option value="DAKLAK">Đắk Lắk</option>
                                        <option value="DAKNONG">Đắk Nông</option>
                                        <option value="DONGTHAP">Đồng Tháp</option>
                                    </select>
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                    <p>Ngày khởi hành <span>*</span></p><span class="icon-case"><i class="fa fa-calendar-alt"></i></span>
                                    <input type="date" name="prenom" id="prenom" data-rule="required" />
                                    <div class="validation"></div>
                                </div>
                            </div>
                            <div class="rightcontact">
                                <div class="form-group">
                                    <p>Điểm đến <span>*</span></p><span class="icon-case"><i class="fa fa-bus"></i></span>
                                    <div class="controls">
                                        <select name="idDest" id="idDest" class="form-control  selectpicker bs-select-hidden">
                                            <option value="TPHCM">TP.Hồ Chí Minh</option>
                                        </select>
                                    </div>
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="bouton-contact"><i class="fa fa-ticket-alt icon-flat"></i>Đặt mua</button>
                    </form>
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-6 result-panel">
                    <h1 class="title-name">Thông tin chung</h1>
                    <div class="row mg-t10 row-content"> <h5><strong>Chau Doc ⇒ Can Tho</strong> - Khoảng cách:&nbsp;<strong>116 Km</strong> - Thời gian:&nbsp;<strong>4 giờ</strong></h5>
                        <div ng-repeat="s in r.RouteStops" ng-if="s.Type == 0"> <span><i class="fa fa-dot-circle-o"></i>&nbsp;&nbsp;Bến đi:&nbsp;VP Châu Đốc: 89 Phan Văn Vàng, P.Châu Phú A , TP.Châu Đốc (TERMINAL BUS STATION)</span> </div>
                        <div ng-repeat="s in r.RouteStops" ng-if="s.Type == 0"> <span><i class="fa fa-dot-circle-o"></i>&nbsp;&nbsp;Bến đi:&nbsp;VP BX Châu Đốc, Đường Tôn Đức Thắng , P.Vĩnh Mỹ , TP.Châu Đốc (TERMINAL BUS STATION)</span> </div>
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
