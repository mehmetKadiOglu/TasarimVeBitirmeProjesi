package com.STATE.StateGroup.KayitBtnState;

import com.STATE.StateGroup.StateAbst.SaveFromState;
import com.singleton.HBoxSingle;
import com.STATE.Handle.AbstractFormHandle;
import com.dd.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberSaveFormShow extends SaveFromState {

    @Autowired
    MemberSaveFormHideTemplate memberSaveFormHideTemplate;
    @Override
    public void Handle(AbstractFormHandle abstractFormHandle) {
        this.show();
        abstractFormHandle.setKayitFormState(memberSaveFormHideTemplate);
    }

    private void show(){

        this.setVisibleHBox();

        Main.scene.getWindow().setHeight(300);
        Main.scene.getWindow().setWidth(350);

        HBoxSingle.getInstance().getSaveForm().setMinWidth(350);
        HBoxSingle.getInstance().getTopHBox().setLayoutY(180);
        HBoxSingle.getInstance().getTopHBox().setMinWidth(350);
    }
}
