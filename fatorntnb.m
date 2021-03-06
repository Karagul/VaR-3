function [f] = fatorntnb(prazo_diasuteis,mesvencimento)

[ajuros,tjuros,atjuros] = xlsread('trabalho_versao4.xls','Juros Real Brasil');

prazos=ajuros(1,:);
jurosreal=ajuros(2:end,:)/100;

prazomaio=[47,
175,
296,
423,
542,
672,
792,
918,
1039];

prazoagosto=[112,
235,
360,
483,
606,
733,
856,
978,
1102];

if mesvencimento==5
    prazoscuponsdu = prazomaio(prazomaio<=prazo_diasuteis);
elseif mesvencimento==8
    prazoscuponsdu = prazoagosto(prazoagosto<=prazo_diasuteis);
else
    disp('O m�s especificado na fun��o n�o � compat�vel com prazo de NTNB');
end


for j=1:size(prazoscuponsdu)
    for i=1:size(jurosreal,1)
        if prazoscuponsdu(j)>prazos(end)
            tx(:,j) = jurosreal(:,end);
        elseif prazoscuponsdu(j)<prazos(1)
            tx(:,j) = jurosreal(:,1);
        else
        tx(i,j)=interp1(prazos,jurosreal(i,:),prazoscuponsdu(j));
        end
    end
end

f = (tx(2:end,:) - tx(1:end-1,:));

end

