package com.STATE.StateGroup.UpdateBtnState;

import com.STATE.Handle.AbstractFormHandle;
import com.STATE.StateGroup.StateAbst.UpdateFormState;
import com.singleton.HBoxSingle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemberUpdateFormHideTemplate extends UpdateFormState {

    @Autowired
    MemberUpdateFormShow memberUpdateFormShow;

    @Override
    public void Handle(AbstractFormHandle abstractFormHandle) {

        this.hide();
        abstractFormHandle.setKayitFormState(memberUpdateFormShow);
    }

    private void hide(){
        this.minimizeMainWindow();
        this.setVisibleHBox();

        HBoxSingle.getInstance().getBottomHBox().setLayoutY(80);
        HBoxSingle.getInstance().getBottomHBox().setMinWidth(220);
        HBoxSingle.getInstance().getBottomHBoxDelete().setMinWidth(110);
        HBoxSingle.getInstance().getBottomHBoxUpdate().setMinWidth(110);
    }
}
