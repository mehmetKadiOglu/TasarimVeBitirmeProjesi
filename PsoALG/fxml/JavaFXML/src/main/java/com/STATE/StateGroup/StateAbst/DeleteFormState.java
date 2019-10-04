package com.STATE.StateGroup.StateAbst;

import com.singleton.HBoxSingle;
import com.singleton.HBoxVisible;
import javafx.application.Platform;

public abstract class DeleteFormState extends FormState {


    protected void setVisibleHBox(){
        HBoxSingle.getInstance().getTopHBox().setVisible(HBoxVisible.getInstance().isVİSİBLE());
        HBoxSingle.getInstance().getBottomHBoxUpdate().setVisible(HBoxVisible.getInstance().isVİSİBLE());
        HBoxSingle.getInstance().getDeleteForm().setVisible(!HBoxVisible.getInstance().isVİSİBLE());
        HBoxVisible.getInstance().setVİSİBLE();
    }
    protected void minimizeMainWindow(){
        super.minimizeMainWindow();
    }

}
