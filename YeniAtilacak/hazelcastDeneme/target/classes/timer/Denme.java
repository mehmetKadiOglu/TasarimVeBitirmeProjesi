package com.timer;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class Denme {

    @After("execution (* com.timer.MyTast.run(..))")
    public void dsf(JoinPoint joinPoint){
        System.out.println("Bitttiiğ");
    }
}
