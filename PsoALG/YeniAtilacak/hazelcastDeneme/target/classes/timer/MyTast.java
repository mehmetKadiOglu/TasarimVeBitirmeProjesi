package com.timer;

import com.main.Main;

import java.sql.Time;
import java.util.TimerTask;

public class MyTast extends TimerTask {
    private String key;
    public TimerTask myTast = null;

    public String getKey() {
        return key;
    }

    public MyTast setKey(String key) {
        this.key = key;
        return this;
    }

    @Override
    public void run() {
        Main.hashMap.remove(this.getKey());
        System.out.println("deleteeeee " + this.getKey());
        System.out.println(Main.hashMap.size());
        System.out.println("*************************");
        if (myTast != null){
            try {
                Main.timer.schedule(myTast, 500);
            }catch (Exception e){

            }

        }

    }
}
