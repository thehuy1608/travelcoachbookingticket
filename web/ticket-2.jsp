<%-- 
    Document   : ticket-2
    Created on : Apr 21, 2018, 9:51:03 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
                        <h1 style="font-size: 14px;">${sessionScope.trip_info}</h1>
                        <div class="contentform">
                            <div class="form-group">
                                <p>Chọn tuyến xe <span>*</span></p><span class="icon-case"><i class="fa fa-bus"></i></span>
                                    <c:set var="line_id" value="${sessionScope.line_id}" />
                                <select name="line" id="prenom" class="form-control" onchange="handleSelectLine(this)">
                                    <option value="" disabled selected>&nbsp;</option>
                                    <c:forEach items="${sessionScope.line_list}" var="line">
                                        <c:if test="${line.getLineId() == line_id}">
                                            <option value="${line.getLineId()}" selected>${line.getLineName()}</option>
                                        </c:if>
                                        <c:if test="${line.getLineId() != line_id}">
                                            <option value="${line.getLineId()}">${line.getLineName()}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                                <div class="validation"></div>
                                <div class="form-group">
                                    <p>Chọn giờ khởi hành <span>*</span></p><span class="icon-case"><i class="fa fa-clock"></i></span>
                                        <c:set var="schedule_index" value="${0}" />
                                        <c:set var="selected_schedule_index" value="${requestScope.selected_schedule_index}" />
                                    <select name="start_time" class="form-control" onchange="handleSelectStartTime(this)">
                                        <option value="" disabled selected>&nbsp;</option>
                                        <c:forEach items="${sessionScope.schedule_list}" var="schedule">
                                            <c:if test="${selected_schedule_index == schedule_index}">
                                                <option value="${schedule_index}" selected>${schedule.getStartTime()}</option>
                                            </c:if>
                                            <c:if test="${selected_schedule_index != schedule_index}">
                                                <option value="${schedule_index}">${schedule.getStartTime()}</option>
                                            </c:if>
                                            <c:set var="schedule_index" value="${schedule_index + 1}" />
                                        </c:forEach>
                                    </select>
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                    <p>Điểm lên xe <span>*</span></p>
                                    <textarea name="" id="" cols="45" rows="10" readonly class="form-control" style="background-color: white">${sessionScope.departure_station_address}</textarea>
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                    <p>Điểm xuống xe <span>*</span></p>
                                    <textarea name="" id="" cols="45" rows="10" readonly class="form-control" style="background-color: white">${sessionScope.destination_station_address}</textarea>
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
                                            <p> <i class="fa fa-bus text-primary"></i> <strong>Xuất phát</strong> </p> <span>${sessionScope.start_date_format}</span>
                                            <br> <span>${sessionScope.start_time_string}</span> </td>
                                        <td class="time-line">
                                            <div class="first"></div>
                                        </td>
                                        <td>
                                            <p>&nbsp;</p>
                                            <p> ${sessionScope.departure_city_name}
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
                                            <p> ${sessionScope.destination_city_name}
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
            <script>
                                            function handleSelectLine(element)
                                            {
                                                window.location = "/TravelCoachBookingTicket/ticket_2?button_action=select_line&line_id=" + element.value;
                                            }
                                            function handleSelectStartTime(element) {
                                                window.location = "/TravelCoachBookingTicket/ticket_2?button_action=select_start_time&schedule_index=" + element.value;
                                            }
            </script>
    </body>

</html>
