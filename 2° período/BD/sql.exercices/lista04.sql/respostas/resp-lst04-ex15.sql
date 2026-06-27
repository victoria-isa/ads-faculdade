select 
    c.nome as nome_do_cliente,
    count(distinct cat.id) as quantidade_de_categorias,
    string_agg(distinct cat.nome, ', ' order by cat.nome) as categorias
from clientes c
inner join pedidos pe on c.id = pe.cliente_id
inner join itens_pedido ip on pe.id = ip.pedido_id
inner join produtos p on ip.produto_id = p.id
inner join categorias cat on p.categoria_id = cat.id
where pe.status = 'entregue'
group by c.id, c.nome
having count(distinct cat.id) >= 3
order by quantidade_de_categorias desc;