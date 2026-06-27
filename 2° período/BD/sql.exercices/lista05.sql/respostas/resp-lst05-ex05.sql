select 
    p.nome,
    p.preco,
    (select avg(preco) from produtos where categoria_id = 4) as media_categoria
from produtos p
where p.categoria_id = 4
order by p.preco desc;