package com.STATE.StateGroup.UpdateBtnState;

import com.STATE.Handle.AbstractFormHandle;
import com.STATE.StateGroup.StateAbst.UpdateFormState;
import com.dd.Main;
import com.singleton.HBoxSingle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;

@Component
public class MemberUpdateFormShow extends UpdateFormState {

    @Autowired
    MemberUpdateFormHideTemplate memberUpdateFormHideTemplate;

    @Override
    public void Handle(AbstractFormHandle abstractFormHandle) {

        this.show();
        abstractFormHandle.setKayitFormState(this.memberUpdateFormHideTemplate);
    }

    private void show(){

        this.setVisibleHBox();

        Main.scene.getWindow().setHeight(350);
        Main.scene.getWindow().setWidth(520);



        HBoxSingle.getInstance().getBottomHBox().setLayoutY(210);

        HBoxSingle.getInstance().getBottomHBox().setMinWidth(520);
        HBoxSingle.getInstance().getBottomHBoxUpdate().setMinWidth(520);

        HBoxSingle.getInstance().getBottomHBoxDelete().setMaxWidth(0);
        HBoxSingle.getInstance().getBottomHBoxDelete().setMinWidth(0);

    }
}
