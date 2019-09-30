package com.STATE.KayitBtnState;

import com.POJO.HBoxPOJO;
import com.STATE.AbstractFormHandle;
import com.STATE.FormState;
import com.dd.Main;

public class KayitEkleFormShow implements FormState {
    @Override
    public void Handle(AbstractFormHandle abstractFormHandle) {
        this.show();
        abstractFormHandle.setKayitFormState(new KayitEkleFormHide());
    }

    private void show(){

        Main.scene.getWindow().setHeight(300);
        Main.scene.getWindow().setWidth(350);
        HBoxPOJO.getInstance().getBottomHBox().setVisible(false);
        HBoxPOJO.getInstance().getKayitForm().setVisible(true);
        HBoxPOJO.getInstance().getKayitForm().setMinWidth(350);
        HBoxPOJO.getInstance().getTopHBox().setLayoutY(180);
        HBoxPOJO.getInstance().getTopHBox().setMinWidth(350);
    }
}
