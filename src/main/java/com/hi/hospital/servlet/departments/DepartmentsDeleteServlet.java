package com.hi.hospital.servlet.departments;

import com.hi.hospital.service.DepartmentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/departmentsDelete")
public class DepartmentsDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("deptId");
        id = id.replace(" ", "");
        System.out.println("Succeed to get the item to delete id: " + id);
        new DepartmentServiceImpl().deleteById(Integer.parseInt(id));
    }
}
