package com.hi.hospital.servlet.announcement;

import com.github.pagehelper.PageInfo;
import com.hi.hospital.service.AnnouncementServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/announcementList")
public class AnnouncementListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageNum = req.getParameter("pageNum");
        if (pageNum == null || pageNum.isEmpty()) {
            pageNum = "1";
        }

        PageInfo pageInfo = new AnnouncementServiceImpl().queryAll(Integer.parseInt(pageNum), 5);

        req.setAttribute("pageInfo", pageInfo);
//        System.out.println(pageInfo);
        req.getRequestDispatcher("view/admin/announcement_list.jsp").forward(req, resp);

    }
}
