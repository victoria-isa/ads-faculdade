# Lista de Exercícios: Capítulo 3.2 — Refinando Consultas: Agrupamento e Funções de Agregação

## Pré-requisitos

- Execute o script `production_artifacts/setup/setup_cap03.sql` para preparar o banco de dados `loja`.

---

## Nível 1: Fixação (Fácil)

Os exercícios a seguir focam em um conceito por vez. Se travou, releia a seção
correspondente do capítulo antes de tentar novamente.

### Exercício 1 — Contando clientes com e sem telefone

Usando uma única query sem `WHERE`, retorne o total de clientes
(`total_clientes`) e quantos possuem telefone cadastrado (`clientes_com_telefone`).

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `total_clientes`, `clientes_com_telefone`
- [ ] A query retorna exatamente 1 linha
- [ ] `total_clientes` é 10
- [ ] `clientes_com_telefone` é 9

---

### Exercício 2 — Resumo geral dos pedidos

Em uma única query, calcule: o total de pedidos (`total_pedidos`), a soma de todos
os valores (`receita_total`), o ticket médio arredondado a 2 casas (`ticket_medio`),
o menor valor (`menor_pedido`) e o maior valor (`maior_pedido`) entre todos os pedidos.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `total_pedidos`, `receita_total`, `ticket_medio`, `menor_pedido`, `maior_pedido`
- [ ] A query retorna exatamente 1 linha
- [ ] `total_pedidos` é 15

---

### Exercício 3 — Pedidos agrupados por status

Para cada `status` de pedido, retorne o `status`, o total de pedidos
(`total_pedidos`), a receita total (`receita_total`) e o ticket médio arredondado
a 2 casas (`ticket_medio`). Ordene pelo `total_pedidos` decrescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `status`, `total_pedidos`, `receita_total`, `ticket_medio`
- [ ] A query retorna exatamente 5 linhas (um por status)
- [ ] O status `'entregue'` aparece primeiro
- [ ] Os resultados estão ordenados por `total_pedidos` decrescente

---

### Exercício 4 — Produtos agrupados por categoria

Para cada `categoria_id`, retorne o `categoria_id`, o total de produtos
(`total_produtos`), o preço médio arredondado a 2 casas (`preco_medio`), o menor
preço (`preco_minimo`) e o maior preço (`preco_maximo`). Ordene pelo `categoria_id`
crescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `categoria_id`, `total_produtos`, `preco_medio`, `preco_minimo`, `preco_maximo`
- [ ] A query retorna exatamente 5 linhas
- [ ] Cada categoria tem exatamente 4 produtos
- [ ] Os resultados estão ordenados por `categoria_id` crescente

---

### Exercício 5 — Pedidos agrupados por mês

Agrupe os pedidos pelo mês de criação (`criado_em`). Para cada mês, retorne o
número do mês (alias `mes`), o total de pedidos (`total_pedidos`) e a receita
total (`receita_total`). Ordene pelo `mes` crescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `mes`, `total_pedidos`, `receita_total`
- [ ] A query retorna exatamente 5 linhas
- [ ] Os resultados estão ordenados por `mes` crescente

---

## Nível 2: Prática (Intermediário)

Cada exercício combina dois ou mais conceitos do capítulo. Leia o enunciado com
atenção antes de montar a query.

### Exercício 6 — Receita por status (excluindo cancelados)

Agrupe os pedidos por `status`, excluindo os cancelados. Para cada grupo, retorne:
`status`, o total de pedidos (`total_pedidos`), a receita total (`receita_total`)
e o ticket médio arredondado a 2 casas (`ticket_medio`). Ordene pela `receita_total`
decrescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `status`, `total_pedidos`, `receita_total`, `ticket_medio`
- [ ] A query retorna exatamente 4 linhas
- [ ] Nenhum pedido com `status = 'cancelado'` entra no agrupamento
- [ ] Os resultados estão ordenados por `receita_total` decrescente

---

### Exercício 7 — Categorias com preço médio elevado

Liste apenas as categorias cujo preço médio de produtos seja superior a R$ 500,00.
Retorne o `categoria_id`, o total de produtos (`total_produtos`), o preço médio
arredondado a 2 casas (`preco_medio`) e o maior preço da categoria (`preco_maximo`).
Ordene pelo `preco_medio` decrescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `categoria_id`, `total_produtos`, `preco_medio`, `preco_maximo`
- [ ] A query retorna exatamente 3 linhas
- [ ] Apenas categorias com `AVG(preco) > 500.00` aparecem
- [ ] Os resultados estão ordenados por `preco_medio` decrescente

---

### Exercício 8 — Meses de alta demanda

Retorne o número do mês (`mes`), o total de pedidos (`total_pedidos`) e a receita
total (`receita_total`) dos meses que concentraram 3 ou mais pedidos. Ordene pelo
`mes` crescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `mes`, `total_pedidos`, `receita_total`
- [ ] A query retorna exatamente 3 linhas
- [ ] Apenas meses com `COUNT(*) >= 3` aparecem
- [ ] Os resultados estão ordenados por `mes` crescente

---

## Nível 3: Desafio (Difícil)

Os exercícios abaixo simulam cenários de negócio reais. Cada um exige o uso de
múltiplos conceitos combinados. Planeje a query antes de escrevê-la.

### Exercício 9 — Meses de maior faturamento (excluindo cancelados)

O time financeiro quer identificar os meses de maior faturamento. Considerando
apenas pedidos não cancelados, retorne os meses em que a receita total superou
R$ 2.000,00. Para cada mês, mostre o `mes`, o `total_pedidos`, a `receita_total`
e o `ticket_medio` (arredondado a 2 casas). Ordene pela `receita_total` decrescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `mes`, `total_pedidos`, `receita_total`, `ticket_medio`
- [ ] A query retorna exatamente 4 linhas
- [ ] Pedidos com `status = 'cancelado'` não entram no cálculo
- [ ] Apenas meses com `SUM(valor_total) > 2000.00` aparecem
- [ ] Os resultados estão ordenados por `receita_total` decrescente

---

### Exercício 10 — Meses de maior aquisição de clientes

O CRM quer entender em quais meses do ano mais clientes se cadastraram. Retorne
o número do mês (`mes`), o total de clientes cadastrados naquele mês
(`total_clientes`) e quantos desses clientes possuem telefone registrado
(`clientes_com_telefone`). Inclua apenas os meses com 2 ou mais cadastros.
Ordene pelo `mes` crescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `mes`, `total_clientes`, `clientes_com_telefone`
- [ ] A query retorna exatamente 4 linhas
- [ ] Apenas meses com `COUNT(*) >= 2` aparecem
- [ ] Os resultados estão ordenados por `mes` crescente

---

### Exercício 11 — Pedidos com múltiplos itens

O setor de logística quer saber quais pedidos contêm mais de um item distinto.
Na tabela `itens_pedido`, agrupe por `pedido_id` e retorne: `pedido_id`,
o número de linhas de item (`total_itens`), a soma das quantidades de todas as
unidades (`total_unidades`) e o preço médio unitário arredondado a 2 casas
(`preco_medio_item`). Inclua apenas os pedidos com 2 ou mais itens. Ordene pelo
`preco_medio_item` decrescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `pedido_id`, `total_itens`, `total_unidades`, `preco_medio_item`
- [ ] A query retorna exatamente 7 linhas
- [ ] Todos os pedidos retornados têm `COUNT(*) >= 2`
- [ ] Os resultados estão ordenados por `preco_medio_item` decrescente
