select 
    p.nome as nome_do_produto,
    ip.quantidade,
    ip.preco_unitario,
    (ip.quantidade * ip.preco_unitario) as subtotal
from itens_pedido ip
inner join produtos p on ip.produto_id = p.id
where ip.pedido_id = 5;