select 
    lpad(p.id::text, 5, '0') as codigo_produto,
    p.nome,
    to_char(p.preco, 'R$ 999.90') as preco_formatado
from produtos p
where p.preco < 200.00
order by p.preco asc;