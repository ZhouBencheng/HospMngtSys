package com.hi.hospital.servlet.departments;

import com.github.pagehelper.PageInfo;
import com.hi.hospital.service.DepartmentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/departmentsList")
public class DepartmentsListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageNum_str = req.getParameter("pageNum");
        //转化为整型
        //用选择表达式的原因是，当第一次进入列表的时候默认显示第一页，这个时候获取不到pageNum，所以默认为1
        int pageNum = pageNum_str != null && pageNum_str.isEmpty() ? Integer.parseInt(pageNum_str) : 1;

        // 调用DepartmentServiceImpl的selectAll方法，获取所有部门信息
        PageInfo pageInfo = new DepartmentServiceImpl().queryAll(pageNum, 5);
        // 将list存入request域中，请求转发到departments_list.jsp
        req.setAttribute("pageInfo", pageInfo);
        // 请求转发到departments_list.jsp
        req.getRequestDispatcher("view/admin/departments_list.jsp").forward(req, resp);
    }
}
