select 
    extract(month from p.criado_em) as mes,
    count(*) as total_pedidos,
    sum(p.valor_total) as receita_total
from pedidos p
group by extract(month from p.criado_em)
having count(*) >= 3
order by mes asc;