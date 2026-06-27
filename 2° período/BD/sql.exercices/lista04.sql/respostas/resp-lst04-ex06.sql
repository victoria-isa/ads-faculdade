select 
    p.nome,
    p.preco
from produtos p
left join itens_pedido ip on p.id = ip.produto_id
where ip.id is null
order by p.preco desc;