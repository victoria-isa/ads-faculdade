select 
    c.nome,
    c.email,
    c.telefone
from clientes c
left join pedidos p on c.id = p.cliente_id
where p.id is null;