select 
    c.nome
from clientes c
where exists (select 1 from pedidos p where p.cliente_id = c.id and p.status = 'pendente')
order by c.nome;