select 
    c.nome as nome_da_categoria,
    sum(e.quantidade) as total_estoque
from categorias c
inner join produtos p on c.id = p.categoria_id
inner join estoque e on p.id = e.produto_id
group by c.id, c.nome
order by c.nome;