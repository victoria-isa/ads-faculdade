with categorias_raiz as (
    select 
        id,
        nome
    from categorias
    where categoria_id is null
),
todos_produtos_com_raiz as (
    select 
        p.id as produto_id,
        coalesce(raiz.id, c.id) as raiz_id
    from produtos p
    inner join categorias c on p.categoria_id = c.id
    left join categorias raiz on c.categoria_id = raiz.id
)
select 
    cr.nome as categoria,
    coalesce(sum(ip.quantidade * ip.preco_unitario), 0) as total_vendido,
    coalesce(sum(e.quantidade), 0) as total_estoque
from categorias_raiz cr
left join todos_produtos_com_raiz tpr on cr.id = tpr.raiz_id
left join itens_pedido ip on tpr.produto_id = ip.produto_id
left join pedidos pe on ip.pedido_id = pe.id and pe.status = 'entregue'
left join estoque e on tpr.produto_id = e.produto_id
group by cr.id, cr.nome
order by total_vendido desc;