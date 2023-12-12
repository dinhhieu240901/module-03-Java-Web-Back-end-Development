package com.example.chuyendoitiente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ConverterServlet",urlPatterns = "/convert")
public class ConverterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        float rate = Float.parseFloat(req.getParameter("rate"));
        float usd = Float.parseFloat(req.getParameter("usd"));
        float vnd = rate*usd;
        PrintWriter out =resp.getWriter();
        out.println("<html><body>");
        out.println("<h3>Rate= "+rate+"</h3>");
        out.println("<h3>usd= "+usd+"</h3>");
        out.println("<h3>vnd =  "+vnd+"</h3>");
        out.println("</html>");

    }
}
