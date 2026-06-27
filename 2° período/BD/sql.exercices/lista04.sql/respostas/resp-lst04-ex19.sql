with faixas as (
    select '0-500' as faixa, 0 as limite_inferior, 500 as limite_superior
    union all
    select '501-1000', 501, 1000
    union all
    select '1001-2000', 1001, 2000
    union all
    select '2000+', 2001, 999999
)
select 
    f.faixa,
    count(p.id) as quantidade_pedidos,
    coalesce(sum(p.valor_total), 0) as valor_total_faixa,
    coalesce(round(avg(p.valor_total), 2), 0) as ticket_medio_faixa
from faixas f
left join pedidos p on p.valor_total between f.limite_inferior and f.limite_superior
group by f.faixa, f.limite_inferior
order by f.limite_inferior;