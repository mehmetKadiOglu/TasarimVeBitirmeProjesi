package com.STATE.SilBtnState;

import com.POJO.HBoxPOJO;
import com.STATE.AbstractFormHandle;
import com.STATE.FormState;
import com.dd.Main;

public class SilFormShow implements FormState {
    @Override
    public void Handle(AbstractFormHandle abstractFormHandle) {

        this.show();
    }

    private void show(){

        Main.scene.getWindow().setHeight(350);
        Main.scene.getWindow().setWidth(620);

        HBoxPOJO.getInstance().getTopHBox().setVisible(false);
        HBoxPOJO.getInstance().getBottomHboxGuncelleBtn().setVisible(false);
        HBoxPOJO.getInstance().getSilForm().setVisible(true);


        HBoxPOJO.getInstance().getBottomHBox().setLayoutY(230);
        HBoxPOJO.getInstance().getBottomHBox().setMinWidth(620);
        HBoxPOJO.getInstance().getBottomHboxSilBtn().setMinWidth(620);
    }
}
