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

    <body ng-app="">
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
                                        <c:set var="selected_schedule_index" value="${sessionScope.selected_schedule_index}" />
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
                                <button onclick="handleOnclickNextButton(this)" type="submit" class="btn btn-success btn-flat" onclick=""><i class="fa fa-arrow-right icon-flat "></i>Tiếp tục</button>
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
                                        <td> <strong class="text-uppercase">Số ghế:</strong> 

                                        </span><span  class="" id = "seat_numbers">Chưa chọn ghế</span> </td>
                                <td class="text-right"> <strong class="text-uppercase">Tổng tiền:</strong> <span id="total_price" class="text-primary" style="font-weight: 600;">0</span><sup>₫</sup></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div>
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
                                    <input id="seatCheckbox1" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat1" value="1" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_1}" ng-checked="${sessionScope.seat_status_1}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">11: </p>
                                    <input id="seatCheckbox11" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat11" value="11" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_11}" ng-checked="${sessionScope.seat_status_11}"> </td>
                                <td></td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">21: </p>
                                    <input id="seatCheckbox21" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat21" value="21" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_21}" ng-checked="${sessionScope.seat_status_21}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">31: </p>
                                    <input id="seatCheckbox31" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat31" value="31" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_31}" ng-checked="${sessionScope.seat_status_31}"> </td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">02: </p>
                                    <input id="seatCheckbox2" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat2" value="2" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_2}" ng-checked="${sessionScope.seat_status_2}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">12: </p>
                                    <input id="seatCheckbox12" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat12" value="12" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_12}" ng-checked="${sessionScope.seat_status_12}"> </td>
                                <td></td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">22: </p>
                                    <input id="seatCheckbox22" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat22" value="22" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_22}" ng-checked="${sessionScope.seat_status_22}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">32: </p>
                                    <input id="seatCheckbox32" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat32" value="32" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_32}" ng-checked="${sessionScope.seat_status_32}"> </td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">03: </p>
                                    <input id="seatCheckbox3" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat3" value="3" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_3}" ng-checked="${sessionScope.seat_status_3}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">13: </p>
                                    <input id="seatCheckbox13" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat13" value="13" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_13}" ng-checked="${sessionScope.seat_status_13}"> </td>
                                <td></td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">23: </p>
                                    <input id="seatCheckbox23" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat23" value="23" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_23}" ng-checked="${sessionScope.seat_status_23}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">33: </p>
                                    <input id="seatCheckbox33" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat33" value="33" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_33}" ng-checked="${sessionScope.seat_status_33}"> </td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">04: </p>
                                    <input id="seatCheckbox4" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat4" value="4" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_4}" ng-checked="${sessionScope.seat_status_4}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">14: </p>
                                    <input id="seatCheckbox14" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat14" value="14" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_14}" ng-checked="${sessionScope.seat_status_14}"> </td>
                                <td></td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">24: </p>
                                    <input id="seatCheckbox24" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat24" value="24" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_24}" ng-checked="${sessionScope.seat_status_24}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">34: </p>
                                    <input id="seatCheckbox34" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat34" value="34" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_34}" ng-checked="${sessionScope.seat_status_34}"> </td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">05: </p>
                                    <input id="seatCheckbox5" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat5" value="5" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_5}" ng-checked="${sessionScope.seat_status_5}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">15: </p>
                                    <input id="seatCheckbox15" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat15" value="15" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_15}" ng-checked="${sessionScope.seat_status_15}"> </td>
                                <td></td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">25: </p>
                                    <input id="seatCheckbox25" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat25" value="25" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_25}" ng-checked="${sessionScope.seat_status_25}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">35: </p>
                                    <input id="seatCheckbox35" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat35" value="35" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_35}" ng-checked="${sessionScope.seat_status_35}"> </td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">06: </p>
                                    <input id="seatCheckbox6" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat6" value="6" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_6}" ng-checked="${sessionScope.seat_status_6}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">16: </p>
                                    <input id="seatCheckbox16" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat16" value="16" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_16}" ng-checked="${sessionScope.seat_status_16}"> </td>
                                <td></td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">26: </p>
                                    <input id="seatCheckbox26" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat26" value="26" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_26}" ng-checked="${sessionScope.seat_status_26}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">36: </p>
                                    <input id="seatCheckbox36" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat36" value="36" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_36}" ng-checked="${sessionScope.seat_status_36}"> </td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">07: </p>
                                    <input id="seatCheckbox7" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat7" value="7" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_7}" ng-checked="${sessionScope.seat_status_7}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">17: </p>
                                    <input id="seatCheckbox17" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat17"  value="17" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_17}" ng-checked="${sessionScope.seat_status_17}"> </td>
                                <td></td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">27: </p>
                                    <input id="seatCheckbox27" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat27"  value="27" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_27}" ng-checked="${sessionScope.seat_status_27}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">37: </p>
                                    <input id="seatCheckbox37" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat37"  value="37" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_37}" ng-checked="${sessionScope.seat_status_37}"> </td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">08: </p>
                                    <input id="seatCheckbox8" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat8"  value="8" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_8}" ng-checked="${sessionScope.seat_status_8}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">18: </p>
                                    <input id="seatCheckbox18" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat18" value="18" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_18}" ng-checked="${sessionScope.seat_status_18}"> </td>
                                <td></td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">28: </p>
                                    <input id="seatCheckbox28" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat28" value="28" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_28}" ng-checked="${sessionScope.seat_status_28}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">38: </p>
                                    <input id="seatCheckbox38" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat38" value="38" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_38}" ng-checked="${sessionScope.seat_status_38}"> </td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">09: </p>
                                    <input id="seatCheckbox9" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat9" value="9" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_9}" ng-checked="${sessionScope.seat_status_9}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">19: </p>
                                    <input id="seatCheckbox19" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat19" value="19" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_19}" ng-checked="${sessionScope.seat_status_19}"> </td>
                                <td></td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">29: </p>
                                    <input id="seatCheckbox29" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat29" value="29" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_29}" ng-checked="${sessionScope.seat_status_29}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">39: </p>
                                    <input id="seatCheckbox39" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat39" value="39" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_39}" ng-checked="${sessionScope.seat_status_39}"> </td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">10: </p>
                                    <input id="seatCheckbox10" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat10" value="10" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_10}" ng-checked="${sessionScope.seat_status_10}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">20: </p>
                                    <input id="seatCheckbox20" onclick="handleOnclickSeatCheckbox(this)"  type="checkbox" name="seat20" value="20" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_20}" ng-checked="${sessionScope.seat_status_20}"> </td>
                                <td></td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">30: </p>
                                    <input id="seatCheckbox30" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat30" value="30" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_30}" ng-checked="${sessionScope.seat_status_30}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">40: </p>
                                    <input id="seatCheckbox40" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat40" value="40" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_40}" ng-checked="${sessionScope.seat_status_40}"> </td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">45: </p>
                                    <input id="seatCheckbox45" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat45" value="45" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_45}" ng-checked="${sessionScope.seat_status_45}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">44: </p>
                                    <input id="seatCheckbox44" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat44" value="44" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_44}" ng-checked="${sessionScope.seat_status_44}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">43: </p>
                                    <input id="seatCheckbox43" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat43" value="43" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_43}" ng-checked="${sessionScope.seat_status_43}">
                                </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">42: </p>
                                    <input id="seatCheckbox42" onclick="handleOnclickSeatCheckbox(this)" type="checkbox" name="seat42" value="42" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_42}" ng-checked="${sessionScope.seat_status_42}"> </td>
                                <td>
                                    <p style="float: left;margin-top: 2px;margin-right: 2px;">41: </p>
                                    <input id="seatCheckbox41" onclick="handleOnclickSeatCheckbox(this)" type="checkbox"  name="seat41" value="41" style="width: 20px;float: left;" ng-disabled="${sessionScope.seat_status_41}" ng-checked="${sessionScope.seat_status_41}"> </td>
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
    <script src="js/angular-js.js"></script>
    <script>
                                        var chosen_seat_numbers = [];
                                        var total_price = 0;
                                        function handleSelectLine(element)
                                        {
                                            window.location = "/TravelCoachBookingTicket/ticket_2?button_action=select_line&line_id=" + element.value;
                                        }
                                        function handleSelectStartTime(element) {
                                            window.location = "/TravelCoachBookingTicket/ticket_2?button_action=select_start_time&schedule_index=" + element.value;
                                        }
                                        function handleOnclickSeatCheckbox(element) {
                                            var prefix = 'seatCheckbox';
                                            var seat_number = element.value;
                                            var seat_id = prefix + seat_number;
                                            var checked_value = document.querySelector('#' + seat_id).checked;
                                            if (checked_value) {
                                                chosen_seat_numbers.push(seat_number);
                                                total_price = total_price + 100000;
                                            } else {
                                                total_price = total_price - 100000;
                                                var index = chosen_seat_numbers.indexOf(seat_number);
                                                if (index > -1) {
                                                    chosen_seat_numbers.splice(index, 1);
                                                }
                                            }
                                            if (chosen_seat_numbers.length === 0) {
                                                document.getElementById("seat_numbers").innerHTML = "Chưa chọn ghế.";
                                            } else {
                                                document.getElementById("seat_numbers").innerHTML = chosen_seat_numbers.join();
                                            }
                                            document.getElementById("total_price").innerHTML = total_price;
                                        }
                                        function handleOnclickNextButton(element) {
                                            if (chosen_seat_numbers.length !== 0) {
                                                window.location = "/TravelCoachBookingTicket/ticket_3?button_action=redirect_to_ticket_3&chosen_seat_numbers=" + chosen_seat_numbers;
                                            }
                                        }
    </script>
</body>

</html>
