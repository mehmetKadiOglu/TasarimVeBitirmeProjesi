function [parcacikArray, parcacikEnUygunDegerler, bestParcacikArray, hizMiktari, Tolerans, Parcacik_Sayisi, Parametre_Sayisi]=Parcacik_Hazirla(fnum)

[Parametre_Sayisi, Alt_Sinir_Degerleri, Ust_Sinir_Degerleri, Parcacik_Sayisi, Tolerans] = Ayarlar(fnum);

parcacikArray=zeros(Parcacik_Sayisi,Parametre_Sayisi);           % Ecosystem Matrix
bestParcacikArray = zeros(Parcacik_Sayisi,Parametre_Sayisi);
parcacikEnUygunDegerler=zeros(Parcacik_Sayisi,1); 
hizMiktari = zeros(Parcacik_Sayisi,Parametre_Sayisi);

% --- Ecosystem Initialization
    for i=1:Parcacik_Sayisi
        % Initialize the organisms randomly in the ecosystem 
            parcacikArray(i,:)=rand(1,Parametre_Sayisi).*(Ust_Sinir_Degerleri-Alt_Sinir_Degerleri)+Alt_Sinir_Degerleri;
            parcacikEnUygunDegerler(i) = Amac_Fonk(parcacikArray(i,:), fnum);
            hizMiktari(i,:) = rand(1,Parametre_Sayisi);
    end
    
end