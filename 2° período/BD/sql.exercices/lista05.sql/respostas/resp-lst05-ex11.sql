select 
    p.nome as produto,
    sum(m.quantidade) as total_saidas
from movimentacoes_estoque m
inner join produtos p on m.produto_id = p.id
where m.tipo = 'saida'
    and m.pedido_id is not null
    and exists (
        select 1 
        from pedidos pe 
        where pe.id = m.pedido_id 
            and pe.status in ('confirmado', 'enviado')
    )
group by p.id, p.nome
order by total_saidas desc;