package com.singleton;

import javafx.scene.control.Label;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class LabelSingle {


    private static LabelSingle labelSingle;

    private Label DeleteNameLabel;
    private Label DeleteSurNameLabel;
    private Label DeleteSalaryLabel;


    private Label UpdateLabelNameLabel;

    private Label UpdateLabelSurNameLabel;

    private Label UpdateLabelSalaryLabel;

    @Autowired
    private void labelSingle(LabelSingle labelSingle){
        LabelSingle.labelSingle = labelSingle;
    }


    public static LabelSingle getInstance(){
        return labelSingle;
    }

    public Label getDeleteNameLabel() {
        return DeleteNameLabel;
    }

    public void setDeleteNameLabel(Label deleteNameLabel) {
        DeleteNameLabel = deleteNameLabel;
    }

    public Label getDeleteSurNameLabel() {
        return DeleteSurNameLabel;
    }

    public void setDeleteSurNameLabel(Label deleteSurNameLabel) {
        DeleteSurNameLabel = deleteSurNameLabel;
    }

    public Label getDeleteSalaryLabel() {
        return DeleteSalaryLabel;
    }

    public void setDeleteSalaryLabel(Label deleteSalaryLabel) {
        DeleteSalaryLabel = deleteSalaryLabel;
    }



    public Label getUpdateLabelNameLabel() {
        return UpdateLabelNameLabel;
    }

    public void setUpdateLabelNameLabel(Label updateLabelNameLabel) {
        UpdateLabelNameLabel = updateLabelNameLabel;
    }

    public Label getUpdateLabelSurNameLabel() {
        return UpdateLabelSurNameLabel;
    }

    public void setUpdateLabelSurNameLabel(Label updateLabelSurNameLabel) {
        UpdateLabelSurNameLabel = updateLabelSurNameLabel;
    }

    public Label getUpdateLabelSalaryLabel() {
        return UpdateLabelSalaryLabel;
    }

    public void setUpdateLabelSalaryLabel(Label updateLabelSalaryLabel) {
        UpdateLabelSalaryLabel = updateLabelSalaryLabel;
    }
}
