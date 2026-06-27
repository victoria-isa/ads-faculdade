select 
    p.categoria_id,
    count(*) as total_produtos,
    round(avg(p.preco), 2) as preco_medio,
    max(p.preco) as preco_maximo
from produtos p
group by p.categoria_id
having avg(p.preco) > 500.00
order by preco_medio desc;