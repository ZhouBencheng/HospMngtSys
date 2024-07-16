package com.hi.hospital.mapper;

import com.hi.hospital.entity.Departments;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentsMapper {

    void updateById(@Param("id") int id, @Param("name") String name, @Param("desc")String desc);

    // 查询所有部门
    List<Departments> selectAll();

    // 查询id最大的部门
    int getMaxId();

    // 根据部门名字查询实体
    Departments selectByName(String name);

    int insert(Departments departments);

    Departments selectById(int id);

    List<Departments> selectByPid(int pid);

    // 根据id删除部门
    int deleteById(int id);
}
