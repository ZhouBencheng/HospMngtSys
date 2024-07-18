package com.hi.hospital.entity;

public class DoctorSchedule {

    private Integer scheduleId;
    private Integer doctorId;
    private String date;
    private String shiftTime;
    private Integer departmentId;
    private Integer isAvailable;
    private Integer visitCount;
    private String remarks;

    private Departments departments;
    private Doctors doctors;

    public Integer getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(Integer scheduleId) {
        this.scheduleId = scheduleId;
    }

    public Integer getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getShiftTime() {
        return shiftTime;
    }

    public void setShiftTime(String shiftTime) {
        this.shiftTime = shiftTime;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public Integer getIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(Integer isAvailable) {
        this.isAvailable = isAvailable;
    }

    public Integer getVisitCount() {
        return visitCount;
    }

    public void setVisitCount(Integer visitCount) {
        this.visitCount = visitCount;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Departments getDepartments() {
        return departments;
    }

    public void setDepartments(Departments departments) {
        this.departments = departments;
    }

    public Doctors getDoctors() {
        return doctors;
    }

    public void setDoctors(Doctors doctors) {
        this.doctors = doctors;
    }


    @Override
    public String toString() {
        return "DoctorSchedule{" +
                "scheduleId=" + scheduleId +
                ", doctorId=" + doctorId +
                ", date='" + date + '\'' +
                ", shiftTime='" + shiftTime + '\'' +
                ", departmentId=" + departmentId +
                ", isAvailable=" + isAvailable +
                ", visitCount=" + visitCount +
                ", remarks='" + remarks + '\'' +
                ", departments=" + departments +
                ", doctors=" + doctors +
                '}';
    }

}
