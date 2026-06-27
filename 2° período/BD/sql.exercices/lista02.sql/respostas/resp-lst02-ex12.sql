select 
    pe.id,
    to_char(pe.criado_em, 'DD/MM/YYYY') as data_pedido,
    pe.valor_total,
    case
        when pe.status = 'entregue' then 'Concluído'
        when pe.status = 'confirmado' then 'Pagamento confirmado'
        when pe.status = 'enviado' then 'Em transporte'
        when pe.status = 'pendente' then 'Aguardando pagamento'
        when pe.status = 'cancelado' then 'Cancelado'
    end as descricao_status
from pedidos pe
where pe.valor_total >= 1000.00
order by 
    case 
        when pe.status = 'entregue' then 1
        when pe.status = 'confirmado' then 2
        when pe.status = 'enviado' then 3
        when pe.status = 'pendente' then 4
        when pe.status = 'cancelado' then 5
    end,
    pe.valor_total desc;