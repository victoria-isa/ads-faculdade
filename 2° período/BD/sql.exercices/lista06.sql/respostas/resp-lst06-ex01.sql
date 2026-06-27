select 
    c.nome as cliente,
    'pedido pendente' as situacao
from clientes c
where c.id in (select cliente_id from pedidos where status = 'pendente')

union all

select 
    c.nome as cliente,
    'pedido enviado' as situacao
from clientes c
where c.id in (select cliente_id from pedidos where status = 'enviado')
order by cliente, situacao;