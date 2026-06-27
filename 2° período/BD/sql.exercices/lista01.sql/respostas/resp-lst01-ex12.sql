--12
select c.nome , c.telefone , c.criado_em 
from clientes c
where c.criado_em between'2024-04-01' and '2024-06-30'
and c.telefone is not null
order by c.nome desc;