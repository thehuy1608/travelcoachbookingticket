/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    function handleSelectDepartureCity(element1)
    {
        if (element1.value !== undefined) {
            window.location = "/TravelCoachBookingTicket/ticket_1?button_action=select_departure_city&departure_city_index=" + element1.value;
        }
    }
    $("#departure").on("change", handleSelectDepartureCity(this));
    function handleSelectDestinationCity(element2) {
        if (element2.value !== undefined) {
            window.location = "/TravelCoachBookingTicket/ticket_1?button_action=select_destination_city&selected_destination_city_index_request=" + element2.value;
        }
    }

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
});

