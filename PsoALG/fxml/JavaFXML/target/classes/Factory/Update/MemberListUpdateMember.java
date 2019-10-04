package com.Factory.Update;

import com.Facade.FxmlSetTextFacade;
import com.POJO.MemberPOJO;
import com.singleton.ListViewSingle;
import com.singleton.MemberListSingle;
import com.singleton.TextFieldSingle;
import org.springframework.stereotype.Component;

@Component("memberListUpdateMember")
public class MemberListUpdateMember implements Update {
    @Override
    public void update() {

       int index = ListViewSingle.getInstance().getUpdateFormMemberList().getSelectionModel().getSelectedIndex();
        MemberPOJO memberPOJO = this.updateMemberPrepare();

       MemberListSingle.getInstance().setMember( index, memberPOJO );

       ListViewSingle.getInstance().getUpdateFormMemberList().getItems().set(index, memberPOJO.getName() + " " + memberPOJO.getSurName() );
       ListViewSingle.getInstance().getMemberList().getItems().set(index, memberPOJO.getName() + " " + memberPOJO.getSurName());

        FxmlSetTextFacade.getInstance().setUpdateAllTextField(new MemberPOJO());
        FxmlSetTextFacade.getInstance().setUpdateAllLabel(new MemberPOJO());


    }
    private MemberPOJO updateMemberPrepare(){
        MemberPOJO memberPOJO = new MemberPOJO();

        memberPOJO.setName(TextFieldSingle.getInstance().getUpdateNameTxt().getText());
        memberPOJO.setSurName(TextFieldSingle.getInstance().getUpdateSurNameTxt().getText());
        memberPOJO.setSalary(TextFieldSingle.getInstance().getUpdateSalaryTxt().getText());

        return memberPOJO;


    }
}
