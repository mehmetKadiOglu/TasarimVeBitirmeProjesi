package com.Factory;

import com.Factory.Delete.Delete;
import com.Factory.Save.Save;
import com.Factory.Update.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class MemberListTransactionFactory {

    @Autowired
    @Qualifier("memberListSaveNewMember")
    Save memberListSaveNewMember;

    @Autowired
    @Qualifier("memberListDeleteMember")
    Delete memberListDeleteMember;

    @Autowired
    @Qualifier("memberListUpdateMember")
    Update memberListUpdateMember;

    public Delete getMemberListDeleteMember() {
        return memberListDeleteMember;
    }

    public Save getMemberListSaveNewMember() {
        return memberListSaveNewMember;
    }

    public Update getMemberListUpdateMember() { return this.memberListUpdateMember;}
}
