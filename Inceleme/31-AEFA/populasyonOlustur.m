function X = populasyonOlustur(lbArray, ubArray, dimension, populasyonSize, secenek)

    negatifPopulasyon = 0.3;
    pozitifPopulasyon = 0.7;
    X = zeros(populasyonSize,dimension);
    sutun = zeros(populasyonSize,1);
    for i=1:dimension

        if lbArray(i)<=0 && ubArray(i)>=0
            array = ones(populasyonSize,1); 
            pozitif = populasyonParcacigiOlustur(dimension * pozitifPopulasyon, ubArray(i), 1e-10); %pozitif popülasyon olu?turuluyor
            negatif = populasyonParcacigiOlustur(dimension * negatifPopulasyon, lbArray(i)*-1, 1e-10) * -1; %negatif popülasyon olu?turuluyor
            
            sutun( 1 : (dimension * pozitifPopulasyon)) = pozitif;
            sutun( (dimension * pozitifPopulasyon+1) : (dimension * negatifPopulasyon) ) = negatif;
            
            
            
            if secenek == 1
                X( :, i) = sutun;
            else
                indexArray = randperm(populasyonSize);
                for index=1:populasyonSize
                    X(index,i) = sutun(indexArray(index));
                end
            end
        end

    end


end



function dizi = populasyonParcacigiOlustur(forMaxIndex, wMax, Wmin)

	for index=1:forMaxIndex
		chValue=wMax-index*((wMax-Wmin)/forMaxIndex);
		dizi (index) = kaso(,index,forMaxIndex,chValue);
	end

end