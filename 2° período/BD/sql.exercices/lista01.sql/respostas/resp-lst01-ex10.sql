--10
select p.nome, p.preco, p.categoria_id 
from produtos p
where p.preco >= 400 and p.categoria_id in (1,2,3)
order by p.categoria_id asc, p.preco desc;