package com.hi.hospital.entity;

public class Departments {
     public int departmentsId;

    public String departmentsName;

    public int departmentsPid;

    public int departmentsLevel;

    public String departmentsPath;

    public String departmentsDescription;

    public int getDepartmentsId() {
        return departmentsId;
    }

    public void setDepartmentsId(int departmentsId) {
        this.departmentsId = departmentsId;
    }

    public String getDepartmentsDescription() {
        return departmentsDescription;
    }

    public void setDepartmentsDescription(String departmentsDescription) {
        this.departmentsDescription = departmentsDescription;
    }

    public int getDepartmentsPid() {
        return departmentsPid;
    }

    public void setDepartmentsPid(int departmentsPid) {
        this.departmentsPid = departmentsPid;
    }

    public int getDepartmentsLevel() {
        return departmentsLevel;
    }

    public void setDepartmentsLevel(int departmentsLevel) {
        this.departmentsLevel = departmentsLevel;
    }

    public String getDepartmentsPath() {
        return departmentsPath;
    }

    public void setDepartmentsPath(String departmentsPath) {
        this.departmentsPath = departmentsPath;
    }

    public String getDepartmentsName() {
        return departmentsName;
    }

    public void setDepartmentsName(String departmentsName) {
        this.departmentsName = departmentsName;
    }

    @Override
    public String toString() {
        return "Departments{" +
                "departmentsId=" + departmentsId +
                ", departmentsName='" + departmentsName + '\'' +
                ", departmentsPid=" + departmentsPid +
                ", departmentsLevel=" + departmentsLevel +
                ", departmentsPath='" + departmentsPath + '\'' +
                ", departmentsDescription='" + departmentsDescription + '\'' +
                '}';
    }
}
