package com.Facade;

import com.STATE.AbstractFormHandle;
import com.STATE.KayitBtnState.KayitBtnHandle;
import com.STATE.KayitBtnState.KayitEkleFormShow;
import com.Kayit.KayitIslemi;
import com.STATE.SilBtnState.SilBtnHandle;
import com.STATE.SilBtnState.SilFormShow;

import java.util.HashMap;

public class FormActionFacade {

    private static FormActionFacade formActionFacade;

    private KayitIslemi kayitIslemi;
    private HashMap<String, AbstractFormHandle> handleHashMap;

    private FormActionFacade(){
        this.prepareTemplate();
    }
    public static FormActionFacade getInstance(){
        if (formActionFacade == null)
            formActionFacade = new FormActionFacade();
        return formActionFacade;

    }

    private void prepareTemplate(){
        this.preparehandleHashMap();
        this.prepareKayitBtnHandle();
        this.prepareSilBtnHandle();
        this.prepareKayitIslemi();
    }
    private void prepareKayitBtnHandle(){
        this.handleHashMap.get("KayitBtnHandle").setKayitFormState(new KayitEkleFormShow());
    }
    private void prepareSilBtnHandle(){
        this.handleHashMap.get("SilBtnHandle").setKayitFormState(new SilFormShow());
    }
    private void preparehandleHashMap(){
        this.handleHashMap = new HashMap<String, AbstractFormHandle>();
        this.handleHashMap.put("KayitBtnHandle", new KayitBtnHandle());
        this.handleHashMap.put("SilBtnHandle", new SilBtnHandle());
    }
    private void prepareKayitIslemi(){
        this.kayitIslemi = new KayitIslemi();
    }


    public void uyeKaydi(){
        this.kayitIslemi.islemBaslat();
    }
    public void buttonHandle(String key){
        this.handleHashMap.get(key).handle();
    }
}
