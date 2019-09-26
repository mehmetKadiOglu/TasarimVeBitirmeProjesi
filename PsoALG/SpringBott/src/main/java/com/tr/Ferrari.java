package com.tr;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class Ferrari {

    @Autowired
    @Qualifier("hirrim")
    Lastikler lastikler;

    public void yazdir()
    {
        System.out.println(lastikler.toString());
    }
}
