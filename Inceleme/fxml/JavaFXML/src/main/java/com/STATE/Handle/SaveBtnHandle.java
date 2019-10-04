package com.STATE.Handle;

import com.STATE.Handle.AbstractFormHandle;
import org.springframework.stereotype.Component;

@Component
public class SaveBtnHandle extends AbstractFormHandle {

    @Override
    public void handle(){
        this.saveFormState.Handle(this);
    }

}
