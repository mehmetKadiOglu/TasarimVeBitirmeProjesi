package com.Factory.Delete;

import com.Facade.FxmlSetTextFacade;
import com.singleton.ListViewSingle;
import com.singleton.MemberListSingle;
import com.POJO.MemberPOJO;
import com.singleton.WillDeletedMemberListSingle;
import org.springframework.stereotype.Component;

import java.util.List;

@Component("memberListDeleteMember")
public class MemberListDeleteMember implements Delete {
    @Override
    public void delete() {

        this.deleteTemplate();

    }
    private void deleteTemplate(){
        this.memberListDeleteMember();
        this.memberListViewDeleteMember();
        this.memberDeleteListDeleteAllMember();
        this.deleteLabelDeleteText();
        this.willDeletedMemberListDeleteAllIndex();
    }

    private void memberListDeleteMember(){

        List<Integer> indexList = WillDeletedMemberListSingle.getInstance().getMemberDeleted();
        for (Integer index : indexList)
            MemberListSingle.getInstance().listMemberRemove(index);
    }
    private void memberListViewDeleteMember(){
        ListViewSingle.getInstance().getMemberList().getItems().clear();
        List<MemberPOJO> listMember = MemberListSingle.getInstance().getMemberList();
        for(MemberPOJO memberPOJO : listMember)
            ListViewSingle.getInstance().getMemberList().getItems().add(memberPOJO.getName() + " " + memberPOJO.getSurName());
    }

    private void memberDeleteListDeleteAllMember(){
        ListViewSingle.getInstance().getMemberDeleteList().getItems().clear();
    }
    private void willDeletedMemberListDeleteAllIndex(){
        WillDeletedMemberListSingle.getInstance().getMemberDeleted().clear();
    }
    private void deleteLabelDeleteText(){
        FxmlSetTextFacade.getInstance().setDeleteAllLabel(new MemberPOJO());
    }
}
