select 
    p.id as id_do_pedido,
    c.nome as nome_do_cliente,
    p.valor_total,
    p.status
from pedidos p
inner join clientes c on p.cliente_id = c.id
order by p.id;