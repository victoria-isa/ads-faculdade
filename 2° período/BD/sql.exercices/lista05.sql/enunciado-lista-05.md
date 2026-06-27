# Lista de Exercícios: Capítulo 4.2 — Combinando Várias Tabelas: Subconsultas

## Pré-requisitos

- Execute o script de setup do capítulo (ou garanta que as tabelas estejam criadas e populadas conforme o seed original).

---

## Nível 1: Fixação (Fácil)

Os exercícios a seguir focam em um conceito por vez. Se travou, releia a seção correspondente do capítulo antes de tentar novamente.

### Exercício 1 — Produtos acima da média geral

Escreva uma consulta que retorne o `nome` e o `preco` de todos os produtos cujo preço é **maior que o preço médio de todos os produtos**. Use uma subconsulta escalar no `WHERE`.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `preco`
- [ ] A query retorna exatamente 6 linhas
- [ ] Todos os produtos retornados têm `preco > (SELECT AVG(preco) FROM produtos)`
- [ ] Os resultados estão ordenados por `preco` decrescente

---

### Exercício 2 — Clientes com pedido entregue (usando IN)

Retorne o `nome` dos clientes que possuem **pelo menos um** pedido com status `'entregue'`. Utilize a cláusula `IN` com uma subconsulta.

**Critérios de conclusão:**
- [ ] A coluna retornada é: `nome`
- [ ] A query retorna exatamente 5 linhas
- [ ] A subconsulta seleciona os `cliente_id` da tabela `pedidos` com `status = 'entregue'`
- [ ] Os resultados estão ordenados alfabeticamente por `nome`

---

### Exercício 3 — Clientes com pedido pendente (usando EXISTS)

Refaça o exercício L1.2, mas para pedidos com status `'pendente'`. Utilize `EXISTS` com uma subconsulta correlacionada.

**Critérios de conclusão:**
- [ ] A coluna retornada é: `nome`
- [ ] A query retorna exatamente 4 linhas
- [ ] A subconsulta referencia `cliente_id` da consulta externa
- [ ] Os resultados estão ordenados alfabeticamente por `nome`

---

### Exercício 4 — Produtos nunca vendidos (usando NOT EXISTS)

Liste o `nome` dos produtos que **nunca** apareceram na tabela `itens_pedido` (ou seja, nunca foram vendidos). Use `NOT EXISTS`.

**Critérios de conclusão:**
- [ ] A coluna retornada é: `nome`
- [ ] A query retorna exatamente 5 linhas
- [ ] Nenhum dos produtos retornados possui registro em `itens_pedido`
- [ ] Os resultados estão ordenados alfabeticamente por `nome`

---

### Exercício 5 — Média da categoria no SELECT

Para cada produto da categoria `'Games'` (`categoria_id = 4`), exiba o `nome`, o `preco` e a média de preço de **todos os produtos da mesma categoria** (alias `media_categoria`). Use uma subconsulta escalar na lista de `SELECT`.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `preco`, `media_categoria`
- [ ] A query retorna exatamente 4 linhas (todos os produtos da categoria 4)
- [ ] O valor de `media_categoria` é o mesmo para todas as linhas: `1449.90`
- [ ] Os resultados estão ordenados por `preco` decrescente

---

## Nível 2: Prática (Intermediário)

Cada exercício combina dois ou mais conceitos do capítulo. Leia o enunciado com atenção antes de montar a query.

### Exercício 6 — Produtos com mesmo preço e categoria que algum produto da categoria "Games"

Utilize uma subconsulta com **múltiplas colunas** (`(preco, categoria_id) IN (...)`) para encontrar produtos que tenham **exatamente o mesmo preço e a mesma categoria** que algum produto da categoria `'Games'` (`categoria_id = 4`). Exiba `nome`, `preco`, `categoria_id`. Exclua o próprio produto `'Console Next Gen'` se necessário (mas ele deve aparecer? Na verdade ele mesmo se encaixa, mas o resultado esperado deve trazer também `'Headset Gamer 7.1'`? Verifique os dados).

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `preco`, `categoria_id`
- [ ] A query retorna exatamente 2 linhas: `Console Next Gen` (categoria 4) e `Headset Gamer 7.1` (categoria 4) – ambos têm preço e categoria iguais a algum produto da categoria 4 (eles próprios ou outro)
- [ ] A subconsulta retorna os pares `(preco, categoria_id)` dos produtos com `categoria_id = 4`
- [ ] Os resultados estão ordenados por `nome`

---

### Exercício 7 — Produto mais barato por categoria (correlacionada)

Para cada categoria, retorne o `nome` da categoria, o `nome` do produto mais barato e o `preco` desse produto. Use uma subconsulta correlacionada no `WHERE` com `= (SELECT MIN(preco) FROM produtos WHERE categoria_id = ...)`.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `categoria`, `produto`, `preco`
- [ ] A query retorna exatamente 5 linhas (uma por categoria raiz)
- [ ] O produto mais barato da categoria `'Eletrônicos'` é `Carregador Rápido 65W` (R$ 89,90)
- [ ] Os resultados estão ordenados pelo `nome` da categoria

---

### Exercício 8 — Clientes que NÃO têm pedido entregue (comparando NOT IN e NOT EXISTS)

Liste o `nome` dos clientes que **não** possuem nenhum pedido com status `'entregue'`. Escreva **duas versões** da query: uma usando `NOT IN` e outra usando `NOT EXISTS`. (Entregue ambas.)

**Critérios de conclusão:**
- [ ] Ambas as queries retornam exatamente 5 linhas
- [ ] A coluna retornada é: `nome`
- [ ] Os clientes retornados são: Felipe Nunes, Gabriela Costa, Henrique Alves, Isabela Martins, Jonas Pereira
- [ ] Os resultados estão ordenados alfabeticamente por `nome`

---

### Exercício 9 — Receita total por cliente (tabela derivada no FROM)

Crie uma tabela derivada que calcule a soma dos `valor_total` dos pedidos agrupada por `cliente_id`. Depois, junte com a tabela `clientes` para exibir o `nome` do cliente e sua `receita_total` (alias `receita`). Ordene pela receita decrescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `receita`
- [ ] A query retorna exatamente 10 linhas (um por cliente)
- [ ] O cliente com maior receita é `Elisa Rocha` (R$ 4979,60)
- [ ] A tabela derivada está no `FROM` e possui alias

---

### Exercício 10 — Classificação de venda com CASE e EXISTS

Para cada produto, exiba `nome`, `preco` e uma coluna `status_venda` calculada com `CASE`:
- `'Já vendido'` se o produto aparecer em `itens_pedido`
- `'Nunca vendido'` caso contrário

Use `EXISTS` dentro do `CASE`. Ordene por `nome`.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `preco`, `status_venda`
- [ ] A query retorna exatamente 20 linhas
- [ ] Produtos como `Smartphone Pro X` devem aparecer como `'Já vendido'`
- [ ] Produtos como `Teclado Mecânico RGB` devem aparecer como `'Nunca vendido'`
- [ ] Os resultados estão ordenados alfabeticamente por `nome`

---

## Nível 3: Desafio (Difícil)

Os exercícios abaixo simulam cenários de negócio reais. Cada um exige o uso de múltiplos conceitos combinados. Planeje a query antes de escrevê-la.

### Exercício 11 — Produtos com saída de estoque associada a pedido confirmado ou enviado

O setor de logística quer saber quais produtos tiveram **saída de estoque** (`movimentacoes_estoque.tipo = 'saida'`) vinculada a um pedido cujo status é `'confirmado'` ou `'enviado'`. Retorne o `nome` do produto e a **quantidade total** de saídas para esses pedidos (soma das quantidades). Use uma subconsulta correlacionada com `EXISTS` para filtrar os produtos, mas a soma deve ser feita com `JOIN` ou outra subconsulta.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `produto`, `total_saidas`
- [ ] A query retorna exatamente 11 linhas
- [ ] O produto `Console Next Gen` deve ter `total_saidas = 2` (pedidos 5 e 7)
- [ ] Produtos que tiveram saída apenas por ajuste (pedido_id NULL) ou por pedido cancelado não entram na contagem
- [ ] Os resultados estão ordenados por `total_saidas` decrescente

---

### Exercício 12 — Meses com faturamento acima da média mensal

Calcule, para cada mês (extraído de `pedidos.criado_em`), o faturamento total (soma de `valor_total`) **excluindo pedidos cancelados**. Depois, compare esse valor com a **média mensal** (média dos faturamentos mensais, também excluindo cancelados). Retorne o número do mês (`mes`), o faturamento do mês (`faturamento_mensal`) e a diferença entre o faturamento e a média mensal (`diferenca_da_media`). Inclua apenas os meses cujo faturamento seja **superior à média mensal**. Use uma tabela derivada no `FROM` para as médias mensais.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `mes`, `faturamento_mensal`, `diferenca_da_media`
- [ ] A query retorna exatamente 3 linhas (meses 2, 3 e 4)
- [ ] O mês 2 (fevereiro) tem faturamento R$ 7269,60, média mensal ≈ R$ 3654,73 (valor aproximado)
- [ ] Os resultados estão ordenados por `faturamento_mensal` decrescente

---

### Exercício 13 — Clientes que compraram o mesmo produto mais de uma vez (em pedidos diferentes)

Identifique os clientes que adquiriram o **mesmo produto** em **dois ou mais pedidos distintos**. Retorne o nome do cliente, o nome do produto e a quantidade de compras (número de pedidos diferentes em que o produto aparece). Utilize uma subconsulta no `FROM` que agrupa por `cliente_id`, `produto_id` e conta os `pedido_id` distintos. Depois filtre apenas os com contagem > 1.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `cliente`, `produto`, `vezes_comprado`
- [ ] Com os dados de seed, pode não haver nenhum par repetido. A query deve retornar **vazio** (0 linhas) – o que é aceitável, desde que a lógica esteja correta.
- [ ] A subconsulta no `FROM` deve usar `GROUP BY cliente_id, produto_id` e `COUNT(DISTINCT pedido_id)`
- [ ] A consulta principal filtra `vezes_comprado >= 2`
