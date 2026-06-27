select 
    p.nome as produto,
    'estoque zerado' as anomalia
from produtos p
inner join estoque e on p.id = e.produto_id
where e.quantidade = 0

union

select 
    p.nome as produto,
    'pedido cancelado' as anomalia
from produtos p
where p.id in (select ip.produto_id from itens_pedido ip where ip.pedido_id in (select id from pedidos where status = 'cancelado'))
order by anomalia, produto;