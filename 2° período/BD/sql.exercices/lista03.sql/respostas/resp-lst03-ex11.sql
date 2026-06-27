select 
    ip.pedido_id,
    count(*) as total_itens,
    sum(ip.quantidade) as total_unidades,
    round(avg(ip.preco_unitario), 2) as preco_medio_item
from itens_pedido ip
group by ip.pedido_id
having count(*) >= 2
order by preco_medio_item desc;