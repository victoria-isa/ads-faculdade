--11
select p.nome, p.preco 
from produtos p 
where p.nome ilike '%Pro%' or p.preco > '3000'
order by p.preco desc;