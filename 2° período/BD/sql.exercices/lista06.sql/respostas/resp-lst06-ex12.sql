select 
    c.nome as cliente
from clientes c
where c.id in (select cliente_id from pedidos where status = 'entregue')

except

select 
    c.nome as cliente
from clientes c
where c.id in (select cliente_id from pedidos where status = 'cancelado')
order by cliente;