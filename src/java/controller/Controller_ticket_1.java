/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.maps.DistanceMatrixApiRequest;
import com.google.maps.GeoApiContext;
import com.google.maps.errors.ApiException;
import com.google.maps.model.DistanceMatrix;
import com.google.maps.model.DistanceMatrixElement;
import com.google.maps.model.DistanceMatrixRow;
import com.google.maps.model.TrafficModel;
import com.google.maps.model.TransitMode;
import com.google.maps.model.TravelMode;
import com.google.maps.model.Unit;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.database.dao.CityOrDistrictDAO;
import model.database.dao.LineDAO;
import model.database.dao.TripDAO;
import model.database.pojo.Cityordistrict;
import model.database.pojo.Line;
import model.database.pojo.Trip;
import org.joda.time.DateTime;

/**
 *
 * @author User
 */
public class Controller_ticket_1 extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String button_action = request.getParameter("button_action");
            switch (button_action) {
                case "select_departure_city": {
                    //Get departure_city_name from combo box Departure City
                    int departure_city_index = Integer.parseInt(request.getParameter("departure_city_index"));
                    List<String> departure_city_or_district_name_list = CityOrDistrictDAO.get_city_or_district_name_list();
                    String departure_city_name = departure_city_or_district_name_list.get(departure_city_index);

                    //Get available destination city names of trip that has the departure city name above
                    List<String> destination_city_or_district_name_list = TripDAO.get_destination_city_name_list_by_departure_city_name(departure_city_name);

                    if (!destination_city_or_district_name_list.isEmpty()) {
                        session.setAttribute("destination_city_or_district_name_list", destination_city_or_district_name_list);
                    } else {
                        session.setAttribute("destination_city_or_district_name_list", null);
                    }
                    session.setAttribute("distance", null);
                    session.setAttribute("duration", null);
                    session.setAttribute("selected_destination_city_index", null);
                    session.setAttribute("selected_departure_city_index", departure_city_index);
                    RequestDispatcher rd = request.getRequestDispatcher(TICKET_1);
                    rd.forward(request, response);
                    break;
                }
                case "select_destination_city": {
                    int selected_destination_city_index = Integer.parseInt(request.getParameter("selected_destination_city_index_request"));
                    int selected_departure_city_index = (int) session.getAttribute("selected_departure_city_index");
                    session.setAttribute("selected_destination_city_index", selected_destination_city_index);

                    List<String> departure_city_or_district_name_list = CityOrDistrictDAO.get_city_or_district_name_list();
                    String departure_city_name = departure_city_or_district_name_list.get(selected_departure_city_index);
                    List<String> destination_city_or_district_name_list = TripDAO.get_destination_city_name_list_by_departure_city_name(departure_city_name);
                    if (!destination_city_or_district_name_list.isEmpty()) {
                        String destination_city_name = destination_city_or_district_name_list.get(selected_destination_city_index);
                        try {
                            GeoApiContext.Builder builder = new GeoApiContext.Builder();
                            builder.apiKey("AIzaSyAIUVFjHg840O3E0VNv6ZshOEcjr9U5UMA");
                            GeoApiContext context = builder.build();
                            DistanceMatrixApiRequest distanceMatrix = new DistanceMatrixApiRequest(context);
                            distanceMatrix.mode(TravelMode.DRIVING);
                            distanceMatrix.trafficModel(TrafficModel.OPTIMISTIC);
                            distanceMatrix.language("vi");
                            distanceMatrix.transitModes(TransitMode.BUS);
                            distanceMatrix.units(Unit.METRIC);
                            distanceMatrix.departureTime(new DateTime());
                            distanceMatrix.origins(departure_city_name);
                            distanceMatrix.destinations(destination_city_name);
                            DistanceMatrix await = distanceMatrix.await();
                            DistanceMatrixRow[] rows = await.rows;
                            for (DistanceMatrixRow row : rows) {
                                DistanceMatrixElement[] elements = row.elements;
                                for (DistanceMatrixElement element : elements) {
                                    session.setAttribute("distance", element.distance);
                                    session.setAttribute("duration", element.duration);
                                }
                            }
                        } catch (ApiException | InterruptedException | IOException ex) {
                            Logger.getLogger(Controller_ticket_1.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    } else {
                        session.setAttribute("distance", null);
                        session.setAttribute("duration", null);
                    }

                    RequestDispatcher rd = request.getRequestDispatcher(TICKET_1);
                    rd.forward(request, response);
                    break;
                }
                case "find_trip": {
                    int departure_city_id = Integer.parseInt(request.getParameter("departure_city_index")) + 1;
                    String departure_city_name = CityOrDistrictDAO.get_city_or_district_by_id(departure_city_id).getCityOrDistrictName();

                    int destination_city_index = Integer.parseInt(request.getParameter("destination_city_index"));
                    List<String> destination_city_or_district_name_list = TripDAO.get_destination_city_name_list_by_departure_city_name(departure_city_name);
                    String destination_city_name = destination_city_or_district_name_list.get(destination_city_index);
                    int destination_city_id = CityOrDistrictDAO.get_city_or_district_id_by_name(destination_city_name);

                    String start_date_string = request.getParameter("start_date");
                    String[] start_date_array = start_date_string.split("-");
                    String start_date_format = start_date_array[2] + " - " + start_date_array[1] + " - " + start_date_array[0];

                    List<Integer> trip_id_list = TripDAO.get_trip_id_list_by_city_departure_and_city_destination_id_and_start_date(departure_city_id, destination_city_id, start_date_string);
                    List<Integer> line_id_list = LineDAO.get_line_id_list_by_trip_id_list(trip_id_list);
                    List<Line> line_list = new ArrayList<>();
                    line_id_list.forEach(line_id -> {
                        Line line = LineDAO.get_line_by_line_id(line_id);
                        line_list.add(line);
                    });

                    String trip_info = departure_city_name + " - " + destination_city_name + "." + "<br>Ngày " + start_date_format + ".";

                    session.setAttribute("trip_info", trip_info);
                    session.setAttribute("line_list", line_list);
                    session.setAttribute("start_date", start_date_string);
                    session.setAttribute("departure_city_name", departure_city_name);
                    session.setAttribute("destination_city_name", destination_city_name);
                    session.setAttribute("start_date_format", start_date_format);

                    for (int i = 1; i <= 45; i++) {
                        String prefix = "seat_status_";
                        String param = prefix + i;
                        session.setAttribute(param, false);
                    }

                    RequestDispatcher rd = request.getRequestDispatcher(TICKET_2);
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
