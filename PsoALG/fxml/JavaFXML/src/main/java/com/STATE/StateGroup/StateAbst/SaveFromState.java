package com.STATE.StateGroup.StateAbst;

import com.singleton.HBoxSingle;
import com.singleton.HBoxVisible;
import javafx.application.Platform;

public abstract class SaveFromState extends FormState{

    protected void setVisibleHBox(){
        HBoxSingle.getInstance().getBottomHBox().setVisible(HBoxVisible.getInstance().isVİSİBLE());
        HBoxSingle.getInstance().getSaveForm().setVisible(!HBoxVisible.getInstance().isVİSİBLE());
        HBoxVisible.getInstance().setVİSİBLE();
    }
    protected void minimizeMainWindow(){
        super.minimizeMainWindow();
    }

}
