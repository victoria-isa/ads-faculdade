--4
select p.nome, p.preco 
from produtos p 
where p.nome like 'C%'
order by p.nome asc;