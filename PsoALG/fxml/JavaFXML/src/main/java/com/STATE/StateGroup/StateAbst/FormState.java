package com.STATE.StateGroup.StateAbst;

import com.STATE.Handle.AbstractFormHandle;
import com.dd.Main;

public abstract class FormState {
   abstract public void Handle(AbstractFormHandle abstractFormHandle);

   protected void minimizeMainWindow(){
      Main.scene.getWindow().setHeight(220);
      Main.scene.getWindow().setWidth(240);
   }
}
