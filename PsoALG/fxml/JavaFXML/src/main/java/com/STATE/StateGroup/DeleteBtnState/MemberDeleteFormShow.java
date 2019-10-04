package com.STATE.StateGroup.DeleteBtnState;

import com.STATE.StateGroup.StateAbst.DeleteFormState;
import com.singleton.HBoxSingle;
import com.STATE.Handle.AbstractFormHandle;
import com.dd.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberDeleteFormShow extends DeleteFormState {

    @Autowired
    MemberDeleteFormHideTemplate memberDeleteFormHideTemplate;

    @Override
    public void Handle(AbstractFormHandle abstractFormHandle) {

        this.show();
        abstractFormHandle.setKayitFormState(memberDeleteFormHideTemplate);
    }

    private void show(){


        this.setVisibleHBox();
        Main.scene.getWindow().setHeight(350);
        Main.scene.getWindow().setWidth(620);


        HBoxSingle.getInstance().getBottomHBox().setLayoutY(230);
        HBoxSingle.getInstance().getBottomHBox().setMinWidth(620);
        HBoxSingle.getInstance().getBottomHBoxDelete().setMinWidth(620);

    }
}
