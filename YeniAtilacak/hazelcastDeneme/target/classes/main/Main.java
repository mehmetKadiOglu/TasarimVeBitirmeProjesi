package com.main;

import com.Member;
import com.SpringCache.CacheSpring;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.ArrayList;
import java.util.List;


@SpringBootApplication(scanBasePackages = "com")
public class Main implements CommandLineRunner {

    @Autowired
    @Qualifier("cacheBean")
    CacheSpring cacheSpring;

    public static void main(String[] args) {
        SpringApplication.run(Main.class, "");

    }

    @Override
    public void run(String... args) throws Exception {
        putCacheMemberList();
        putCacheMember();
        cacheSpring.setMemberSize(cacheSpring.getMemberList().size());
        putMemberMoney();

        System.out.println("Member object = " + cacheSpring.getMember().getMoney() + " " + cacheSpring.getMember().getName());
        System.out.println("List size = " + cacheSpring.getMemberList().size());
        System.out.println("List size = " + cacheSpring.getMemberSize());
        System.out.println("Halil Money = " + cacheSpring.getMemberMoney("Halil"));
        System.out.println("Velihan Money = " +cacheSpring.getMemberMoney("Velihan"));

        cacheSpring.printAllCacheNames();
        Integer as = 25;
        deneme123(as);

    }
    private void deneme123(int a){
        System.out.println(a);
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
