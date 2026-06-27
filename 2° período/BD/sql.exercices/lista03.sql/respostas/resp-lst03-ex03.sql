select 
    p.status,
    count(*) as total_pedidos,
    sum(p.valor_total) as receita_total,
    round(avg(p.valor_total), 2) as ticket_medio
from pedidos p
group by p.status
order by total_pedidos desc;