package com.example.chuyendoitiente;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CurrencyConverterServlet", value = "/converts")
public class CurrencyConverterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            double amount = Double.parseDouble(request.getParameter("amount"));
            String fromCurrency = request.getParameter("fromCurrency");
            String toCurrency = request.getParameter("toCurrency");
            double convertedAmount = performCurrencyConversion(amount, fromCurrency, toCurrency);
            request.setAttribute("result", convertedAmount);
            request.getRequestDispatcher("/result.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid input. Please enter a valid number.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    private double performCurrencyConversion(double amount, String fromCurrency, String toCurrency) {
        double conversionRate = 1.0;
        return amount * conversionRate;
    }
}