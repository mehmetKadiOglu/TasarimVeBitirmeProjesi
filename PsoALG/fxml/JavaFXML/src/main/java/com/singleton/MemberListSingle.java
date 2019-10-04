package com.singleton;

import com.POJO.MemberPOJO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class MemberListSingle {

    private static MemberListSingle memberListSingle;
    private List<MemberPOJO> memberList;

    @Autowired
    private void setMemberListSingle(MemberListSingle memberListSingle){
        MemberListSingle.memberListSingle = memberListSingle;
    }

    public MemberListSingle(){
        this.memberList = new ArrayList<MemberPOJO>();
    }

    public static MemberListSingle getInstance(){
        return memberListSingle;
    }

    public void addListNewMember(MemberPOJO memberPOJO){
        this.memberList.add(memberPOJO);
    }
    public void listMemberRemove(int index){this.memberList.remove(index);}
    public List<MemberPOJO> getMemberList(){
        return this.memberList;
    }
    public MemberPOJO getMember(int index){
        return this.memberList.get(index);
    }
    public void setMember(int index, MemberPOJO memberPOJO){this.memberList.set(index, memberPOJO);}



}
