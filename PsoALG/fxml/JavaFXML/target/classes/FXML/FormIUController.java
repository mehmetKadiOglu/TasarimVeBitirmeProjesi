package com.FXML;

import com.Facade.FxmlSetTextFacade;
import com.Facade.SaveDeleteFactoryFacade;
import com.POJO.*;
import com.Facade.FormActionFacade;
import com.singleton.*;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;

import java.net.URL;
import java.util.Collection;
import java.util.Collections;
import java.util.ResourceBundle;

public class FormIUController implements Initializable {

    @FXML
    HBox TopHBox;
    @FXML
    HBox BottomHBox;
    @FXML
    HBox BottomHBoxDelete;
    @FXML
    HBox BottomHBoxUpdate;
    @FXML
    HBox DeleteForm;
    @FXML
    HBox SaveForm;
    @FXML
    HBox UpdateForm;


    @FXML
    Button SaveBtn;
    @FXML
    Button UpdateBtn;
    @FXML
    Button DeleteBtn;
    @FXML
    Button UpdateFormBtn;


    @FXML
    TextField SaveNameTxt;
    @FXML
    TextField SaveSurNameTxt;
    @FXML
    TextField SaveSalaryTxt;
    @FXML
    TextField UpdateNameTxt;
    @FXML
    TextField UpdateSurNameTxt;
    @FXML
    TextField UpdateSalaryTxt;



    @FXML
    ListView<String> DeleteFormMemberList;
    @FXML
    ListView<String>  DeleteFormMemberDeleteList;
    @FXML
    ListView<String>  UpdateFormMemberList;


    @FXML
    Label DeleteNameLabel;
    @FXML
    Label DeleteSurNameLabel;
    @FXML
    Label DeleteSalaryLabel;
    @FXML
    Label UpdateLabelNameLabel;
    @FXML
    Label UpdateLabelSurNameLabel;
    @FXML
    Label UpdateLabelSalaryLabel;






    @Override
    public void initialize(URL location, ResourceBundle resources) {
        this.prepareTemplate();
        FxmlSetTextFacade.getInstance().setDeleteAllLabel(new MemberPOJO());
        DeleteFormMemberList.setOnMouseClicked(this::memberListHandle);
        DeleteFormMemberDeleteList.setOnMouseClicked(this::memberDeleteListHandle);
        UpdateFormMemberList.setOnMouseClicked(this::updateFormMemberListHandle);
    }

    private void memberListHandle(MouseEvent mouseEvent) {
        MemberPOJO memberPOJO = MemberListSingle.getInstance().getMemberList().get( DeleteFormMemberList.getSelectionModel().getSelectedIndex() );
        FxmlSetTextFacade.getInstance().setDeleteAllLabel(memberPOJO);
    }
    private void memberDeleteListHandle(MouseEvent mouseEvent){
        MemberPOJO memberPOJO = WillDeletedMemberListSingle.getInstance().getWillDeletedMember( DeleteFormMemberDeleteList.getSelectionModel().getSelectedIndex() );
        FxmlSetTextFacade.getInstance().setDeleteAllLabel(memberPOJO);
    }
    private void updateFormMemberListHandle(MouseEvent mouseEvent){
        int index = UpdateFormMemberList.getSelectionModel().getSelectedIndex();
        MemberPOJO memberPOJO = MemberListSingle.getInstance().getMember(index);
        FxmlSetTextFacade.getInstance().setUpdateAllLabel(memberPOJO);
    }


    @FXML protected void MemberDeleteListAddMember(ActionEvent event){
        WillDeletedMemberListSingle.getInstance().addMemberDeletedIndex(DeleteFormMemberList.getSelectionModel().getSelectedIndex());
        this.DeleteFormMemberDeleteList.getItems().add( this.DeleteFormMemberList.getSelectionModel().getSelectedItem() );

    }
    @FXML protected void MemberDeleteListDeleteMember(ActionEvent event){
        WillDeletedMemberListSingle.getInstance().listMemberRemove( DeleteFormMemberDeleteList.getSelectionModel().getSelectedIndex() );
        this.DeleteFormMemberDeleteList.getItems().remove( DeleteFormMemberDeleteList.getSelectionModel().getSelectedIndex() );
        FxmlSetTextFacade.getInstance().setDeleteAllLabel(new MemberPOJO());

    }
    @FXML protected void buttonSaveHandle(ActionEvent event){
        FormActionFacade.getInstance().saveBtnHandle();
    }
    @FXML protected void buttonDeleteHandle(ActionEvent event){
        FormActionFacade.getInstance().deleteBtnHandle();
    }
    @FXML protected void buttonUpdateHandle(ActionEvent event){
        FormActionFacade.getInstance().updateBtnHandle();
    }
    @FXML protected void updateMember(ActionEvent event){

        SaveDeleteFactoryFacade.getInstance().memberListUpdateMember();
    }



    // Prepare Area
    private void prepareTemplate(){
        this.prepareHBoxPOJO();
        this.prepareTextFieldPOJO();
        this.prepareLabelPOJO();
        this.prepareListViewPOJO();
        this.prepareMemberList();
    }
    private void prepareHBoxPOJO(){

        HBoxSingle.getInstance().setTopHBox(this.TopHBox);
        HBoxSingle.getInstance().setSaveForm(this.SaveForm);
        HBoxSingle.getInstance().setBottomHBox(this.BottomHBox);
        HBoxSingle.getInstance().setBottomHBoxDelete(this.BottomHBoxDelete);
        HBoxSingle.getInstance().setBottomHBoxUpdate(this.BottomHBoxUpdate);
        HBoxSingle.getInstance().setDeleteForm(this.DeleteForm);
        HBoxSingle.getInstance().setUpdateForm(this.UpdateForm);
    }
    private void prepareTextFieldPOJO(){
        TextFieldSingle.getInstance().setSaveNameTxt(this.SaveNameTxt);
        TextFieldSingle.getInstance().setSaveSurNameTxt(this.SaveSurNameTxt);
        TextFieldSingle.getInstance().setSaveSalaryTxt(this.SaveSalaryTxt);

        TextFieldSingle.getInstance().setUpdateNameTxt(this.UpdateNameTxt);
        TextFieldSingle.getInstance().setUpdateSurNameTxt(this.UpdateSurNameTxt);
        TextFieldSingle.getInstance().setUpdateSalaryTxt(this.UpdateSalaryTxt);
    }
    private void prepareLabelPOJO(){
        LabelSingle.getInstance().setDeleteNameLabel(this.DeleteNameLabel);
        LabelSingle.getInstance().setDeleteSurNameLabel(this.DeleteSurNameLabel);
        LabelSingle.getInstance().setDeleteSalaryLabel(this.DeleteSalaryLabel);

        LabelSingle.getInstance().setUpdateLabelNameLabel(this.UpdateLabelNameLabel);
        LabelSingle.getInstance().setUpdateLabelSurNameLabel(this.UpdateLabelSurNameLabel);
        LabelSingle.getInstance().setUpdateLabelSalaryLabel(this.UpdateLabelSalaryLabel);
    }
    private void prepareListViewPOJO(){
        ListViewSingle.getInstance().setDeleteFormMemberDeleteList(this.DeleteFormMemberDeleteList);
        ListViewSingle.getInstance().setDeleteFormMemberList(this.DeleteFormMemberList);
        ListViewSingle.getInstance().setUpdateFormMemberList(this.UpdateFormMemberList);

    }
    private void prepareMemberList(){
        for(MemberPOJO memberPOJO : MemberListSingle.getInstance().getMemberList())
            this.DeleteFormMemberList.getItems().add(memberPOJO.getName() + " " + memberPOJO.getSurName());
    }

}
