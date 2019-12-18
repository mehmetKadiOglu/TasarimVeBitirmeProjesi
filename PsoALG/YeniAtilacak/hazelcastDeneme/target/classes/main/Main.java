package com.main;

import com.Member;
import com.SpringCache.CacheSpring;
import com.timer.Deneme2;
import com.timer.MyTast;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import sun.net.sdp.SdpSupport;

import java.util.*;


@SpringBootApplication(scanBasePackages = "com")
public class Main implements CommandLineRunner {

    public static HashMap<String, String> hashMap = new HashMap<>();
    public static Timer timer = new Timer();

    @Autowired
    @Qualifier("cacheBean")
    CacheSpring cacheSpring;

    @Autowired
    Deneme2 deneme2;

    public static void main(String[] args) {
        SpringApplication.run(Main.class, "");

    }

    @Override
    public void run(String... args) throws Exception {
       /* putCacheMemberList();
        putCacheMember();
        cacheSpring.setMemberSize(cacheSpring.getMemberList().size());
        putMemberMoney();

        System.out.println("Member object = " + cacheSpring.getMember().getMoney() + " " + cacheSpring.getMember().getName());
        System.out.println("List size = " + cacheSpring.getMemberList().size());
        System.out.println("List size = " + cacheSpring.getMemberSize());
        System.out.println("Halil Money = " + cacheSpring.getMemberMoney("Halil"));
        System.out.println("Velihan Money = " +cacheSpring.getMemberMoney("Velihan"));

        cacheSpring.printAllCacheNames();*/

       hashMap.put("mehmet","mehmet");
       hashMap.put("mehmet1","mehmet1");
       hashMap.put("mehmet2","mehmet2");
       hashMap.put("mehmet3","mehmet3");
       hashMap.put("mehmet4","mehmet4");
       hashMap.put("mehmet5","mehmet5");
       hashMap.put("mehmet6","mehmet6");
       hashMap.put("mehmet7","mehmet7");
       hashMap.put("mehmet8","mehmet8");




        TimerTask tasknew = new MyTast().setKey("mehmet");
        TimerTask tasknew1 = new MyTast().setKey("mehmet1");
        TimerTask tasknew2 = new MyTast().setKey("mehmet2");
        TimerTask tasknew3 = new MyTast().setKey("mehmet3");
        TimerTask tasknew4 = new MyTast().setKey("mehmet4");
        MyTast myTast = new MyTast().setKey("mehmet5");
        myTast.myTast  = tasknew1;


        timer.schedule(tasknew, 1000);
        timer.schedule(tasknew1, 1000);
        timer.schedule(tasknew2, 1000);
        timer.schedule(tasknew3, 1000);
        timer.schedule(tasknew4, 4500);
        timer.schedule(myTast, 10000);
        System.out.println(System.currentTimeMillis());
        deneme2.denemeee();


    }
    private void putCacheMemberList(){
        List<Member> memberList = new ArrayList<>();
        Member member1 = new Member().setMoney("1500").setName("Ali");
        Member member2 = new Member().setMoney("2500").setName("Veli");
        Member member3 = new Member().setMoney("3500").setName("Mehmet");
        memberList.add(member1);
        memberList.add(member2);
        memberList.add(member3);
        cacheSpring.setMemberList(memberList);
    }
    private void putCacheMember(){
        Member member1 = new Member().setMoney("35000").setName("Ayşe");
        cacheSpring.setMember(member1);
    }
    private void putMemberMoney(){
        Member member1 = new Member().setMoney("198").setName("Halil");
        cacheSpring.setMemberMoney(member1);

        Member member2 = new Member().setMoney("1989").setName("Velihan");
        cacheSpring.setMemberMoney(member2);
    }
}
