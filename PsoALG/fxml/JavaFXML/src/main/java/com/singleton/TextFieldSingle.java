package com.singleton;

import javafx.scene.control.TextField;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class TextFieldSingle {


    private static TextFieldSingle textFieldSingle;

    private TextField SaveNameTxt;
    private TextField SaveSurNameTxt;
    private TextField SaveSalaryTxt;


    private TextField UpdateNameTxt;
    private TextField UpdateSurNameTxt;
    private TextField UpdateSalaryTxt;

    @Autowired
    private void setTextFieldSingle(TextFieldSingle textFieldSingle){
        TextFieldSingle.textFieldSingle = textFieldSingle;
    }

    public static TextFieldSingle getInstance(){
        return textFieldSingle;
    }


    public TextField getSaveNameTxt() {
        return SaveNameTxt;
    }

    public void setSaveNameTxt(TextField saveNameTxt) {
        SaveNameTxt = saveNameTxt;
    }

    public TextField getSaveSurNameTxt() {
        return SaveSurNameTxt;
    }

    public void setSaveSurNameTxt(TextField saveSurNameTxt) {
        SaveSurNameTxt = saveSurNameTxt;
    }

    public TextField getSaveSalaryTxt() {
        return SaveSalaryTxt;
    }

    public void setSaveSalaryTxt(TextField saveSalaryTxt) {
        SaveSalaryTxt = saveSalaryTxt;
    }

    public TextField getUpdateNameTxt() {
        return UpdateNameTxt;
    }

    public void setUpdateNameTxt(TextField updateNameTxt) {
        UpdateNameTxt = updateNameTxt;
    }

    public TextField getUpdateSurNameTxt() {
        return UpdateSurNameTxt;
    }

    public void setUpdateSurNameTxt(TextField updateSurNameTxt) {
        UpdateSurNameTxt = updateSurNameTxt;
    }

    public TextField getUpdateSalaryTxt() {
        return UpdateSalaryTxt;
    }

    public void setUpdateSalaryTxt(TextField updateSalaryTxt) {
        UpdateSalaryTxt = updateSalaryTxt;
    }
}
