package com.example.ungdungquanlykhachhang;

import com.example.ungdungquanlykhachhang.model.Customer;
import com.example.ungdungquanlykhachhang.service.CustomerService;
import com.example.ungdungquanlykhachhang.service.CustomerServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name="CustomerServlet",urlPatterns = "/customers")
public class CustomerServlet extends HttpServlet {
    private final CustomerService customerService = new CustomerServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action==null){
            action ="";
        }
        switch (action){
            case "create":
                createCustomer(req,resp);
                break;
            case "edit":
                editCustomer(req,resp);
                break;
            case "remove":
                removeCustomer(req,resp);
                break;
            default:
                break;
        }
    }

    private void createCustomer(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        int id = (int) (Math.random()*100);
        Customer customer = new Customer(id,name,email,address);
        this.customerService.save(customer);
        RequestDispatcher dispatcher = req.getRequestDispatcher("customer/create.jsp");
        req.setAttribute("message","New customer was created");
        try {
            dispatcher.forward(req,resp);
        }catch (ServletException | IOException e){
            e.printStackTrace();
        }
    }
    private void removeCustomer(HttpServletRequest request ,HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        RequestDispatcher requestDispatcher;
        if(customer==null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        }
        else {
            this.customerService.remove(id);
            try {
                response.sendRedirect("/customers");
            }catch (IOException e){
                e.printStackTrace();
            }
        }
    }
    private void editCustomer(HttpServletRequest request , HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = this.customerService.findById(id);
        RequestDispatcher dispatcher;
        if(customer==null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        }else {
            customer.setName(name);
            customer.setEmail(email);
            customer.setAddress(address);
            this.customerService.update(id,customer);
            request.setAttribute("customer",customer);
            request.setAttribute("message","Customer information was updated");
            dispatcher = request.getRequestDispatcher("customer.jsp");
        }try {
            dispatcher.forward(request,response);
        }catch (IOException | ServletException e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action){
            case "create":
                showCreateFrom(req,resp);
                break;
            case "edit":
                showEditForm(req,resp);
                break;
            case "delete":
                showDeleteForm(req,resp);
                break;
            case "view":
                showViewForm(req,resp);
                break;
            default:
                break;
        }
    }

    private void showViewForm(HttpServletRequest req, HttpServletResponse resp) {
            int id = Integer.parseInt(req.getParameter("id"));
            Customer customer  = this.customerService.findById(id);
            RequestDispatcher dispatcher;
            if(customer==null){
                dispatcher = req.getRequestDispatcher("error-404.jsp");
            }else {
                req.setAttribute("customer",customer);
                dispatcher = req.getRequestDispatcher("customer/view.jsp");
            }
            try {
                dispatcher.forward(req,resp);
            } catch (ServletException | IOException e) {
                throw new RuntimeException(e);
            }
    }

    private void showDeleteForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        RequestDispatcher dispatcher;
        if(customer==null){
            dispatcher = req.getRequestDispatcher("error-404.jsp");
        }
        else{
           req.setAttribute("customer",customer);
           dispatcher = req.getRequestDispatcher("customer/delete.jsp");
        }try {
            dispatcher.forward(req,resp);
        }catch (ServletException | IOException e){
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        RequestDispatcher dispatcher;
        if(customer == null){
            dispatcher = req.getRequestDispatcher("error-404.jsp");
        }
        else {
            req.setAttribute("customer",customer);
            dispatcher = req.getRequestDispatcher("customer/edit.jsp");
        }
        try {
            dispatcher.forward(req,resp);
        }catch (ServletException | IOException e){
            e.printStackTrace();
        }
    }

    private void showCreateFrom(HttpServletRequest req, HttpServletResponse resp) {
        RequestDispatcher dispatcher = req.getRequestDispatcher("customer/create.jsp");
        try {
            dispatcher.forward(req,resp);
        }catch(ServletException | IOException e){
            e.printStackTrace();
        }
    }
    // Phương thức trả về trang list.jsp để hiển thị toàn bộ customer.
    private void listCustomers(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customers = this.customerService.findAll();
        request.setAttribute("customers", customers);

        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
