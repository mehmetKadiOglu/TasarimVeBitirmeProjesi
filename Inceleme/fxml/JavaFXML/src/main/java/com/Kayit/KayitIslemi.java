package com.Kayit;

import com.POJO.KullaniciPOJO;
import com.POJO.TextFieldPOJO;

public class KayitIslemi {

    public void islemBaslat(){

        KayitLİst.getInstance().addListNewMember( this.prepareKullaniciPOJOObjeck() );
        this.clearTextField();
    }

    private KullaniciPOJO prepareKullaniciPOJOObjeck(){

        KullaniciPOJO kullaniciPOJO = new KullaniciPOJO();

        kullaniciPOJO.setAd( TextFieldPOJO.getInstance().getAd().getText() );
        kullaniciPOJO.setSoyAd( TextFieldPOJO.getInstance().getSoyAd().getText() );
        kullaniciPOJO.setMaas( TextFieldPOJO.getInstance().getMaas().getText() );

        return kullaniciPOJO;
    }

    private void clearTextField(){
        TextFieldPOJO.getInstance().getAd().setText("");
        TextFieldPOJO.getInstance().getSoyAd().setText("");
        TextFieldPOJO.getInstance().getMaas().setText("");
    }
}
