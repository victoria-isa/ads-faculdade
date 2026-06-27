select 
    p.nome
from produtos p
where not exists (select 1 from itens_pedido ip where ip.produto_id = p.id)
order by p.nome;