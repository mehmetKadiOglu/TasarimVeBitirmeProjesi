package com.Kayit;

import com.POJO.KullaniciPOJO;

import java.util.ArrayList;
import java.util.List;

public class KayitLİst {

    private static KayitLİst kayitLİst;
    private List<KullaniciPOJO> list;
    private KayitLİst(){

        this.list = new ArrayList<KullaniciPOJO>();
    }

    public static KayitLİst getInstance(){
        if ( kayitLİst == null )
            kayitLİst = new KayitLİst();
        return kayitLİst;
    }

    public void addListNewMember(KullaniciPOJO kullaniciPOJO){
        this.list.add(kullaniciPOJO);
    }

    public List<KullaniciPOJO> getList(){
        return this.list;
    }



}
