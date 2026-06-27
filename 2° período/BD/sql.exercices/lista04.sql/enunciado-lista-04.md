# Lista de Exercícios: Capítulo 4.1 — Combinando Várias Tabelas: Junções (JOINs)

## Pré-requisitos

- Execute o script `production_artifacts/setup/setup_cap04.sql` para preparar o banco de dados `loja`.

---

## Nível 1: Fixação (Fácil)

### Questão 1 — Produtos com suas categorias (INNER JOIN básico)
Liste o nome de cada produto e o nome da sua categoria. Ordene pelo nome da categoria e depois pelo nome do produto.

**Colunas esperadas:** `produto`, `categoria`

---

### Questão 2 — Clientes e seus pedidos (INNER JOIN)
Liste todos os pedidos com o nome do cliente correspondente. Mostre `id_do_pedido`, `nome_do_cliente`, `valor_total` e `status`. Ordene por `id_do_pedido`.

---

### Questão 3 — Produtos com informações de estoque (INNER JOIN)
Liste o nome do produto, seu preço e a quantidade disponível em estoque. Ordene pelo nome do produto.

**Colunas esperadas:** `produto`, `preco`, `estoque`

---

### Questão 4 — Categorias sem produtos (LEFT JOIN + IS NULL)
Encontre todas as categorias que não possuem nenhum produto associado. Mostre o `nome` da categoria.

**Dica:** Categorias 6 (Smartphones), 7 (Periféricos) e 8 (Consoles e Jogos) são subcategorias sem produtos no seed.

---

### Questão 5 — Produtos com estoque zerado (INNER JOIN + WHERE)
Liste os produtos que estão com estoque zerado (`quantidade = 0`). Mostre `id_do_produto`, `nome` e `preco`.

**Resposta esperada:** Apenas o produto "Hub USB-C 7 em 1".

---

### Questão 6 — Produtos nunca vendidos (LEFT JOIN + IS NULL)
Encontre os produtos que nunca foram vendidos (não aparecem em `itens_pedido`). Mostre `nome` e `preco`. Ordene por preço decrescente.

**Resposta esperada:** 5 produtos (Teclado Mecânico RGB, Impressora Laser Mono, Microfone Condensador, Suporte para Monitor, Refil de Toner)

---

## Nível 2: Prática (Intermediário)

### Questão 7 — Itens de um pedido específico (2 INNER JOINs)
Liste todos os itens do pedido `id = 5`. Mostre `nome_do_produto`, `quantidade`, `preco_unitario` (pago no pedido) e `subtotal` (quantidade × preco_unitario como uma coluna calculada).

---

### Questão 8 — Total gasto por cliente (INNER JOIN + GROUP BY)
Calcule o valor total gasto por cada cliente (soma do `valor_total` da tabela `pedidos`). Mostre `nome_do_cliente` e `total_gasto`. Ordene do maior gasto para o menor.

**Dica:** Use `SUM(pedidos.valor_total)` e agrupe por cliente.

---

### Questão 9 — Produtos mais vendidos (em quantidade) (INNER JOIN + GROUP BY + ORDER BY LIMIT)
Liste os 5 produtos mais vendidos em termos de quantidade total (some a coluna `quantidade` da tabela `itens_pedido`). Mostre `nome_do_produto` e `total_vendido`. Ordene do mais vendido para o menos vendido.

---

### Questão 10 — Valor médio dos pedidos por cliente (INNER JOIN + GROUP BY)
Para cada cliente, calcule o valor médio dos seus pedidos (média do `valor_total`). Mostre `nome_do_cliente` e `valor_medio`, arredondado para 2 casas decimais. Considere apenas clientes que já fizeram pelo menos um pedido.

---

### Questão 11 — Clientes sem pedidos (LEFT JOIN + IS NULL)
Identifique clientes que nunca fizeram nenhum pedido. Mostre `nome`, `email` e `telefone`.

**Resposta esperada:** Nenhum cliente sem pedido no seed, mas a query deve funcionar para dados futuros.

---

### Questão 12 — Estoque por categoria (INNER JOIN + GROUP BY)
Calcule a quantidade total em estoque por categoria. Mostre `nome_da_categoria` e `total_estoque`. Ordene por nome da categoria.

**Dica:** Use `SUM(e.quantidade)` e faça JOIN entre `produtos` → `categorias` → `estoque`.

---

### Questão 13 — Faturamento por categoria (pedidos entregues) (Múltiplos JOINs + GROUP BY)
Calcule o faturamento total por categoria considerando **apenas pedidos com status 'entregue'**. Mostre `nome_da_categoria` e `faturamento_total`. Ordene do maior para o menor faturamento.

**Requer:** JOIN entre 4 tabelas (`itens_pedido` → `produtos` → `categorias` → `pedidos`)

---

### Questão 14 — Produtos com preço acima da média da sua categoria (SELF JOIN ou JOIN com agregação)
Encontre produtos cujo preço seja **superior à média de preços da sua própria categoria**. Mostre `nome_do_produto`, `preco`, `nome_da_categoria` e `media_da_categoria`. Ordene por categoria e depois por preço decrescente.

**Dica:** Use uma **tabela derivada** (subconsulta no FROM) para calcular a média por categoria, depois faça JOIN com a tabela de produtos.

---

## Nível 3: Desafio (Difícil)

### Questão 15 — Clientes que compraram produtos de múltiplas categorias
Encontre clientes que compraram produtos de **pelo menos 3 categorias diferentes** (em pedidos com status 'entregue'). Mostre `nome_do_cliente`, `quantidade_de_categorias` e a lista das categorias (use `STRING_AGG`). Ordene por quantidade decrescente.

**Requer:** JOINs entre 5 tabelas, `COUNT(DISTINCT)`, `STRING_AGG`, `HAVING`

---

### Questão 16 — Hierarquia de categorias (SELF JOIN)
A tabela `categorias` possui autorelacionamento (`categoria_id` referencia o pai). Construa uma query que exiba:
- `subcategoria` (nome da categoria filha)
- `categoria_pai` (nome da categoria pai, ou NULL se for raiz)

**Requer:** `LEFT JOIN` da tabela `categorias` com ela mesma.

**Resposta esperada:** 8 linhas — 5 categorias raiz (com pai NULL) e 3 subcategorias.

---

### Questão 17 — Comparação de faturamento vs estoque por categoria raiz
Para cada **categoria raiz** (categorias que não têm pai — `categoria_id IS NULL`), calcule:
- `total_vendido`: soma de `(quantidade × preco_unitario)` em pedidos entregues
- `total_estoque`: soma da quantidade em estoque de todos os produtos da categoria (incluindo subcategorias)

Mostre `categoria`, `total_vendido`, `total_estoque`. Ordene por total_vendido decrescente.

**Dica:** Produtos de 'Smartphones' (subcategoria) pertencem à raiz 'Eletrônicos'. Use uma **tabela derivada** que resolve a hierarquia antes de agregar.

---

## Nível 4: Desafio

### Questão 18 — Produtos com histórico completo de movimentações (LEFT JOIN com FK opcional)
Para cada produto, mostre:
- `nome_do_produto`
- `estoque_atual` (quantidade na tabela `estoque`)
- `total_entradas_historico` (soma das entradas em `movimentacoes_estoque`)
- `total_saidas_historico` (soma das saídas em `movimentacoes_estoque`)
- `diferenca_calculada` = `total_entradas_historico - total_saidas_historico`

Inclua **todos os produtos**, mesmo aqueles sem movimentações (diferenca_calculada será NULL). Ordene por `nome_do_produto`.

**Requer:** `LEFT JOIN` com agregação, tratamento de NULLs.

---

### Questão 19 — Análise de ticket médio por faixa de valor (CROSS JOIN + agregação)
Use `CROSS JOIN` para criar uma tabela de referência com faixas de valor (definidas manualmente) e depois distribua os pedidos por faixa:

Crie uma tabela derivada `faixas` com:
- `faixa`: '0-500', '501-1000', '1001-2000', '2000+'
- `limite_inferior`: 0, 501, 1001, 2001
- `limite_superior`: 500, 1000, 2000, 999999

Depois, para cada faixa, calcule:
- `quantidade_pedidos`
- `valor_total_faixa` (soma dos valor_total)
- `ticket_medio_faixa`

**Requer:** `CROSS JOIN` entre pedidos e a tabela de faixas, `GROUP BY` na faixa.

---

### Questão 20 — Relatório completo de desempenho por cliente (múltiplos JOINs + LEFT JOIN + agregações)
Construa um relatório para **todos os clientes** que inclua:
1. `nome_do_cliente`
2. `total_pedidos` (quantidade de pedidos — incluindo clientes sem pedidos, com valor 0)
3. `total_gasto` (soma do valor_total de pedidos entregues — 0 se nenhum)
4. `produtos_distintos` (quantidade de produtos diferentes comprados — 0 se nenhum)
5. `categorias_compradas` (lista concatenada de categorias distintas dos produtos comprados, sem duplicatas; NULL ou vazio se nenhuma)
6. `valor_medio_por_pedido` (total_gasto ÷ total_pedidos_entregues, ou NULL se nenhum pedido entregue)

Ordene por `total_gasto` decrescente, e depois por `nome_do_cliente`.

**Requer:**
- `LEFT JOIN` para garantir todos os clientes
- Múltiplos JOINs com `clientes` → `pedidos` → `itens_pedido` → `produtos` → `categorias`
- `COUNT(DISTINCT)` para produtos distintos
- `STRING_AGG(DISTINCT ...)` para categorias
- `COALESCE` para tratar NULLs
- `CASE` ou `NULLIF` para evitar divisão por zero

