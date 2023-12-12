package com.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
@WebServlet(name = "TemperatureConvertedServlet",urlPatterns = "/convert")
public class TemperatureConvertedServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String fahrenheitString = request.getParameter("fahrenheit");
        if (fahrenheitString != null && !fahrenheitString.isEmpty()) {
            try {
                double fahrenheit = Double.parseDouble(fahrenheitString);
                double celsius = (fahrenheit - 32) * 5 / 9;
                out.println("<html><body>");
                out.println("<h2>Temperature conversion result</h2>");
                out.println("<h4>Result: </h4>");
                out.println("<p>Fahrenheit: " + fahrenheit + "</p>");
                out.println("<p>Celsius: " + celsius + "</p>");
            } catch (NumberFormatException e) {
                out.println("<html>");
                out.println("<head><title>Error</title></head>");
                out.println("<body>");
                out.println("<h2>Error:</h2>");
                out.println("<p>Invalid input. Please enter a valid number.</p>");
                out.println("</body></html>");
            }
        } else {
            out.println("<html><body>");
            out.println("<h2>Error</h2>");
            out.println("Please enter temperature in fahrenheit");
            out.println("</body></html>");
        }

    }

}
