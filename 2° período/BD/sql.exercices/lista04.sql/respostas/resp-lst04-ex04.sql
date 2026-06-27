select 
    c.nome
from categorias c
left join produtos p on c.id = p.categoria_id
where p.id is null;