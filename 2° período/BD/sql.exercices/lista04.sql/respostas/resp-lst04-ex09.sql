select 
    p.nome as nome_do_produto,
    sum(ip.quantidade) as total_vendido
from itens_pedido ip
inner join produtos p on ip.produto_id = p.id
group by p.id, p.nome
order by total_vendido desc
limit 5;