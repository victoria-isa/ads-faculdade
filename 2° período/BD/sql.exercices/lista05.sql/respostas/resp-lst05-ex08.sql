select 
    c.nome
from clientes c
where c.id not in (select p.cliente_id from pedidos p where p.status = 'entregue')
order by c.nome;