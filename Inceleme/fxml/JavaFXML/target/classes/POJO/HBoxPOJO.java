package com.POJO;

import javafx.scene.layout.HBox;

public class HBoxPOJO {

    private static HBoxPOJO HBoxPOJO;


    private HBox TopHBox;
    private HBox BottomHBox;
    private HBox KayitForm;
    private HBox BottomHboxSilBtn;
    private HBox BottomHboxGuncelleBtn;
    private HBox SilForm;

    private HBoxPOJO(){}

    public static HBoxPOJO getInstance(){

        if(HBoxPOJO == null)
            HBoxPOJO = new HBoxPOJO();

        return HBoxPOJO;
    }

    public HBox getSilForm() {
        return SilForm;
    }

    public void setSilForm(HBox silForm) {
        SilForm = silForm;
    }

    public static com.POJO.HBoxPOJO getHBoxPOJO() {
        return HBoxPOJO;
    }

    public static void setHBoxPOJO(com.POJO.HBoxPOJO HBoxPOJO) {
        com.POJO.HBoxPOJO.HBoxPOJO = HBoxPOJO;
    }

    public HBox getBottomHboxSilBtn() {
        return BottomHboxSilBtn;
    }

    public void setBottomHboxSilBtn(HBox bottomHboxSilBtn) {
        BottomHboxSilBtn = bottomHboxSilBtn;
    }

    public HBox getBottomHboxGuncelleBtn() {
        return BottomHboxGuncelleBtn;
    }

    public void setBottomHboxGuncelleBtn(HBox bottomHboxGuncelleBtn) {
        BottomHboxGuncelleBtn = bottomHboxGuncelleBtn;
    }


    public HBox getTopHBox() {
        return TopHBox;
    }

    public void setTopHBox(HBox topHBox) {
        TopHBox = topHBox;
    }

    public HBox getBottomHBox() {
        return BottomHBox;
    }

    public void setBottomHBox(HBox bottomHBox) {
        BottomHBox = bottomHBox;
    }

    public HBox getKayitForm() {
        return KayitForm;
    }

    public void setKayitForm(HBox kayitForm) {
        KayitForm = kayitForm;
    }
}
