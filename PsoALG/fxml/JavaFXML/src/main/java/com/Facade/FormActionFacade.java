package com.Facade;

import com.POJO.MemberPOJO;
import com.STATE.Handle.SaveBtnHandle;
import com.STATE.Handle.UpdateBtnHandle;
import com.STATE.StateGroup.KayitBtnState.MemberSaveFormShow;
import com.STATE.Handle.DeleteBtnHandle;
import com.STATE.StateGroup.DeleteBtnState.MemberDeleteFormShow;
import com.STATE.StateGroup.UpdateBtnState.MemberUpdateFormShow;
import com.singleton.ListViewSingle;
import com.singleton.MemberListSingle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;

@Component
public class FormActionFacade {

    @Autowired
    SaveBtnHandle saveBtnHandle;
    @Autowired
    DeleteBtnHandle deleteBtnHandle;
    @Autowired
    UpdateBtnHandle updateBtnHandle;

    @Autowired
    MemberDeleteFormShow memberDeleteFormShow;
    @Autowired
    MemberSaveFormShow memberSaveFormShow;
    @Autowired
    MemberUpdateFormShow memberUpdateFormShow;

    private static FormActionFacade formActionFacade;

    @Autowired
    private void setFormActionFacade(FormActionFacade formActionFacade){
        FormActionFacade.formActionFacade = formActionFacade;
    }

    @PostConstruct
    private void init(){
        this.prepareBtnHandle();
    }
    public static FormActionFacade getInstance(){
        return formActionFacade;
    }

    private void prepareBtnHandle(){
        this.saveBtnHandle.setKayitFormState(this.memberSaveFormShow);
        this.deleteBtnHandle.setKayitFormState(this.memberDeleteFormShow);
        this.updateBtnHandle.setKayitFormState(this.memberUpdateFormShow);
    }

    public void saveBtnHandle(){
        this.saveBtnHandle.handle();
    }
    public void deleteBtnHandle(){
        this.deleteBtnHandle.handle();
    }

    public void updateBtnHandle(){ this.updateBtnHandle.handle();
    this.prepareUpdateFormMemberList();}
    private void prepareUpdateFormMemberList(){
        ListViewSingle.getInstance().getUpdateFormMemberList().getItems().clear();
        List<MemberPOJO> memberList = MemberListSingle.getInstance().getMemberList();
        for (MemberPOJO memberPOJO : memberList)
            ListViewSingle.getInstance().getUpdateFormMemberList().getItems().add(memberPOJO.getName() + " " + memberPOJO.getSurName());
    }
}
