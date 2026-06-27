select 
    p.nome,
    p.preco,
    abs(p.preco - 400.00) as distancia_de_400
from produtos p
order by distancia_de_400 asc, p.preco asc
limit 5;