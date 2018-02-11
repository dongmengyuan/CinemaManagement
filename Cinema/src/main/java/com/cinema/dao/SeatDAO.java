package com.cinema.dao;

import com.cinema.entity.Seat;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;


@Repository("SeatDAO")
public interface SeatDAO {

    public void insertSeat(Seat seat);
    public void deleteSeat(int seat_id);
    public void deleteAllSeat();
    public void updateSeat(Seat seat);

    public Seat selectSeatBySeat_id(int seat_id);
    public List<Seat> selectSeatByStudio_id(int studio_id);
    public List<Seat> selectSeatBySeat_row(int seat_row);
    public List<Seat> selectSeatBySeat_column(int seat_column);
    public List<Seat> selectSeatBySeat_status(int seat_status);
    public List<Seat> selectSeat();
    public Seat selectSeatByPosition(@Param(value ="studio_id") int studio_id,
                                        @Param(value="seat_row") int seat_row,
                                     @Param(value="seat_column") int seat_column);



}
