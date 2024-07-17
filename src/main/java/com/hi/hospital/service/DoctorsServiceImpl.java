package com.hi.hospital.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hi.hospital.entity.Doctors;
import com.hi.hospital.mapper.DoctorsMapper;
import com.hi.hospital.utils.MyBatisUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class DoctorsServiceImpl {

    public PageInfo<Doctors> queryByPage(int pageNum, int pageSize, String jobNumber, String name, Integer deptId){
        SqlSession sqlSession = MyBatisUtils.getSqlSession();
        DoctorsMapper mapper = sqlSession.getMapper(DoctorsMapper.class);
        PageHelper.startPage(pageNum,pageSize);
        List<Doctors> list = mapper.selectAll(jobNumber, name, deptId);
        PageInfo<Doctors> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

}
