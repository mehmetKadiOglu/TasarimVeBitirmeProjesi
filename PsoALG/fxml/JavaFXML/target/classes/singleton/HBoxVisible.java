package com.singleton;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class HBoxVisible {

    private static HBoxVisible hBoxVisible;
    boolean VİSİBLE = false;

    public boolean isVİSİBLE() {
        return VİSİBLE;
    }

    public void setVİSİBLE() {
        this.VİSİBLE = !this.VİSİBLE;
    }

    @Autowired
    private void sethBoxVisible(HBoxVisible hBoxVisible){
        HBoxVisible.hBoxVisible = hBoxVisible;
    }

    public static HBoxVisible getInstance(){
        return hBoxVisible;
    }
}
