select 
    p.nome as nome_do_produto,
    p.preco,
    c.nome as nome_da_categoria,
    round(media.media_preco, 2) as media_da_categoria
from produtos p
inner join categorias c on p.categoria_id = c.id
inner join (
    select 
        categoria_id,
        avg(preco) as media_preco
    from produtos
    group by categoria_id
) as media on p.categoria_id = media.categoria_id
where p.preco > media.media_preco
order by c.nome, p.preco desc;