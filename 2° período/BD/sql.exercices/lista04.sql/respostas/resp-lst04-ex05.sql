select 
    p.id as id_do_produto,
    p.nome,
    p.preco
from produtos p
inner join estoque e on p.id = e.produto_id
where e.quantidade = 0;