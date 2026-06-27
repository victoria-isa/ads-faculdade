select 
    p.status,
    count(*) as total_pedidos,
    sum(p.valor_total) as receita_total,
    round(avg(p.valor_total), 2) as ticket_medio
from pedidos p
where p.status != 'cancelado'
group by p.status
order by receita_total desc;