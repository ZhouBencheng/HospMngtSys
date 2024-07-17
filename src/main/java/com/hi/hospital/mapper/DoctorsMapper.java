package com.hi.hospital.mapper;

import com.hi.hospital.entity.Doctors;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DoctorsMapper {

    //多条件分页查询医生信息 (工号，姓名，科室id)
    public List<Doctors> selectAll(@Param("jobNumber")String jobNumber, @Param("name")String name, @Param("deptId")int deptId);

}
