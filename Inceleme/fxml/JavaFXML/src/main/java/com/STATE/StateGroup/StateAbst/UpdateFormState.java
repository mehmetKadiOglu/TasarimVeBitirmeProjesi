package com.STATE.StateGroup.StateAbst;

import com.singleton.HBoxSingle;
import com.singleton.HBoxVisible;

public abstract class UpdateFormState extends FormState {
    protected void setVisibleHBox(){
        HBoxSingle.getInstance().getTopHBox().setVisible(HBoxVisible.getInstance().isVİSİBLE());
        HBoxSingle.getInstance().getBottomHBoxDelete().setVisible(HBoxVisible.getInstance().isVİSİBLE());
        HBoxSingle.getInstance().getUpdateForm().setVisible(!HBoxVisible.getInstance().isVİSİBLE());
        HBoxVisible.getInstance().setVİSİBLE();
    }

    protected void minimizeMainWindow(){
        super.minimizeMainWindow();
    }

}
