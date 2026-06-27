select 
    extract(month from c.criado_em) as mes,
    count(*) as total_clientes,
    count(c.telefone) as clientes_com_telefone
from clientes c
group by extract(month from c.criado_em)
having count(*) >= 2
order by mes asc;