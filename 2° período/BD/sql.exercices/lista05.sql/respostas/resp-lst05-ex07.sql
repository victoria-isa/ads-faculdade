select 
    c.nome as categoria,
    p.nome as produto,
    p.preco
from categorias c
inner join produtos p on c.id = p.categoria_id
where p.preco = (select min(preco) from produtos where categoria_id = c.id)
order by c.nome;