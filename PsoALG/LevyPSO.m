function [IterasyonSayisi temp] = LevyPSO(fnum)
[parcacikArray, parcacikEnUygunDegerler, bestParcacikArray, hizMiktari, Tolerans, Parcacik_Sayisi, Parametre_Sayisi] = Parcacik_Hazirla(fnum);
Sosyal_Faktorler = 2;
IterasyonSayisi = 0;
sayac = 0;
temp = 1000000;
    while IterasyonSayisi < 10000 && temp > Tolerans
        [temp, gbest] = min(parcacikEnUygunDegerler); 
        for satir=1:Parcacik_Sayisi

            parcacikArray(satir,:) = parcacikArray(satir,:) + hizMiktari(satir,:)/1.5;  % pozisyon guncelleme
            uygunluk = Amac_Fonk(parcacikArray(satir,:), fnum);

            if sayac == 40
                for sutun=1:Parametre_Sayisi
                    parcacikArray(satir, sutun) = (Levy());
                end 
                uygunluk = Amac_Fonk(parcacikArray(satir,:), fnum);
                if uygunluk < parcacikEnUygunDegerler(satir)
                    parcacikEnUygunDegerler(satir) = uygunluk;
                    bestParcacikArray(satir,:) = parcacikArray(satir,:);
                end

                sayac = 0;
            elseif uygunluk < parcacikEnUygunDegerler(satir)
                parcacikEnUygunDegerler(satir) = uygunluk;
                bestParcacikArray(satir,:) = parcacikArray(satir,:);
            else
                sayac = sayac + 1 ;

            end

            for sutun=1:Parametre_Sayisi
                hizMiktari(satir, sutun) = (rand*hizMiktari(satir, sutun)) + (Sosyal_Faktorler*rand*(bestParcacikArray(satir, sutun)-parcacikArray(satir, sutun))) + (Sosyal_Faktorler*rand*(parcacikArray(gbest, sutun)-parcacikArray(satir, sutun)));
            end


        end
        IterasyonSayisi = IterasyonSayisi + 1;
    end

end