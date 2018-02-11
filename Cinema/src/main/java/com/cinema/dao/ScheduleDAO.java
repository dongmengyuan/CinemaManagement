package com.cinema.dao;

import com.cinema.entity.Schedule;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository("ScheduleDAO")
public interface ScheduleDAO {

    public void insertSchedule(Schedule schedule);
    public void deleteSchedule(int sched_id);
    public void updateSchedule(Schedule schedule);

    public Schedule selectScheduleBySched_id(int sched_id);
    public List<Schedule> selectScheduleByStudio_id(int studio_id);
    public List<Schedule> selectScheduleBySpecialStudio_id(@Param(value = "studio_id") int studio_id,
                                                           @Param(value = "sched_id") int sched_id);
    public List<Schedule> selectScheduleByPlay_id(int play_id);
    public List<Schedule> selectScheduleBySched_time(String sched_time);
    public List<Schedule> selectScheduleBySched_ticket_price(double sched_ticket_price);
    public List<Schedule> selectSchedule();

}
