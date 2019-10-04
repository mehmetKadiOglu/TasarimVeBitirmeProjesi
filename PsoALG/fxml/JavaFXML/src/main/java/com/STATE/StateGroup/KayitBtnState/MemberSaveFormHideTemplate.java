package com.STATE.StateGroup.KayitBtnState;

import com.Facade.FxmlSetTextFacade;
import com.Facade.SaveDeleteFactoryFacade;
import com.STATE.StateGroup.StateAbst.SaveFromState;
import com.singleton.HBoxSingle;
import com.POJO.MemberPOJO;
import com.STATE.Handle.AbstractFormHandle;
import com.dd.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberSaveFormHideTemplate extends SaveFromState {
    @Autowired MemberSaveFormShow memberSaveFormShow;
    @Override
    public void Handle(AbstractFormHandle abstractFormHandle) {
        this.hide();
        abstractFormHandle.setKayitFormState(memberSaveFormShow);
        SaveDeleteFactoryFacade.getInstance().memberListAddNewMember();
        FxmlSetTextFacade.getInstance().setAddAllTextField(new MemberPOJO());
    }

    private void hide(){
        this.setVisibleHBox();
        this.minimizeMainWindow();
        HBoxSingle.getInstance().getTopHBox().setLayoutY(0);
        HBoxSingle.getInstance().getTopHBox().setMinWidth(220);
        HBoxSingle.getInstance().getTopHBox().setMinHeight(80);
    }
}
