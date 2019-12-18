package com.timer;

import com.main.Main;

import java.sql.Time;
import java.util.TimerTask;

public class MyTask extends TimerTask {
    private String key;

    private String getKey() {
        return key;
    }

    public MyTask setKey(String key) {
        this.key = key;
        return this;
    }
    @Override
    public void run() {
        Main.hashMap.remove(this.getKey());
        System.out.println("delete key " + this.getKey());
        System.out.println("*************************");
    }
}
