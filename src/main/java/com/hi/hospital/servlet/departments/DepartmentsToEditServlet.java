package com.hi.hospital.servlet.departments;

import com.hi.hospital.entity.Departments;
import com.hi.hospital.service.DepartmentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 该servlet类型用于响应科室管理页面的“修改”按钮，跳转到"修改"页面
 */
@WebServlet("/departmentsToEdit")
public class DepartmentsToEditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 处理请求乱码
        req.setCharacterEncoding("utf-8");
        // 处理响应乱码
        resp.setContentType("text/html;charset=utf-8");

        int id = Integer.parseInt(req.getParameter("deptId"));
        DepartmentServiceImpl service = new DepartmentServiceImpl();
        Departments departments = service.queryById(id);

        req.setAttribute("departments", departments);
        req.getRequestDispatcher("view/admin/edit.jsp").forward(req, resp);
    }
}
