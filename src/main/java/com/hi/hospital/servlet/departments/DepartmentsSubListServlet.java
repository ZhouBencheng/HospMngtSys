package com.hi.hospital.servlet.departments;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hi.hospital.entity.Departments;
import com.hi.hospital.service.DepartmentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/departmentsSubList")
public class DepartmentsSubListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //解决json格式字符串中中文乱码的问题
        resp.setContentType("text/html;charset=utf-8");

        // 获取父科室的id
        String pid_str = req.getParameter("deptPid");
        int pid = Integer.parseInt(pid_str);
        List<Departments> list = new DepartmentServiceImpl().querySubPid(pid);

        // 获取json对象转换器
        ObjectMapper objectMapper = new ObjectMapper();
        // 将java列表转化为json格式的字符串进行传递
        String jsonStr = objectMapper.writeValueAsString(list);
        resp.getWriter().write(jsonStr);
    }
}
