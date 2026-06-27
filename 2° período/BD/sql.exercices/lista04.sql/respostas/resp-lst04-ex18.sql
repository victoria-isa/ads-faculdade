select 
    p.nome as nome_do_produto,
    coalesce(e.quantidade, 0) as estoque_atual,
    coalesce(sum(case when m.tipo = 'entrada' then m.quantidade else 0 end), 0) as total_entradas_historico,
    coalesce(sum(case when m.tipo = 'saida' then m.quantidade else 0 end), 0) as total_saidas_historico,
    coalesce(sum(case when m.tipo = 'entrada' then m.quantidade else -m.quantidade end), 0) as diferenca_calculada
from produtos p
left join estoque e on p.id = e.produto_id
left join movimentacoes_estoque m on p.id = m.produto_id
group by p.id, p.nome, e.quantidade
order by p.nome;