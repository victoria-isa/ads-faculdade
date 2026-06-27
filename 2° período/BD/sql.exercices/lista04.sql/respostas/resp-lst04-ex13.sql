select 
    c.nome as nome_da_categoria,
    sum(ip.quantidade * ip.preco_unitario) as faturamento_total
from itens_pedido ip
inner join produtos p on ip.produto_id = p.id
inner join categorias c on p.categoria_id = c.id
inner join pedidos pe on ip.pedido_id = pe.id
where pe.status = 'entregue'
group by c.id, c.nome
order by faturamento_total desc;