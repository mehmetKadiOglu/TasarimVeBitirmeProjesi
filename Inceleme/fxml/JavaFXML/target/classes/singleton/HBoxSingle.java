package com.singleton;

import javafx.scene.control.Button;
import javafx.scene.layout.HBox;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class HBoxSingle {


    private static HBoxSingle hBoxSingle;

    private HBox TopHBox;
    private HBox BottomHBox;
    private HBox SaveForm;
    private HBox BottomHBoxDelete;
    private HBox BottomHBoxUpdate;
    private HBox DeleteForm;
    private HBox UpdateForm;

    public HBox getUpdateForm() {
        return UpdateForm;
    }

    public void setUpdateForm(HBox updateForm) {
        UpdateForm = updateForm;
    }

    @Autowired
    private void setHBoxSingle(HBoxSingle hBoxSingle){
        HBoxSingle.hBoxSingle = hBoxSingle;
    }
    public static HBoxSingle getInstance(){
        return hBoxSingle;
    }

    public HBox getDeleteForm() {
        return DeleteForm;
    }

    public void setDeleteForm(HBox deleteForm) {
        this.DeleteForm = deleteForm;
    }

    public HBox getBottomHBoxDelete() {
        return BottomHBoxDelete;
    }

    public void setBottomHBoxDelete(HBox bottomHBoxDelete) {
        this.BottomHBoxDelete = bottomHBoxDelete;
    }

    public HBox getBottomHBoxUpdate() {
        return BottomHBoxUpdate;
    }

    public void setBottomHBoxUpdate(HBox bottomHBoxUpdate) {
        this.BottomHBoxUpdate = bottomHBoxUpdate;
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

    public HBox getSaveForm() {
        return SaveForm;
    }

    public void setSaveForm(HBox SaveForm) {
        this.SaveForm = SaveForm;
    }
}
