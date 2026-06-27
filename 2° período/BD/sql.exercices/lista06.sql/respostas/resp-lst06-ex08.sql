select 
    c.nome as cliente
from clientes c
where c.id in (select cliente_id from pedidos)

except

(
    select 
        c.nome as cliente
    from clientes c
    where c.id in (select cliente_id from pedidos where status = 'entregue')
    
    union
    
    select 
        c.nome as cliente
    from clientes c
    where c.id in (select cliente_id from pedidos where status = 'confirmado')
    
    union
    
    select 
        c.nome as cliente
    from clientes c
    where c.id in (select cliente_id from pedidos where status = 'enviado')
)
order by cliente;