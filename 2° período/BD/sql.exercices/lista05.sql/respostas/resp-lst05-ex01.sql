select 
    p.nome,
    p.preco
from produtos p
where p.preco > (select avg(preco) from produtos)
order by p.preco desc;