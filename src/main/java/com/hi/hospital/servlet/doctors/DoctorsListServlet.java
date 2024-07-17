package com.hi.hospital.servlet.doctors;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import com.hi.hospital.entity.Doctors;
import com.hi.hospital.service.DoctorsServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/doctorsList")
public class DoctorsListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //请求乱码
        req.setCharacterEncoding("UTF-8");
        //响应乱码
        resp.setContentType("text/html;charset=UTF-8");

        String pageNum = req.getParameter("pageNum");
        int i = 1;
        if(pageNum != null && !pageNum.equals("")){
            i = Integer.parseInt(pageNum);
        }

        String jobNumber = req.getParameter("jobNumber");
        String docName = req.getParameter("docName");
        String deptId = req.getParameter("deptId");

        DoctorsServiceImpl service = new DoctorsServiceImpl();

        PageInfo<Doctors> pageInfo = service.queryByPage(i, 5, jobNumber, docName, deptId == null ? null : Integer.parseInt(deptId));

        ObjectMapper objectMapper = new ObjectMapper();
        String jsonStr = objectMapper.writeValueAsString(pageInfo);
        System.out.println("json string: " + jsonStr);
        resp.getWriter().write(jsonStr);

    }
}
