package com.hi.hospital.servlet.departments;

import com.hi.hospital.service.DepartmentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/departmentsEdit")
public class DepartmentsEditServlet extends HttpServlet {
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

        String id = req.getParameter("deptId");
        String name = req.getParameter("deptName");
        String desc = req.getParameter("deptDesc");
        id = id.replace(" ", "");
        System.out.println("Succeeded to get edit department id: " + id);

        DepartmentServiceImpl service = new DepartmentServiceImpl();
        try {
            service.updateById(Integer.parseInt(id), name, desc);
            resp.sendRedirect("/departmentsList");
        } catch (NumberFormatException e) {
            // 当id不是数字时，会抛出NumberFormatException异常，此处跳转回修改页面
            e.printStackTrace();
            resp.sendRedirect("/departmentsToEdit?deptId=" + id
                                                + "$deptName=" + name
                                                + "$deptDesc=" + desc);
        }
    }
}
