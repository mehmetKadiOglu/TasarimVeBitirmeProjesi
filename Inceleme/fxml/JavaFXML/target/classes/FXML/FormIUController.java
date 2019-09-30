package com.FXML;

import com.POJO.HBoxPOJO;
import com.POJO.TextFieldPOJO;
import com.Facade.FormActionFacade;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.HBox;

import java.net.URL;
import java.util.ResourceBundle;

public class FormIUController implements Initializable {

    @FXML
    HBox TopHBox;
    @FXML
    HBox BottomHBox;
    @FXML
    HBox BottomHboxSilBtn;
    @FXML
    HBox BottomHboxGuncelleBtn;
    @FXML
    HBox SilForm;
    @FXML
    HBox KayitForm;


    @FXML
    Button KayitBtn;
    @FXML
    Button GuncelleBtn;
    @FXML
    Button SilBtn;


    @FXML
    TextField AD;
    @FXML
    TextField SOYAD;
    @FXML
    TextField MAAS;


    @FXML
    GridPane KayitGridPane;




    @Override
    public void initialize(URL location, ResourceBundle resources) {
        this.prepareTemplate();

    }

    @FXML protected void kayitFormHazirla(ActionEvent event){
        FormActionFacade.getInstance().buttonHandle("KayitBtnHandle");
    }
    @FXML protected void kayitSil(ActionEvent event){
        FormActionFacade.getInstance().buttonHandle("SilBtnHandle");
    }



    // Prepare Area
    private void prepareTemplate(){
        this.prepareHBoxPOJO();
        this.prepareTextFieldPOJO();
    }
    private void prepareHBoxPOJO(){
        HBoxPOJO.getInstance().setTopHBox(this.TopHBox);
        HBoxPOJO.getInstance().setKayitForm(this.KayitForm);
        HBoxPOJO.getInstance().setBottomHBox(this.BottomHBox);
        HBoxPOJO.getInstance().setBottomHboxSilBtn(this.BottomHboxSilBtn);
        HBoxPOJO.getInstance().setBottomHboxGuncelleBtn(this.BottomHboxGuncelleBtn);
        HBoxPOJO.getInstance().setSilForm(this.SilForm);
    }
    private void prepareTextFieldPOJO(){
        TextFieldPOJO.getInstance().setAd(this.AD);
        TextFieldPOJO.getInstance().setSoyAd(this.SOYAD);
        TextFieldPOJO.getInstance().setMaas(this.MAAS);
    }
}
