select 
    p.nome,
    p.preco,
    case
        when p.preco < 200.00 then 'Básico'
        when p.preco >= 200.00 and p.preco < 1000.00 then 'Intermediário'
        when p.preco >= 1000.00 then 'Premium'
    end as faixa_preco
from produtos p
order by p.preco asc;