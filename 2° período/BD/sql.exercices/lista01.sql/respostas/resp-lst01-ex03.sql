--3
select p.id, p.valor_total , p.status 
from pedidos p
where p.status in ('enviado', 'confirmado')
order by p.id asc;