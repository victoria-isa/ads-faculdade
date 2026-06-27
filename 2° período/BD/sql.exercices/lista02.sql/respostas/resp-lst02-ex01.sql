select 
    p.nome,
    p.preco,
    round(p.preco * 0.85, 2) as preco_com_desconto
from produtos p
order by preco_com_desconto desc;