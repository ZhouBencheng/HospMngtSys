package com.hi.hospital.mapper;

import com.hi.hospital.entity.Announcement;

import java.util.List;

public interface AnnouncementMapper {
    List<Announcement> selectAll();
}
