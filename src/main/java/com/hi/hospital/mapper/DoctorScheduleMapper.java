package com.hi.hospital.mapper;


import com.hi.hospital.entity.DoctorSchedule;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DoctorScheduleMapper {
    public List<DoctorSchedule> selectAll(@Param("date")String date, @Param("shiftTime")String shiftTime, @Param("deptId")Integer deptId);

}
