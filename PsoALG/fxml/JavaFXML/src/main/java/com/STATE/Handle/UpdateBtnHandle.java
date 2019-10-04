package com.STATE.Handle;

import com.STATE.Handle.AbstractFormHandle;
import org.springframework.stereotype.Component;

@Component
public class UpdateBtnHandle extends AbstractFormHandle {
    @Override
    public void handle() {
        this.saveFormState.Handle(this);
    }
}
