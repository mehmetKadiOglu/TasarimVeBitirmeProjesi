function populasyon = populasyonOlustur4(lbArray, ubArray, dimension, populasyonSize, secenek)

    [sutunUzunlugu satirUzunlugu] = size(lbArray);
    
    if satirUzunlugu > 1 
       populasyon = DegiskenSinirAraligindaPopulasyonOlustur(lbArray, ubArray, dimension, populasyonSize, secenek);
    else
       populasyon = SabitSinirAraligindaPopulasyonOlustur(lbArray, ubArray, dimension, populasyonSize, secenek);
    end
   

end

function populasyon = DegiskenSinirAraligindaPopulasyonOlustur(lbArray, ubArray, dimension, populasyonSize, secenek)

    populasyon = zeros(populasyonSize,dimension);
    
    for i=1:populasyonSize

        if lbArray(i)<=0 && ubArray(i)>=0
            
            populasyonSutun = sutunOlustur(0.3, 0.7, dimension, ubArray(i), 1e-10, lbArray(i), 1e-10);

        elseif lbArray(i)>=0 && ubArray(i)>=0
            populasyonSutun = sutunOlustur(0, 1, dimension, ubArray(i), lbArray(i), 0, 0);
            
        else

            populasyonSutun = sutunOlustur(1, 0, dimension, 0, 0, lbArray(i), ubArray(i));
        end
        
        
        if secenek == 1
            populasyon( i, :) = populasyonSutun;
        else
            
            indexArray = randperm(dimension);
            for index=1:dimension
                populasyon(i, index) = populasyonSutun(indexArray(index));
            end
            
        end

    end
    

end

function populasyon = SabitSinirAraligindaPopulasyonOlustur(lbArray, ubArray, dimension, populasyonSize, secenek)

    populasyon = zeros(populasyonSize,dimension);
    for i=1:dimension
    disp("girilmemesii gerekiydi");
        if lbArray<=0 && ubArray>=0
            
            populasyonSutun = sutunOlustur();
         
            if secenek == 1
                populasyon( :, i) = populasyonSutun;
            else
                indexArray = randperm(populasyonSize);
                for index=1:populasyonSize
                    populasyon(index,i) = populasyonSutun(indexArray(index));
                end
            end
            
        end

    end
   % 1e-10

end

function sutun = sutunOlustur(negatifPopulasyon, pozitifPopulasyon, populasyonSize, ubMax, ubMin, lbMax, lbMin)
    
    pozitifParca = sutunParcalariOlustur(populasyonSize * pozitifPopulasyon, ubMax, ubMin); 
    negatifParca = sutunParcalariOlustur(populasyonSize * negatifPopulasyon, lbMax*-1, lbMin) * -1; 
    
    sutun( 1 : (populasyonSize * pozitifPopulasyon)) = pozitifParca;
    
    if negatifPopulasyon >0
        sutun( (populasyonSize * pozitifPopulasyon+1) : (populasyonSize) ) = negatifParca;
    end

end

function sutunParca = sutunParcalariOlustur(forMaxIndex, wMax, Wmin)

    sutunParca = zeros(forMaxIndex, 1);
    
    for index=1:forMaxIndex
        chValue=wMax-index*((wMax-Wmin)/forMaxIndex);
        sutunParca(index) = chaos(4,index,forMaxIndex,chValue);
    end

    if forMaxIndex > 0
        sutunParca(forMaxIndex) = Wmin+ (rand*(wMax - Wmin));
    end

end