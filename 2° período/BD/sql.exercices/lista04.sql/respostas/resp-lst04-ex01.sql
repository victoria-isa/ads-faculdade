select 
    p.nome as produto,
    c.nome as categoria
from produtos p
inner join categorias c on p.categoria_id = c.id
order by c.nome, p.nome;