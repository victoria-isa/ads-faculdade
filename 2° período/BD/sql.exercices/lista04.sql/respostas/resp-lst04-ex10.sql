select 
    c.nome as nome_do_cliente,
    round(avg(p.valor_total), 2) as valor_medio
from clientes c
inner join pedidos p on c.id = p.cliente_id
group by c.id, c.nome;