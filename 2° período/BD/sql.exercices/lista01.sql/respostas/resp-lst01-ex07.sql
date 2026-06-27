--7
select p.id, p.cliente_id , p.valor_total , p.status 
from pedidos p
where p.cliente_id in (1,2,3) 
and p.status not in ('pendente', 'cancelado')
order by p.id asc;