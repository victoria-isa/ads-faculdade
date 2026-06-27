select 
    c.nome as cliente,
    p.nome as produto,
    compras.vezes_comprado
from (
    select 
        pe.cliente_id,
        ip.produto_id,
        count(distinct pe.id) as vezes_comprado
    from itens_pedido ip
    inner join pedidos pe on ip.pedido_id = pe.id
    where pe.status = 'entregue'
    group by pe.cliente_id, ip.produto_id
    having count(distinct pe.id) >= 2
) as compras
inner join clientes c on compras.cliente_id = c.id
inner join produtos p on compras.produto_id = p.id
order by compras.vezes_comprado desc, c.nome, p.nome;