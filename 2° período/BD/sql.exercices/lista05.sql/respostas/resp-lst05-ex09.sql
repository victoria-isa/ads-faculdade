select 
    c.nome,
    coalesce(r.receita, 0) as receita
from clientes c
left join (
    select 
        p.cliente_id,
        sum(p.valor_total) as receita
    from pedidos p
    group by p.cliente_id
) as r on c.id = r.cliente_id
order by receita desc;