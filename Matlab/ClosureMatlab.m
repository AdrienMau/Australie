%scatter(scan,Cscan);

scan=closure(:,5);
L=closure(:,2);
Cscan=closure(:,6);
Csec=closure(:,7);
volt=closure(:,4);

l=length(closure);

for(n=1:l)
    if (L(n)~=1500)
        
    if(volt(n)==5)
        scatter(scan(n),Cscan(n),mag(n),exp(L(n)),'filled')
    hold on
    
    else
        scatter(scan(n),Cscan(n),mag(n),exp(L(n)))
    end 
    end
    hold on
end 