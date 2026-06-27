select 
    e.produto_id,
    e.quantidade,
    case
        when e.quantidade = 0 then 'Esgotado'
        when e.quantidade between 1 and 15 then 'Estoque baixo'
        when e.quantidade between 16 and 50 then 'Estoque normal'
        when e.quantidade > 50 then 'Estoque alto'
    end as situacao
from estoque e
order by 
    case 
        when e.quantidade = 0 then 1
        when e.quantidade between 1 and 15 then 2
        when e.quantidade between 16 and 50 then 3
        when e.quantidade > 50 then 4
    end,
    e.quantidade asc;