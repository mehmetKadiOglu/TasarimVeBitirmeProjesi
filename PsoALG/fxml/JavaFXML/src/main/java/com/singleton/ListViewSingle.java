package com.singleton;

import javafx.scene.control.ListView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ListViewSingle {


    private static ListViewSingle listViewSingle;

    ListView<String> deleteFormMemberList;
    ListView<String>  deleteFormMemberDeleteList;
    ListView<String>  updateFormMemberList;


    @Autowired
    private void setListViewSingle(ListViewSingle listViewSingle){
        ListViewSingle.listViewSingle = listViewSingle;
    }

    public static ListViewSingle getInstance(){
        return listViewSingle;
    }
    public ListView<String>  getMemberList() {
        return deleteFormMemberList;
    }

    public void setDeleteFormMemberList(ListView deleteFormMemberList) {
        this.deleteFormMemberList = deleteFormMemberList;
    }

    public ListView<String> getMemberDeleteList() {
        return deleteFormMemberDeleteList;
    }

    public void setDeleteFormMemberDeleteList(ListView deleteFormMemberDeleteList) {
        this.deleteFormMemberDeleteList = deleteFormMemberDeleteList;
    }

    public void setUpdateFormMemberList(ListView<String> listView){
        this.updateFormMemberList = listView;
    }
    public ListView<String> getUpdateFormMemberList(){
        return this.updateFormMemberList;
    }
}
