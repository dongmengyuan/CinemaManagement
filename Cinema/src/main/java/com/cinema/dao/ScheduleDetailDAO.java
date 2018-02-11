package com.cinema.dao;

import com.cinema.entity.ScheduleDetail;
import org.springframework.stereotype.Repository;

import java.util.List;



@Repository("ScheduleDetailDAO")
public interface ScheduleDetailDAO {

    public List<ScheduleDetail> selectScheduleDetail();
    public ScheduleDetail selectOneScheduleDetail(int sched_id);
}
