select 
    c.nome as subcategoria,
    pai.nome as categoria_pai
from categorias c
left join categorias pai on c.categoria_id = pai.id
order by pai.nome nulls first, c.nome;