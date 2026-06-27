select 
    c.nome,
    length(c.nome) as tamanho_nome,
    upper(c.email) as email_maiusculo
from clientes c
order by tamanho_nome desc, c.nome asc;