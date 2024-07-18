package com.hi.hospital.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hi.hospital.entity.DoctorSchedule;
import com.hi.hospital.mapper.DoctorScheduleMapper;
import com.hi.hospital.utils.MyBatisUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class DoctorScheduleServiceImpl {
    public PageInfo<DoctorSchedule> queryByPage(int pageNum, int pageSize, String date, String shiftTime, Integer deptId){
        SqlSession sqlSession = MyBatisUtils.getSqlSession();
        DoctorScheduleMapper mapper = sqlSession.getMapper(DoctorScheduleMapper.class);
        PageHelper.startPage(pageNum,pageSize);
        List<DoctorSchedule> list = mapper.selectAll(date, shiftTime, deptId);
        PageInfo<DoctorSchedule> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }
}
