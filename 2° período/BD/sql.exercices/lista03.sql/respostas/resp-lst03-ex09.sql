select 
    extract(month from p.criado_em) as mes,
    count(*) as total_pedidos,
    sum(p.valor_total) as receita_total,
    round(avg(p.valor_total), 2) as ticket_medio
from pedidos p
where p.status != 'cancelado'
group by extract(month from p.criado_em)
having sum(p.valor_total) > 2000.00
order by receita_total desc;