select 
    p.nome as produto,
    p.preco,
    e.quantidade as estoque
from produtos p
inner join estoque e on p.id = e.produto_id
order by p.nome;