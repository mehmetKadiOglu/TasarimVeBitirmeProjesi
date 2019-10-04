package com.Facade;

import com.Factory.MemberListTransactionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SaveDeleteFactoryFacade {


    private static SaveDeleteFactoryFacade saveDeleteFactoryFacade;

    @Autowired
    private void setSaveDeleteFactoryFacade(SaveDeleteFactoryFacade saveDeleteFactoryFacade){
        SaveDeleteFactoryFacade.saveDeleteFactoryFacade = saveDeleteFactoryFacade;
    }

    @Autowired
    private MemberListTransactionFactory memberListTransactionFactory;


    public static SaveDeleteFactoryFacade getInstance(){
        return saveDeleteFactoryFacade;
    }

    public void memberListAddNewMember(){
        this.memberListTransactionFactory.getMemberListSaveNewMember().save();
    }

    public void memberListDeleteMember(){
        this.memberListTransactionFactory.getMemberListDeleteMember().delete();
    }

    public void memberListUpdateMember() { this.memberListTransactionFactory.getMemberListUpdateMember().update(); }


}
