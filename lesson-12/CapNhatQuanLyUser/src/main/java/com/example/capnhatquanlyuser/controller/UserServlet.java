package com.example.capnhatquanlyuser.controller;

import com.example.capnhatquanlyuser.model.User;
import com.example.capnhatquanlyuser.model.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name="UserServlet",urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private UserDAO userDAO;
    private static final Long serialVersionUID =1L;
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action==null){
            action="";
        }
        try {
            switch (action) {
                case "create":
                    insertUsers(req, resp);
                    break;
                case "edit":
                    updateUsers(req, resp);
                    break;
                case "search":
                    searchUsers(req,resp);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void searchUsers(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        String country = req.getParameter("country");
        List<User> users = userDAO.selectUserByCountry(country);
        req.setAttribute("users", users);
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(req, resp);
    }

    private void updateUsers(HttpServletRequest req, HttpServletResponse resp) throws SQLException{
    }

    private void insertUsers(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        User newUser = new User(name, email, country);
        userDAO.insertUser(newUser);
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/insert.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action==null){
            action="";
        }
        try {
            switch (action){
                case "create":
                    showCreateForm(req,resp);
                    break;
                case "edit":
                    showEditForm(req,resp);
                    break;
                case "delete":
                    deleteUsers(req,resp);
                    break;
                case "search":
                    showSearchForm(req, resp);
                    break;
                default:
                    listUsers(req,resp);
                    break;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    private void showSearchForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("user/search.jsp");
        requestDispatcher.forward(req, resp);
    }

    private void listUsers(HttpServletRequest req, HttpServletResponse resp) throws SQLException,IOException,ServletException{
        List<User> users =userDAO.selectAllUsers();
        req.setAttribute("users",users);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("user/list.jsp");
        requestDispatcher.forward(req,resp);
    }

    private void deleteUsers(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("user/insert.jsp");
        dispatcher.forward(req, resp);
    }

}
