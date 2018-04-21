<%-- 
    Document   : ticket-2
    Created on : Apr 21, 2018, 9:51:03 AM
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
                    <li  class="active first">Chọn ghế <span></span></li>
                    <li>Thông tin khách hàng <span></span></li>
                    <li>Thanh toán <span></span></li>
                </ul>
            </div>
            <!-- Heading Row -->
            <div class="row my-4">
                <div class="col-lg-4">
                    <form class="panel">
                        <h1 style="font-size: 16px;">Châu Đốc - Cần Thơ ngày 13-4-2018</h1>
                        <div class="contentform">
                            <div class="form-group">
                                <p>Chọn tuyến xe <span>*</span></p><span class="icon-case"><i class="fa fa-bus"></i></span>
                                <input type="input" name="prenom" id="prenom" disabled value="Châu Đốc => Cần Thơ" />
                                <div class="validation"></div>
                                <div class="form-group">
                                    <p>Chọn giờ khởi hành <span>*</span></p><span class="icon-case"><i class="fa fa-clock"></i></span>
                                    <select class="form-control">
                                        <option value="" label="05:00 (Ghế)" selected="selected">05:00 (Ghế)</option>
                                        <option value="" label="06:30 (Ghế)">06:30 (Ghế)</option>
                                        <option value="" label="08:00 (Ghế)">08:00 (Ghế)</option>
                                        <option value="" label="10:00 (Ghế)">10:00 (Ghế)</option>
                                        <option value="" label="11:30 (Ghế)">11:30 (Ghế)</option>
                                        <option value="" label="13:00 (Ghế)">13:00 (Ghế)</option>
                                        <option value="" label="14:30 (Ghế)">14:30 (Ghế)</option>
                                        <option value="" label="15:30 (Ghế)">15:30 (Ghế)</option>
                                        <option value="" label="17:00 (Ghế)">17:00 (Ghế)</option>
                                        <option value="" label="19:00 (Ghế)">19:00 (Ghế)</option>
                                    </select>
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                    <p>Điểm lên xe <span>*</span></p><span class="icon-case"><i class="fa fa-map-marker"></i></span>
                                    <select class="form-control">
                                        <option value="" label="VP Long Xuyên: 392 Phạm Cự Lượng, Khóm Tân Phú, Phường Mỹ Quý, Tp Long Xuyên">VP Long Xuyên: 392 Phạm Cự Lượng, Khóm Tân Phú, Phường Mỹ Quý, Tp Long Xuyên</option>
                                        <option value="" label="VP Lộ Tẻ: Ấp Bình Phú 1, Xã Bình Hòa, Châu Thành An Giang">VP Lộ Tẻ: Ấp Bình Phú 1, Xã Bình Hòa, Châu Thành An Giang</option>
                                    </select>
                                    <div class="validation"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-section">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 col-ms-12" style="margin-left: 20px;"> <a class="btn btn-primary btn-flat" style="color: white"><i class="fa fa-arrow-left icon-flat bg-btn-actived"></i> Quay lại</a>
                                <button type="submit" class="btn btn-success btn-flat"><i class="fa fa-arrow-right icon-flat "></i>Tiếp tục</button>
                            </div>
                        </div>
                    </form>
                    <div class="panel">
                        <p class="text-center text-uppercase text-primary">Thông tin chuyến</p>
                        <div id="step-info">
                            <table class="time-map table">
                                <tbody>
                                    <tr>
                                        <td>
                                            <p> <i class="fa fa-bus text-primary"></i> <strong>Xuất phát</strong> </p> <span>14-04-2018</span>
                                            <br> <span>05:00</span> </td>
                                        <td class="time-line">
                                            <div class="first"></div>
                                        </td>
                                        <td>
                                            <p>&nbsp;</p>
                                            <p> Châu Đốc
                                                <br> </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p> <i class="fa fa-clock"></i> Thời gian đi: 4 giờ </p>
                                        </td>
                                        <td class="time-line">
                                            <div class="middle"> </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p> <i class="fa fa-bus text-primary"></i> <strong>Đến lúc</strong> </p> <span>14-04-2018</span>
                                            <br> <span>08:30</span> </td>
                                        <td class="time-line ">
                                            <div class="end"></div>
                                        </td>
                                        <td>
                                            <p>&nbsp;</p>
                                            <p> Cần Thơ
                                                <br> </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-8">
                    <div class="panel">
                        <div>
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td> <strong class="text-uppercase">Số ghế:</strong> <span ng-show="info.selectSeats.length > 0" class="ng-hide">
                                                <!-- ngRepeat: s in info.selectSeats -->
                                            </span><span ng-show="info.selectSeats.length == 0" class="">Chưa chọn ghế</span> </td>
                                        <td class="text-right"> <strong class="text-uppercase">Tổng tiền:</strong> (<span class="text-primary" style="font-weight: 600;" ng-bind-html="info.total | svcMoney">0<sup>₫</sup></span>) </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div ng-switch-when="Ghế">
                            <table class="table grid-seat">
                                <thead>
                                    <tr>
                                        <th colspan="5">
                                            <p class="text-center text-uppercase text-primary">Sơ đồ Ghế</p>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">01: </p>
                                            <input type="checkbox" value="1" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">02: </p>
                                            <input type="checkbox" value="2" style="width: 20px;float: left;"> </td>
                                        <td></td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">03: </p>
                                            <input type="checkbox" value="4" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">04: </p>
                                            <input type="checkbox" value="5" style="width: 20px;float: left;"> </td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">05: </p>
                                            <input type="checkbox" value="5" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">06: </p>
                                            <input type="checkbox" value="6" style="width: 20px;float: left;"> </td>
                                        <td></td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">07: </p>
                                            <input type="checkbox" value="7" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">08: </p>
                                            <input type="checkbox" value="8" style="width: 20px;float: left;"> </td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">09: </p>
                                            <input type="checkbox" value="" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">10: </p>
                                            <input type="checkbox" value="" style="width: 20px;float: left;"> </td>
                                        <td></td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">11: </p>
                                            <input type="checkbox" value="" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">12: </p>
                                            <input type="checkbox" value="" style="width: 20px;float: left;"> </td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">13: </p>
                                            <input type="checkbox" value="1" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">14: </p>
                                            <input type="checkbox" value="2" style="width: 20px;float: left;"> </td>
                                        <td></td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">15: </p>
                                            <input type="checkbox" value="4" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">16: </p>
                                            <input type="checkbox" value="5" style="width: 20px;float: left;"> </td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">17: </p>
                                            <input type="checkbox" value="1" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">18: </p>
                                            <input type="checkbox" value="2" style="width: 20px;float: left;"> </td>
                                        <td></td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">19: </p>
                                            <input type="checkbox" value="4" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">20: </p>
                                            <input type="checkbox" value="5" style="width: 20px;float: left;"> </td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">21: </p>
                                            <input type="checkbox" value="1" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">22: </p>
                                            <input type="checkbox" value="2" style="width: 20px;float: left;"> </td>
                                        <td></td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">23: </p>
                                            <input type="checkbox" value="4" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">24: </p>
                                            <input type="checkbox" value="5" style="width: 20px;float: left;"> </td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">25: </p>
                                            <input type="checkbox" value="1" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">26: </p>
                                            <input type="checkbox" value="2" style="width: 20px;float: left;"> </td>
                                        <td></td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">27: </p>
                                            <input type="checkbox" value="4" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">28: </p>
                                            <input type="checkbox" value="5" style="width: 20px;float: left;"> </td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">29: </p>
                                            <input type="checkbox" value="1" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">30: </p>
                                            <input type="checkbox" value="2" style="width: 20px;float: left;"> </td>
                                        <td></td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">31: </p>
                                            <input type="checkbox" value="4" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">32: </p>
                                            <input type="checkbox" value="5" style="width: 20px;float: left;"> </td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">33: </p>
                                            <input type="checkbox" value="1" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">34: </p>
                                            <input type="checkbox" value="2" style="width: 20px;float: left;"> </td>
                                        <td></td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">35: </p>
                                            <input type="checkbox" value="4" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">36: </p>
                                            <input type="checkbox" value="5" style="width: 20px;float: left;"> </td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">37: </p>
                                            <input type="checkbox" value="1" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">38: </p>
                                            <input type="checkbox" value="2" style="width: 20px;float: left;"> </td>
                                        <td></td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">39: </p>
                                            <input type="checkbox" value="4" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">40: </p>
                                            <input type="checkbox" value="5" style="width: 20px;float: left;"> </td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">41: </p>
                                            <input type="checkbox" value="1" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">42: </p>
                                            <input type="checkbox" value="2" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">43: </p>
                                            <input type="checkbox" value="2" style="width: 20px;float: left;">
                                        </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">44: </p>
                                            <input type="checkbox" value="4" style="width: 20px;float: left;"> </td>
                                        <td>
                                            <p style="float: left;margin-top: 2px;margin-right: 2px;">45: </p>
                                            <input type="checkbox" value="5" style="width: 20px;float: left;"> </td>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
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
