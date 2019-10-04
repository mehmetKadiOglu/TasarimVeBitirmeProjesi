package com.singleton;

import com.POJO.MemberPOJO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class WillDeletedMemberListSingle {


    private static WillDeletedMemberListSingle willDeletedMemberListSingle;

    @Autowired
    private void setWillDeletedMemberListSingle(WillDeletedMemberListSingle willDeletedMemberListSingle){
        WillDeletedMemberListSingle.willDeletedMemberListSingle = willDeletedMemberListSingle;
    }


    private List<Integer> memberIndexList;
    public WillDeletedMemberListSingle(){ memberIndexList = new ArrayList<Integer>();}

    public static WillDeletedMemberListSingle getInstance(){
        return willDeletedMemberListSingle;
    }

    public List<Integer> getMemberDeleted() {
        return memberIndexList;
    }
    public void listMemberRemove(int index){ this.memberIndexList.remove(index);}

    public void addMemberDeletedIndex(Integer memberListIndex) {
        this.memberIndexList.add(memberListIndex);
    }
    public MemberPOJO getWillDeletedMember(Integer memberListIndex){
        return MemberListSingle.getInstance().getMember(this.memberIndexList.get(memberListIndex));
    }
}
