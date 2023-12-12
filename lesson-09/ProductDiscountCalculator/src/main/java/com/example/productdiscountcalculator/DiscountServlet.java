package com.example.productdiscountcalculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="DiscountServlet",urlPatterns = "/display-discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String description = req.getParameter("description");
        Double price=Double.parseDouble(req.getParameter("price"));
        Double percent = Double.parseDouble(req.getParameter("percent"));
        double discountAmount = price * percent * 0.01;
        double discountPrice = price - discountAmount;
        PrintWriter out = resp.getWriter();
        out.println("<html><body>");
        out.println("<h2>Product description: "+description+"</h2>");
        out.println("<p>List Price: " + price + "</p>");
        out.println("<p>Discount Percent: " + percent + "%</p>");
        out.println("<p>Discount Amount: " + discountAmount + "</p>");
        out.println("<p>Discount Price: " + discountPrice + "</p>");
        out.println("</body></html>");
    }
}
