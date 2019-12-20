package com;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Member implements Serializable {
    private String name;
    private String money;

    public String getName() {
        return name;
    }

    public Member setName(String name) {
        this.name = name;
        return this;
    }

    public String getMoney() {
        return money;
    }

    public Member setMoney(String money) {
        this.money = money;
        return this;
    }
}
