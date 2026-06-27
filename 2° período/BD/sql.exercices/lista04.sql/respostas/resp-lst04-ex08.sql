select 
    c.nome as nome_do_cliente,
    sum(p.valor_total) as total_gasto
from clientes c
inner join pedidos p on c.id = p.cliente_id
group by c.id, c.nome
order by total_gasto desc;