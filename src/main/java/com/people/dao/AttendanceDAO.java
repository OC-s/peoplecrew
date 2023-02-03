package com.people.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.people.dto.AttendanceDTO;
import com.people.dto.AttdStartEnd;

@Repository
@Mapper
public interface AttendanceDAO {
	List<AttendanceDTO> getAll();
	List<AttendanceDTO> readAll(AttdStartEnd se);
	AttendanceDTO admingetOne(int mno);
	AttendanceDTO getAOne(AttdStartEnd se);
	int getTotal();
	String work_day(String aid);
	void insertOne(AttendanceDTO dto);
	void updateOne(AttendanceDTO dto);
}
