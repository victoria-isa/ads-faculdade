with faturamento_mensal as (
    select 
        extract(month from p.criado_em) as mes,
        sum(p.valor_total) as faturamento
    from pedidos p
    where p.status != 'cancelado'
    group by extract(month from p.criado_em)
)
select 
    fm.mes,
    fm.faturamento as faturamento_mensal,
    round(fm.faturamento - (select avg(faturamento) from faturamento_mensal), 2) as diferenca_da_media
from faturamento_mensal fm
where fm.faturamento > (select avg(faturamento) from faturamento_mensal)
order by fm.faturamento desc;