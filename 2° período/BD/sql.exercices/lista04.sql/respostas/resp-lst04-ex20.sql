select 
    c.nome as nome_do_cliente,
    count(distinct pe.id) as total_pedidos,
    coalesce(sum(case when pe.status = 'entregue' then pe.valor_total else 0 end), 0) as total_gasto,
    coalesce(count(distinct case when pe.status = 'entregue' then ip.produto_id end), 0) as produtos_distintos,
    coalesce(
        string_agg(distinct cat.nome, ', ' order by cat.nome) 
        filter (where pe.status = 'entregue'), 
        ''
    ) as categorias_compradas,
    case 
        when count(case when pe.status = 'entregue' then pe.id end) > 0 
        then round(sum(case when pe.status = 'entregue' then pe.valor_total else 0 end) / 
                   count(case when pe.status = 'entregue' then pe.id end), 2)
        else null
    end as valor_medio_por_pedido
from clientes c
left join pedidos pe on c.id = pe.cliente_id
left join itens_pedido ip on pe.id = ip.pedido_id
left join produtos p on ip.produto_id = p.id
left join categorias cat on p.categoria_id = cat.id
group by c.id, c.nome
order by total_gasto desc, c.nome;