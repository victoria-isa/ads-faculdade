select 
    count(*) as total_pedidos,
    sum(valor_total) as receita_total,
    round(avg(valor_total), 2) as ticket_medio,
    min(valor_total) as menor_pedido,
    max(valor_total) as maior_pedido
from pedidos p;