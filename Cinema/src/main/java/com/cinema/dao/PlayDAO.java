package com.cinema.dao;

import com.cinema.entity.Play;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository("PlayDAO")
public interface PlayDAO {

    public void insertPlay(Play play);
    public void deletePlay(int play_id);
    public void updatePlay(Play play);

    public Play selectPlayByPlay_id(int play_id);
    public List<Play> selectPlayByPlay_type(String play_type);
    public List<Play> selectPlayByPlay_lang(String play_lang);
    public Play selectPlayByPlay_name(String play_name);
    public List<Play> selectPlayByPlay_introduction(String play_introduction);
    public List<Play> selectPlayByPlay_image(String play_image);
    public List<Play> selectPlayByPlay_length(int play_length);
    public List<Play> selectPlayByPlay_ticket_price(double play_ticket_price);
    public List<Play> selectPlayByPlay_status(int play_status);
    public List<Play> selectPlay();
}
