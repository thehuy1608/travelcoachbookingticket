<%-- 
    Document   : ticket-1
    Created on : Apr 21, 2018, 9:50:21 AM
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
        <link href="css/fontawesome-all.css" rel="stylesheet"> 
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript">
            function handleSelectDepartureCity(element)
            {
                window.location = "/TravelCoachBookingTicket/ticket_1?button_action=select_departure_city&departure_city_index=" + element.value;
            }
            function handleSelectDestinationCity(element) {
                window.location = "/TravelCoachBookingTicket/ticket_1?button_action=select_destination_city&selected_destination_city_index_request=" + element.value;
            }
        </script>
    </head>

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
                    <li class="active first">Chọn tuyến <span></span> </li>
                    <li>Chọn ghế <span></span></li>
                    <li>Thanh toán <span></span></li>
                </ul>
            </div>
            <!-- Heading Row -->
            <div class="row my-4">
                <div class="col-lg-6">
                    <form action="ticket_1" method="post">
                        <h1>Thông tin mua vé:</h1>
                        <div class="contentform">
                            <div class="leftcontact">
                                <div class="form-group">
                                    <c:set var="selected_departure_city_index" value="${sessionScope.selected_departure_city_index}"/>
                                    <c:set var="index" value="${0}" />
                                    <p>Điểm khởi hành <span>*</span></p><span class="icon-case"><i class="fa fa-bus"></i></span>
                                    <select onchange="javascript:handleSelectDepartureCity(this)"  id="departure" class="form-control selectpicker bs-select-hidden" name="departure_city_index" required>
                                        <option value="" disabled selected>&nbsp;</option>
                                        <c:forEach items="${sessionScope.departure_city_or_district_name_list}" var="departure_city_or_district_name">
                                            <c:choose>
                                                <c:when test="${selected_departure_city_index != null}">
                                                    <c:if test="${selected_departure_city_index == index}">
                                                        <option value="${index }" selected>
                                                            ${departure_city_or_district_name}
                                                        </option>
                                                    </c:if>
                                                    <c:if test="${selected_departure_city_index != index}">
                                                        <option value="${index }">
                                                            ${departure_city_or_district_name}
                                                        </option>
                                                    </c:if>
                                                </c:when>
                                                <c:when test="${selected_departure_city_index== null}">
                                                    <option value="${index}">
                                                        ${departure_city_or_district_name}
                                                    </option>
                                                </c:when>
                                            </c:choose>
                                            <c:set var="index" value="${index + 1}" />
                                        </c:forEach>
                                    </select>
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                    <p>Ngày khởi hành <span>*</span></p><span class="icon-case"><i class="fa fa-calendar-alt"></i></span>
                                    <input type="date" name="start_date" id="start_date" data-rule="required" required/>
                                    <div class="validation"></div>
                                </div>
                            </div>
                            <div class="rightcontact">
                                <div class="form-group">
                                    <p>Điểm đến <span>*</span></p><span class="icon-case"><i class="fa fa-bus"></i></span>
                                    <div class="controls">
                                        <c:set var="index1" value="${0}" />
                                        <select onchange="handleSelectDestinationCity(this)" name="destination_city_index" id="destination" class="form-control  selectpicker bs-select-hidden" required>
                                            <option value="" disabled selected>&nbsp;</option>
                                            <c:if test="${sessionScope.destination_city_or_district_name_list != null}">
                                                <c:forEach items="${sessionScope.destination_city_or_district_name_list}" var="destination_city_or_district_name">
                                                    <c:choose>
                                                        <c:when test="${selected_destination_city_index != null}">
                                                            <c:if test="${index1 == selected_destination_city_index}">
                                                                <option value="${index1}" selected>
                                                                    ${destination_city_or_district_name}
                                                                </option>
                                                            </c:if>
                                                            <c:if test="${index1 != selected_destination_city_index}">
                                                                <option value="${index1}">
                                                                    ${destination_city_or_district_name}
                                                                </option>
                                                            </c:if>
                                                        </c:when>
                                                        <c:when test="${selected_destination_city_index == null}">
                                                            <option value="${index1}">
                                                                ${destination_city_or_district_name}
                                                            </option>
                                                        </c:when>
                                                    </c:choose>
                                                    <c:set var="index1" value="${index1 + 1}" />
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                    <div class="validation"></div>
                                </div>
                                <div class="form-group">
                                </div>
                            </div>
                        </div>
                        <button type="submit" name="button_action" value="find_trip" class="bouton-contact"><i class="fa fa-ticket-alt icon-flat"></i>Đặt mua</button>
                    </form>
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-6 result-panel">
                    <h1 class="title-name">Thông tin chung</h1>
                    <div class="row mg-t10 row-content"> 
                        <h5>
                            <br>Tỉnh/thành phố đi:&nbsp;<strong id="google_map_departure">
                                <c:if test="${sessionScope.selected_departure_city_index != null}">
                                    ${sessionScope.departure_city_or_district_name_list.get(selected_departure_city_index)}.
                                </c:if>
                            </strong> 
                            <br>Tỉnh/thành phố đến:&nbsp;<strong id="google_map_destination">
                                <c:if test="${sessionScope.destination_city_or_district_name_list != null && selected_destination_city_index != null}">
                                    ${sessionScope.destination_city_or_district_name_list.get(selected_destination_city_index)}.
                                </c:if>
                            </strong> 
                            <br>Khoảng cách:&nbsp;<strong>
                                <c:if test="${sessionScope.distance != null}">
                                    ${sessionScope.distance}.
                                </c:if>
                                <c:if test="${sessionScope.distance == null}">
                                    &ensp;
                                </c:if>
                            </strong>
                            <br>Thời gian (dự kiến):&nbsp;<strong>
                                <c:if test="${sessionScope.duration != null}">
                                    ${sessionScope.duration}.
                                </c:if>
                                <c:if test="${sessionScope.duration == null}">
                                    &ensp;
                                </c:if>
                            </strong>
                        </h5>
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
        </div>
    </body>    
    <script>
        var today = new Date();
        var dd = today.getDate() + 1;
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();
        if (dd < 10) {
            dd = 1 + dd;
        }
        if (mm < 10) {
            mm = '0' + mm;
        }
        today = yyyy + '-' + mm + '-' + dd;
        document.getElementById("start_date").setAttribute("min", today);
    </script>
</html>
