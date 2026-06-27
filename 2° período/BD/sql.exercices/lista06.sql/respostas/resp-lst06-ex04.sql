select 
    p.nome as produto
from produtos p
where p.id in (select ip.produto_id from itens_pedido ip where ip.pedido_id in (select id from pedidos where status = 'cancelado'))

except

select 
    p.nome as produto
from produtos p
where p.id in (select ip.produto_id from itens_pedido ip where ip.pedido_id in (select id from pedidos where status = 'entregue'))
order by produto;