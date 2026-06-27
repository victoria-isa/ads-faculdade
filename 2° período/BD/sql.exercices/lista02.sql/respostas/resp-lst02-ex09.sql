select 
    pe.id,
    to_char(pe.criado_em, 'DD/MM/YYYY') as data_pedido,
    pe.valor_total,
    to_char(pe.valor_total, 'R$ 9999.90') as valor_formatado
from pedidos pe
where pe.status = 'entregue'
order by pe.valor_total desc;