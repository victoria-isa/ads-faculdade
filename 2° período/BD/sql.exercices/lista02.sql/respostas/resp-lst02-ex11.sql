select 
    lpad(p.id::text, 5, '0') as codigo_produto,
    p.nome,
    p.preco,
    case
        when p.preco < 200.00 then 'Básico'
        when p.preco >= 200.00 and p.preco < 1000.00 then 'Intermediário'
        when p.preco >= 1000.00 then 'Premium'
    end as faixa_preco
from produtos p
order by 
    case 
        when p.preco >= 1000.00 then 1
        when p.preco >= 200.00 and p.preco < 1000.00 then 2
        when p.preco < 200.00 then 3
    end,
    p.preco desc;