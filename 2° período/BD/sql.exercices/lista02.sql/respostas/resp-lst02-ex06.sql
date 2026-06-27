select 
    c.nome,
    length(c.nome) as tamanho_nome,
    c.nome || ' <' || c.email || '>' as contato_formatado
from clientes c
order by tamanho_nome desc, c.nome asc;