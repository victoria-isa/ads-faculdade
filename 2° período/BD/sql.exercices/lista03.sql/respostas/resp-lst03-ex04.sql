select 
    p.categoria_id,
    count(*) as total_produtos,
    round(avg(p.preco), 2) as preco_medio,
    min(p.preco) as preco_minimo,
    max(p.preco) as preco_maximo
from produtos p
group by p.categoria_id
order by p.categoria_id asc;