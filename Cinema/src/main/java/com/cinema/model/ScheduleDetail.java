package com.cinema.entity;


public class ScheduleDetail {

    private int sched_id;
    private String studio_name;
    private String play_name;
    private String sched_time;
    private double sched_ticket_price;

    public ScheduleDetail(){}

    public int getSched_id() {
        return sched_id;
    }

    public void setSched_id(int sched_id) {
        this.sched_id = sched_id;
    }

    public String getStudio_name() {
        return studio_name;
    }

    public void setStudio_name(String studio_name) {
        this.studio_name = studio_name;
    }

    public String getPlay_name() {
        return play_name;
    }

    public void setPlay_name(String play_name) {
        this.play_name = play_name;
    }

    public String getSched_time() {
        return sched_time;
    }

    public void setSched_time(String sched_time) {
        this.sched_time = sched_time;
    }

    public double getSched_ticket_price() {
        return sched_ticket_price;
    }

    public void setSched_ticket_price(double sched_ticket_price) {
        this.sched_ticket_price = sched_ticket_price;
    }
}
