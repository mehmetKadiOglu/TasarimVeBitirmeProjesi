function [Parametre_Sayisi Alt_Sinir_Degerleri Ust_Sinir_Degerleri Parcacik_Sayisi Tolerans]=Ayarlar(fnum)

    Parcacik_Sayisi = 30;
    Tolerans = 0.0000001;
    if fnum == 1 %Rastrigin
        Parametre_Sayisi = 30;
        Alt_Sinir_Degerleri = ones(1,Parametre_Sayisi)*(-5.12);
        Ust_Sinir_Degerleri = ones(1,Parametre_Sayisi)*(5.12);

    elseif fnum == 2
            Parametre_Sayisi=30;
            Alt_Sinir_Degerleri = ones(1,Parametre_Sayisi)*(-600);
            Ust_Sinir_Degerleri = ones(1,Parametre_Sayisi)*(600);
            
    elseif fnum==3        
            Parametre_Sayisi=10;
            Alt_Sinir_Degerleri = ones(1,Parametre_Sayisi)*(-0);
            Ust_Sinir_Degerleri = ones(1,Parametre_Sayisi)*(pi);
            Tolerans=-9.660151715641349;
    end



    

end

