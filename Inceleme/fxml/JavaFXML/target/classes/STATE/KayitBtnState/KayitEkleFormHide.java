package com.STATE.KayitBtnState;

import com.POJO.HBoxPOJO;
import com.Facade.FormActionFacade;
import com.STATE.AbstractFormHandle;
import com.STATE.FormState;
import com.dd.Main;

public class KayitEkleFormHide implements FormState {
    @Override
    public void Handle(AbstractFormHandle abstractFormHandle) {
        this.hide();
        abstractFormHandle.setKayitFormState(new KayitEkleFormShow());
        FormActionFacade.getInstance().uyeKaydi();
    }

    private void hide(){

        HBoxPOJO.getInstance().getBottomHBox().setVisible(true);
        Main.scene.getWindow().setHeight(186);
        Main.scene.getWindow().setWidth(230);
        HBoxPOJO.getInstance().getKayitForm().setVisible(false);
        HBoxPOJO.getInstance().getTopHBox().setLayoutY(0);
        HBoxPOJO.getInstance().getTopHBox().setMinWidth(220);
        HBoxPOJO.getInstance().getTopHBox().setMinHeight(80);
    }
}
