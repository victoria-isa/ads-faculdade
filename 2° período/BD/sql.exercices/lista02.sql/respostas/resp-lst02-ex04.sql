select 
    c.nome,
    c.criado_em,
    extract(month from c.criado_em) as mes,
    extract(day from c.criado_em) as dia
from clientes c
where extract(month from c.criado_em) between 1 and 3
order by c.criado_em asc;