select 
    p.nome,
    p.preco,
    p.categoria_id
from produtos p
where (p.preco, p.categoria_id) in (select preco, categoria_id from produtos where categoria_id = 4)
order by p.nome;