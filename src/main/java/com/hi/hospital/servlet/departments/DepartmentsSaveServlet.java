package com.hi.hospital.servlet.departments;

import com.hi.hospital.service.DepartmentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/departmentsSave")
public class DepartmentsSaveServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String deptPid = req.getParameter("deptPid");
        String departmentName = req.getParameter("departmentName");
        String departmentDescription = req.getParameter("departmentDescription");

        DepartmentServiceImpl departmentService = new DepartmentServiceImpl();
        try {
            // 执行保存操作
            departmentService.save(Integer.parseInt(deptPid), departmentName, departmentDescription);
            // 页面导航，保存成功
            resp.sendRedirect("/departmentsList");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
