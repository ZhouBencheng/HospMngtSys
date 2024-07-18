package com.hi.hospital.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hi.hospital.entity.Announcement;
import com.hi.hospital.mapper.AnnouncementMapper;
import com.hi.hospital.utils.MyBatisUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class AnnouncementServiceImpl {
   public PageInfo queryAll(int pageNum, int pageSize) {
        SqlSession sqlSession  = MyBatisUtils.getSqlSession();
        AnnouncementMapper announcementMapper = sqlSession.getMapper(AnnouncementMapper.class);

        PageHelper.startPage(pageNum, pageSize);
        List<Announcement> list = announcementMapper.selectAll();
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }
}
