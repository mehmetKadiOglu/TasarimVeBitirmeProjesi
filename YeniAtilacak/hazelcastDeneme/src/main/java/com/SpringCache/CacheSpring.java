package com.SpringCache;

import com.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;

@Component("cacheBean")
@CacheConfig(cacheNames = "cache")
public class CacheSpring {
    @Autowired
    private CacheManager cacheManager;

    @PostConstruct
    public void init(){
         cacheManager.getCacheNames().parallelStream().forEach(s -> cacheManager.getCache(s).clear());
    }

    public static final  String Key_List = "memberList";
    @Cacheable(value = Key_List, key = "#root.target.Key_List")
    public List<Member> getMemberList(){return  new ArrayList<>();}
    @CachePut(value = Key_List, key = "#root.target.Key_List")
    public List<Member> setMemberList(List<Member> memberList){return  memberList;}

    public static final String Member_Size = "memberSize";
    @Cacheable(value = Member_Size, key = "#root.target.Member_Size")
    public Integer getMemberSize(){return null;}
    @CachePut(value = Member_Size, key = "#root.target.Member_Size")
    public Integer setMemberSize(Integer size){return  size;}

    public static final String Member_Object = "memberKey";
    @Cacheable(value = Member_Object, key = "#root.target.Member_Object")
    public Member getMember(){return new Member();}
    @CachePut(value = Member_Object, key = "#root.target.Member_Object")
    public Member setMember(Member member){return member;}

    @Cacheable(value = "memberMoney", key = "#p0")
    public String getMemberMoney(String name){return null;}
    @CachePut(value =  "memberMoney", key = "#p0.name")
    public String setMemberMoney(Member member){return member.getMoney();}

    public void printAllCacheNames(){
        System.out.println("Cache Names");
        cacheManager.getCacheNames().parallelStream().forEach(System.out::println);
    }
    public void clearAllCache(){
        cacheManager.getCacheNames().parallelStream().forEach(s -> cacheManager.getCache(s).clear());
    }



}
