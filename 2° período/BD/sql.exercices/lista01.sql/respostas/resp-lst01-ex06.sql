--6
select p.nome, p.preco , p.id 
from produtos p 
where p.preco between '200' and '600'
order by p.id asc;