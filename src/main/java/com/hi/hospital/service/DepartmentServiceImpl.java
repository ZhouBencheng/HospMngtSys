package com.hi.hospital.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hi.hospital.entity.Departments;
import com.hi.hospital.mapper.DepartmentsMapper;
import com.hi.hospital.utils.MyBatisUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class DepartmentServiceImpl {

    /**
     * 查询所有部门信息
     * @param pageNum 当前页码
     * @param pageSize 单页显示的数据条数
     * @return 返回分割总列表得到的分页结构
     */
    public PageInfo queryAll(int pageNum, int pageSize) {
        // 调用MyBatisUtils，获取SqlSession
        SqlSession sqlSession = MyBatisUtils.getSqlSession();
        // 获取Departments映射接口实例
        DepartmentsMapper departmentsMapper = sqlSession.getMapper(DepartmentsMapper.class);
        // 使用PageHelper静态方法，设置分页信息
        PageHelper.startPage(pageNum, pageSize);
        // 调用selectAll方法，获取所有部门信息
        List<Departments> list = departmentsMapper.selectAll();
        // PageInfo类型封装了非常全面的分页属性
        PageInfo pageInfo = new PageInfo(list);
        System.out.println(list);
        return pageInfo;
    }

    /**
     * 通过父级科室查询所有附属的二级科室
     * @param deptPid 父级科室id
     * @return 返回所有附属的二级科室
     */
    public List<Departments> querySubPid(int deptPid) {
        SqlSession sqlSession = MyBatisUtils.getSqlSession();
        DepartmentsMapper departmentsMapper = sqlSession.getMapper(DepartmentsMapper.class);
        List<Departments> list = departmentsMapper.selectByPid(deptPid);
        return list;
    }

    /**
     * 根据科室id查询科室
     * @param id 科室id
     * @return 返回查询到的单个科室
     */
    public Departments queryById(int id) {
        SqlSession sqlSession = MyBatisUtils.getSqlSession();
        DepartmentsMapper departmentsMapper = sqlSession.getMapper(DepartmentsMapper.class);
        Departments departments = departmentsMapper.selectById(id);
        return departments;
    }

    /**
     * 根据id更新科室信息
     * @param id 科室id
     * @param name 修改后的科室名称
     * @param desc 修改后的科室描述
     */
    public void updateById(int id, String name, String desc) {
        SqlSession sqlSession = MyBatisUtils.getSqlSession();
        DepartmentsMapper departmentsMapper = sqlSession.getMapper(DepartmentsMapper.class);
        departmentsMapper.updateById(id, name, desc);
    }

    /**
     * 保存一条科室信息
     * @param deptPid 该科室的父级科室id
     * @param deptName 该科室名称
     * @param deptDesc 该科室描述
     */
    public void save(int deptPid, String deptName, String deptDesc){
        try {
            SqlSession sqlSession = MyBatisUtils.getSqlSession();
            DepartmentsMapper departmentsMapper = sqlSession.getMapper(DepartmentsMapper.class);

            Departments departments = departmentsMapper.selectByName(deptName);
            if (departments == null) { // 部门不存在，可执行插入
                departments = new Departments();
                departments.setDepartmentsId(departmentsMapper.getMaxId() + 1);
                departments.setDepartmentsName(deptName);
                departments.setDepartmentsDescription(deptDesc);

                if (deptPid == -1) { // 顶级部门
                    departments.setDepartmentsPid(0);
                    departments.setDepartmentsLevel(1);
                    departments.setDepartmentsPath("|" + departments.getDepartmentsId() + "|");
                } else { // 非顶级部门
                    Departments parentDept = departmentsMapper.selectById(deptPid);
                    if (parentDept == null) { // 父部门不存在
                        System.out.println("父部门不存在");
                        throw new Exception("父部门不存在");
                    } else { // 父部门存在
                        departments.setDepartmentsPid(deptPid);
                        departments.setDepartmentsLevel(parentDept.getDepartmentsLevel() + 1);
                        departments.setDepartmentsPath(parentDept.getDepartmentsPath() + "|" + departments.getDepartmentsId() + "|");
                    }
                }

                departmentsMapper.insert(departments);
            } else { //部门存在，不可执行插入
                System.out.println("部门已存在");
                throw new Exception("部门已存在");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
