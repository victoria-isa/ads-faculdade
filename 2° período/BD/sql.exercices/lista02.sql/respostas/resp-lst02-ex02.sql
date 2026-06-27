select 
    p.nome,
    p.preco,
    round(p.preco, 0) as preco_arredondado,
    trunc(p.preco, 0) as preco_truncado
from produtos p
where p.preco < 200.00
order by p.preco asc;