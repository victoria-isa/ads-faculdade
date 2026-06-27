select 
    'entregue' as status,
    count(*) as total_pedidos,
    sum(valor_total) as faturamento
from pedidos
where status = 'entregue'

union all

select 
    'confirmado' as status,
    count(*) as total_pedidos,
    sum(valor_total) as faturamento
from pedidos
where status = 'confirmado'
order by faturamento desc;