# Lista de Exercícios: Capítulo 4.3 — Combinando Várias Tabelas: Operadores de Conjunto

## Pré-requisitos

- Execute o script `production_artifacts/setup/setup_cap04.sql` para preparar o banco de dados `loja`.

---

## Nível 1: Fixação (Fácil)

### Questão 1 — Clientes com pedidos em andamento (UNION ALL com rótulo)

Gere um relatório que lista, em uma única coluna, todos os clientes que têm ao menos um pedido
com status `'pendente'` e também os que têm ao menos um pedido com status `'enviado'`.

Use `UNION ALL` para manter linhas repetidas caso um cliente apareça nos dois grupos, e inclua uma coluna
`situacao` com o rótulo `'pedido pendente'` ou `'pedido enviado'` conforme o grupo.

**Colunas esperadas:** `cliente`, `situacao`

**Resultado esperado:** 6 linhas (4 com `'pedido pendente'`, 2 com `'pedido enviado'`)

**Dica:** Não elimine duplicatas entre os grupos — o mesmo cliente poderia ter pedido pendente E enviado ao mesmo tempo, e ambas as linhas devem aparecer.

---

### Questão 2 — Produtos com movimentações em aberto (UNION sem duplicatas)

Liste o nome de todos os produtos que aparecem em pedidos com status `'pendente'` **ou** com status `'confirmado'`,
sem repetir o mesmo produto. Ordene pelo nome do produto.

**Coluna esperada:** `produto`

**Resultado esperado:** 8 linhas

---

### Questão 3 — Clientes com entrega E cancelamento (INTERSECT)

Identifique os clientes que têm ao menos um pedido com status `'entregue'` **e**, ao mesmo tempo,
ao menos um pedido com status `'cancelado'`. Use `INTERSECT`.

**Coluna esperada:** `cliente`

**Resultado esperado:** 1 linha

---

### Questão 4 — Produtos cancelados que nunca foram entregues (EXCEPT)

Liste os produtos que aparecem em pedidos cancelados, mas que **nunca** aparecem em pedidos
com status `'entregue'`. Use `EXCEPT`. Ordene pelo nome do produto.

**Coluna esperada:** `produto`

**Resultado esperado:** 2 linhas

---

### Questão 5 — A regra dos aliases (UNION ALL)

Execute as duas queries abaixo combinadas com `UNION ALL` e observe as colunas do resultado:

- **Primeira query:** produtos da categoria `'Eletrônicos'` (`categoria_id = 1`) com alias `produto` para nome e `valor_em_reais` para preço.
- **Segunda query:** produtos da categoria `'Informática'` (`categoria_id = 2`) com alias `artigo` para nome e `preco_atual` para preço.

Ordene pelo valor decrescente e responda: quais nomes de coluna aparecem no resultado?

**Colunas esperadas:** as da **primeira** query (`produto`, `valor_em_reais`)

**Resultado esperado:** 8 linhas (4 de Eletrônicos + 4 de Informática)

---

## Nível 2: Prática (Intermediário)

### Questão 6 — Hierarquia de categorias com nível (UNION ALL)

A tabela `categorias` possui autorelacionamento: categorias raiz têm `categoria_id IS NULL` e
subcategorias apontam para o id da categoria pai.

Use `UNION ALL` para construir uma lista consolidada de todas as categorias com uma coluna `nivel`
que indica `'raiz'` ou `'subcategoria'` conforme o caso. Ordene por `nivel` e depois por `nome`.

**Colunas esperadas:** `nome`, `nivel`

**Resultado esperado:** 8 linhas (5 raiz + 3 subcategoria)

---

### Questão 7 — Produtos com histórico de entrega e demanda ativa (INTERSECT)

Identifique os produtos que aparecem **simultaneamente** em pedidos com status `'entregue'`
e em pedidos com status `'pendente'`. Esses são os produtos com histórico de vendas concluídas
que ainda têm demanda ativa. Ordene pelo nome do produto.

**Coluna esperada:** `produto`

**Resultado esperado:** 2 linhas

---

### Questão 8 — Clientes sem pedido em status final positivo (EXCEPT + UNION)

Liste os clientes que têm ao menos um pedido, mas **não** possuem nenhum pedido com status
`'entregue'`, `'confirmado'` ou `'enviado'`. Ordene pelo nome do cliente.

**Dica:** Construa o segundo operando do `EXCEPT` unindo os três conjuntos (clientes com entregue,
com confirmado e com enviado) usando `UNION`. Como `EXCEPT` e `UNION` têm a mesma precedência e
são avaliados da esquerda para a direita, use **parênteses** ao redor do bloco `UNION` para garantir
que ele seja calculado antes do `EXCEPT`.

**Coluna esperada:** `cliente`

**Resultado esperado:** 3 linhas

---

### Questão 9 — Relatório de anomalias de estoque (UNION)

Combine em uma única lista os dois tipos de anomalia de estoque:

- Produtos com quantidade atual igual a **zero** (produto indisponível) — rótulo: `'estoque zerado'`
- Produtos que apareceram em **pedidos cancelados** (demanda que não se concretizou) — rótulo: `'pedido cancelado'`

Use `UNION` para eliminar duplicatas caso um produto se enquadre nas duas categorias.
Ordene por `anomalia` e depois por `produto`.

**Colunas esperadas:** `produto`, `anomalia`

**Resultado esperado:** 4 linhas

---

## Nível 3: Desafio (Difícil)

### Questão 10 — Produtos "ideais" do catálogo (INTERSECT + EXCEPT)

Identifique os produtos que satisfazem **todas** as condições a seguir:

1. Têm saldo positivo em estoque (`quantidade > 0`)
2. Já foram vendidos em ao menos um pedido `'entregue'`
3. **Nunca** apareceram em pedidos `'cancelado'`

Use `INTERSECT` para reunir os grupos 1 e 2, e depois `EXCEPT` para excluir o grupo 3.
Ordene pelo nome do produto.

**Coluna esperada:** `produto`

**Resultado esperado:** 7 linhas

> **Atenção:** `INTERSECT` e `EXCEPT` têm a mesma precedência e são avaliados da esquerda para a
> direita. Verifique se a ordem dos operadores no seu código produz o resultado correto.

---

### Questão 11 — Faturamento consolidado por status ativo (UNION ALL de agregações)

Use `UNION ALL` para construir um relatório de faturamento que reúna, em um único resultado,
o total de pedidos e a soma do `valor_total` para cada um dos dois status que representam
receita confirmada: `'entregue'` e `'confirmado'`.

Inclua as colunas `status`, `total_pedidos` e `faturamento`. Ordene pelo faturamento decrescente.

**Resultado esperado:** 2 linhas

| status | total_pedidos | faturamento |
|--------|--------------|-------------|
| entregue | 5 | 13369.20 |
| confirmado | 2 | 1829.70 |

---

### Questão 12 — Clientes com histórico limpo (EXCEPT)

Identifique os clientes que compraram algo **e tiveram ao menos uma entrega concluída**,
mas que **nunca** tiveram nenhum pedido `'cancelado'`. Ordene pelo nome do cliente.

Use `EXCEPT` entre os dois conjuntos.

**Coluna esperada:** `cliente`

**Resultado esperado:** 4 linhas (Ana Lima, Bruno Souza, Carla Mendes, Diego Ferreira)
