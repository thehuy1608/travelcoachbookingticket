/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.api.date.DateToString;
import model.api.date.GetCurrentDate;
import model.database.dao.CustomerDAO;
import model.database.dao.InvoiceDAO;
import model.database.dao.InvoicelineitemDAO;
import model.database.dao.LineDAO;
import model.database.dao.SeatDAO;
import model.database.dao.TicketDAO;
import model.database.pojo.Customer;
import model.database.pojo.Invoice;
import model.database.pojo.Invoicelineitem;
import model.database.pojo.Line;
import model.database.pojo.Schedule;
import model.database.pojo.Seat;
import model.database.pojo.Ticket;
import model.database.pojo.Trip;

/**
 *
 * @author User
 */
public class Controller_ticket_3 extends HttpServlet {

    private static final String HOME = "index.jsp";
    private static final String TICKET_1 = "ticket-1.jsp";
    private static final String TICKET_2 = "ticket-2.jsp";
    private static final String TICKET_3 = "ticket-3.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String button_action = request.getParameter("button_action");
            switch (button_action) {
                case "redirect_to_ticket_3": {
                    String trip_name = (String) session.getAttribute("departure_city_name") + " - " + (String) session.getAttribute("destination_city_name");

                    int line_id = (int) session.getAttribute("line_id");
                    Line line = LineDAO.get_line_by_line_id(line_id);
                    String departure_station = line.getStationByDepartureStationId().getStationName() + " : " + (String) session.getAttribute("departure_station_address");
                    String destination_station = line.getStationByDestinationStationId().getStationName() + " : " + (String) session.getAttribute("destination_station_address");

                    int selected_schedule_index = (int) session.getAttribute("selected_schedule_index");
                    List<Schedule> schedule_list = (List<Schedule>) session.getAttribute("schedule_list");
                    Schedule schedule = schedule_list.get(selected_schedule_index);
                    String start_date_string = DateToString.convert_date_to_string(schedule.getStartDate());
                    String end_date_string = DateToString.convert_date_to_string(schedule.getEndDate());
                    String start_time_string = DateToString.convert_time_to_string(schedule.getStartTime());
                    String end_time_string = DateToString.convert_time_to_string(schedule.getEndTime());

                    String chosen_seat_numbers_string = request.getParameter("chosen_seat_numbers");
                    String[] chosen_seat_numbers_string_array = chosen_seat_numbers_string.split(",");
                    List<Byte> chosen_seat_numbers = new ArrayList<>();
                    for (String item : chosen_seat_numbers_string_array) {
                        byte chosen_set_number = Byte.parseByte(item);
                        chosen_seat_numbers.add(chosen_set_number);
                    }

                    int number_of_tickets = chosen_seat_numbers.size();
                    float ticket_price = (float) TicketDAO.get_ticket_price_by_trip_id(schedule.getTrip().getTripId());
                    float total_price = ticket_price * number_of_tickets;

                    session.setAttribute("trip_name", trip_name);
                    session.setAttribute("departure_station", departure_station);
                    session.setAttribute("destination_station", destination_station);
                    session.setAttribute("start_date_string", start_date_string);
                    session.setAttribute("start_time_string", start_time_string);
                    session.setAttribute("end_date_string", end_date_string);
                    session.setAttribute("end_time_string", end_time_string);
                    session.setAttribute("number_of_tickets", number_of_tickets);
                    session.setAttribute("chosen_seat_numbers_string", chosen_seat_numbers_string);
                    session.setAttribute("ticket_price", ticket_price);
                    session.setAttribute("total_price", total_price);
                    
                     int coach_id = (int) session.getAttribute("coach_id");
                    List<Seat> selected_seat_list = SeatDAO.get_seat_list_by_list_seat_number_list_and_coach_id(coach_id, chosen_seat_numbers);
                    session.setAttribute("selected_seat_list", selected_seat_list);

                    RequestDispatcher rd = request.getRequestDispatcher(TICKET_3);
                    rd.forward(request, response);
                    break;
                }
                case "order": {
                    Trip trip = (Trip) session.getAttribute("trip");
                    Date invoiceDueDate = GetCurrentDate.get_current_date();
                    float total_price = (float) session.getAttribute("total_price");
                    Date modifiedDate = GetCurrentDate.get_current_date();
                    String invoiceStatus = "Chưa thanh toán";
                    Date invoiceAddedDate = GetCurrentDate.get_current_date();

                    int coach_id = (int) session.getAttribute("coach_id");
                    int seat_exception;
                    int index = -1;
                    List<Seat> selected_seat_list = (List<Seat>) session.getAttribute("selected_seat_list");
                    for (Seat seat : selected_seat_list) {
                        seat_exception = seat.getSeatNumber();
                        index += 1;
                        byte seat_status = 1;
                        seat.setSeatStatus(seat_status);
                        try {
                            SeatDAO.update_seat(seat);
                        } catch (Exception e) {
                            for (int i = 0; i < index; i++) {
                                Seat roll_back_seat = selected_seat_list.get(i);
                                byte roll_back_seat_status = 0;
                                roll_back_seat.setSeatStatus(roll_back_seat_status);
                                SeatDAO.update_seat(roll_back_seat);
                            }
                            request.setAttribute("is_success_invoice", false);
                            request.setAttribute("error_message", seat_exception);
                            RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
                            rd.forward(request, response);
                        }
                    }

                    Invoice invoice = new Invoice(trip, invoiceDueDate, total_price, modifiedDate, invoiceStatus, invoiceAddedDate);
                    InvoiceDAO.add_invoice(invoice);
                    for (Seat seat : selected_seat_list) {
                        Ticket ticket = TicketDAO.get_ticket_by_seat_number_and_trip(seat.getSeatNumber(), trip);
                        Invoicelineitem line_item = new Invoicelineitem(invoice, ticket, ticket.getTicketPrice(), "Trống", GetCurrentDate.get_current_date());
                        InvoicelineitemDAO.add_invoice_line_item(line_item);
                    }
                    String customer_name = request.getParameter("customer_name");
                    String customer_phone_number = request.getParameter("customer_phone_number");
                    Customer customer = new Customer(invoice, customer_name, customer_phone_number, GetCurrentDate.get_current_date());
                    CustomerDAO.add_customer(customer);
                    
                    request.setAttribute("is_success_invoice", true);
                    RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
                    rd.forward(request, response);
                    break;
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
