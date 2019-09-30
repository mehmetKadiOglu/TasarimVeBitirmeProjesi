package com.POJO;

import javafx.scene.control.TextField;

public class TextFieldPOJO {

    private static TextFieldPOJO textFieldPOJO;
    TextField Ad;
    TextField SoyAd;
    TextField Maas;

    private TextFieldPOJO(){}

    public static TextFieldPOJO getInstance(){
        if(textFieldPOJO == null)
            textFieldPOJO =  new TextFieldPOJO();
        return textFieldPOJO;
    }

    public TextField getAd() {
        return Ad;
    }

    public void setAd(TextField ad) {
        Ad = ad;
    }

    public TextField getSoyAd() {
        return SoyAd;
    }

    public void setSoyAd(TextField soyAd) {
        SoyAd = soyAd;
    }

    public TextField getMaas() {
        return Maas;
    }

    public void setMaas(TextField maas) {
        Maas = maas;
    }
}
