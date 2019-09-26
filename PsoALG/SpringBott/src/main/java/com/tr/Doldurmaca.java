package com.tr;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class Doldurmaca {

    @Bean(name = "hirrim2")
    public Lastikler getLastik(){
        Lastikler lastikler = new Lastikler();
        lastikler.setSayi(15);

        return lastikler;
    }
    @Bean(name = "hirrim")
    public Lastikler getLastik2(){
        Lastikler lastikler = new Lastikler();
        lastikler.setSayi(25);

        return lastikler;
    }
}
