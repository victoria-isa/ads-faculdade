select 
    c.nome,
    'raiz' as nivel
from categorias c
where c.categoria_id is null

union all

select 
    c.nome,
    'subcategoria' as nivel
from categorias c
where c.categoria_id is not null
order by nivel, nome;