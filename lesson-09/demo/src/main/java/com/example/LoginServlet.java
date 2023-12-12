package com.example;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet",value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if("hieu".equals(username) && "hieu".equals(password)){
            request.getSession().setAttribute("username", username);// lưu username vào trong session
            response.sendRedirect("welcome.jsp");
        }
        else{
            request.getSession().setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!Vui lòng nhập lại");
            response.sendRedirect("index.jsp");
        }
    }
}
