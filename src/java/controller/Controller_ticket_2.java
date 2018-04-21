/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.api.date.DateToString;
import model.database.dao.CoachDriverTripDAO;
import model.database.dao.LineDAO;
import model.database.dao.ScheduleDAO;
import model.database.dao.SeatDAO;
import model.database.pojo.CoachDriverTrip;
import model.database.pojo.Line;
import model.database.pojo.Schedule;
import model.database.pojo.Trip;

/**
 *
 * @author User
 */
public class Controller_ticket_2 extends HttpServlet {

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
            String button_action = request.getParameter("button_action");
            switch (button_action) {
                case "select_line": {
                    int line_id = Integer.parseInt(request.getParameter("line_id"));
                    String start_date_string = (String) session.getAttribute("start_date");

                    List<Schedule> schedule_list = ScheduleDAO.get_schedule_list_by_line_id_and_start_date_string(line_id, start_date_string);

                    Line line = LineDAO.get_line_by_line_id(line_id);
                    String departure_station_address = line.getStationByDepartureStationId().getStationAddress();
                    String destination_station_address = line.getStationByDestinationStationId().getStationAddress();

                    session.setAttribute("departure_station_address", departure_station_address);
                    session.setAttribute("destination_station_address", destination_station_address);
                    session.setAttribute("schedule_list", schedule_list);
                    session.setAttribute("line_id", line_id);

                    for (int i = 1; i <= 45; i++) {
                        String prefix = "seat_status_";
                        String param = prefix + i;
                        session.setAttribute(param, false);
                    }

                    RequestDispatcher rd = request.getRequestDispatcher(TICKET_2);
                    rd.forward(request, response);
                    break;
                }
                case "select_start_time": {
                    int schedule_index = Integer.parseInt(request.getParameter("schedule_index"));
                    List<Schedule> schedule_list = (List<Schedule>) session.getAttribute("schedule_list");
                    Schedule schedule = schedule_list.get(schedule_index);
                    Trip trip = schedule.getTrip();
                    CoachDriverTrip cdt = CoachDriverTripDAO.get_coach_driver_trip_by_trip(trip);
                    int coach_id = cdt.getCoach().getCoachId();

                    //Reset seat state
                    for (int i = 1; i <= 45; i++) {
                        String prefix = "seat_status_";
                        String param = prefix + i;
                        session.setAttribute(param, false);
                    }

                    List<Byte> selected_seat_list = SeatDAO.get_all_selected_seat_of_trip_by_coach_id(coach_id);
                    selected_seat_list.forEach(selected_seat -> {
                        String prefix = "seat_status_";
                        String param = prefix + selected_seat;
                        session.setAttribute(param, true);
                    });

                    session.setAttribute("start_time_string", DateToString.convert_time_to_string(schedule.getStartTime()));
                    session.setAttribute("selected_schedule_index", schedule_index);
                    session.setAttribute("trip", trip);
                    session.setAttribute("coach_id", coach_id);
                    RequestDispatcher rd = request.getRequestDispatcher(TICKET_2);
                    rd.forward(request, response);
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
