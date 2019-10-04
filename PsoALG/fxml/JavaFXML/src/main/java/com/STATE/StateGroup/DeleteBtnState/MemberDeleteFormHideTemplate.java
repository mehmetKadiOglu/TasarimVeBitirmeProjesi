package com.STATE.StateGroup.DeleteBtnState;

import com.Facade.SaveDeleteFactoryFacade;

import com.STATE.StateGroup.StateAbst.DeleteFormState;
import com.singleton.HBoxSingle;
import com.STATE.Handle.AbstractFormHandle;
import com.dd.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDeleteFormHideTemplate extends DeleteFormState {

    @Autowired
    MemberDeleteFormShow memberDeleteFormShow;
    @Override
    public void Handle(AbstractFormHandle abstractFormHandle) {

        this.hide();
        abstractFormHandle.setKayitFormState( memberDeleteFormShow );
        SaveDeleteFactoryFacade.getInstance().memberListDeleteMember();

    }
    private void hide(){


        this.setVisibleHBox();
        this.minimizeMainWindow();

        HBoxSingle.getInstance().getBottomHBox().setLayoutY(80);
        HBoxSingle.getInstance().getBottomHBox().setMinWidth(220);
        HBoxSingle.getInstance().getBottomHBoxDelete().setMinWidth(110);
    }
}
