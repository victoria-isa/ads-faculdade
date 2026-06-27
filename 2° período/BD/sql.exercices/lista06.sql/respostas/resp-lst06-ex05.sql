select 
    p.nome as produto,
    p.preco as valor_em_reais
from produtos p
where p.categoria_id = 1

union all

select 
    p.nome as artigo,
    p.preco as preco_atual
from produtos p
where p.categoria_id = 2
order by valor_em_reais desc;