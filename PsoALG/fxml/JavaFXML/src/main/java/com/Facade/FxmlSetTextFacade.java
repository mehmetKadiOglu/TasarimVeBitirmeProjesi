package com.Facade;

import com.singleton.LabelSingle;
import com.POJO.MemberPOJO;
import com.singleton.TextFieldSingle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FxmlSetTextFacade {

    private static FxmlSetTextFacade fxmlSetTextFacade;

    @Autowired
    private void setFxmlSetTextFacade(FxmlSetTextFacade fxmlSetTextFacade){
        FxmlSetTextFacade.fxmlSetTextFacade = fxmlSetTextFacade;
    }

    public static FxmlSetTextFacade getInstance(){
        return fxmlSetTextFacade;
    }

    public void setAddAllTextField(MemberPOJO memberPOJO){
        TextFieldSingle.getInstance().getSaveNameTxt().setText(memberPOJO.getName());
        TextFieldSingle.getInstance().getSaveSurNameTxt().setText(memberPOJO.getSurName());
        TextFieldSingle.getInstance().getSaveSalaryTxt().setText(memberPOJO.getSalary());
    }

    public void setDeleteAllLabel(MemberPOJO memberPOJO){
        LabelSingle.getInstance().getDeleteNameLabel().setText(memberPOJO.getName());
        LabelSingle.getInstance().getDeleteSurNameLabel().setText(memberPOJO.getSurName());
        LabelSingle.getInstance().getDeleteSalaryLabel().setText(memberPOJO.getSalary());
    }
    public void setUpdateAllTextField(MemberPOJO memberPOJO){
        TextFieldSingle.getInstance().getUpdateNameTxt().setText(memberPOJO.getName());
        TextFieldSingle.getInstance().getUpdateSurNameTxt().setText(memberPOJO.getSurName());
        TextFieldSingle.getInstance().getUpdateSalaryTxt().setText(memberPOJO.getSalary());
    }
    public void setUpdateAllLabel(MemberPOJO memberPOJO){

        LabelSingle.getInstance().getUpdateLabelNameLabel().setText(memberPOJO.getName());
        LabelSingle.getInstance().getUpdateLabelSurNameLabel().setText(memberPOJO.getSurName());
        LabelSingle.getInstance().getUpdateLabelSalaryLabel().setText(memberPOJO.getSalary());
    }
}
