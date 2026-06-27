select 
    count(*) as total_clientes,
    count(telefone) as clientes_com_telefone
from clientes c;