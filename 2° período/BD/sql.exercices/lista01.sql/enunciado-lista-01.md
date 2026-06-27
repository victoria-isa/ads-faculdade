# Lista de Exercícios: Capítulo 2 — Primeiros Passos com SQL: Consultando Dados

## Pré-requisitos

- Execute os scripts `./sql/loja_schema.sql` e `./sql/loja_seed.sql` para preparar o banco de dados `loja`.

---

## Nível 1: Fixação (Fácil)

Os exercícios a seguir focam em um conceito por vez. Se travou, releia a seção
correspondente do capítulo antes de tentar novamente.

### Exercício 1 — Listando todos os clientes

Escreva uma consulta que retorne o `nome` e o `email` de todos os clientes
cadastrados na tabela `clientes`, ordenados alfabeticamente pelo nome.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `email`
- [ ] A query retorna exatamente 10 linhas
- [ ] Os resultados estão em ordem alfabética crescente por `nome`

---

### Exercício 2 — Produtos acima de R$ 1.000

Retorne o `nome` e o `preco` de todos os produtos com preço superior a R$ 1.000,
ordenados pelo preço do mais caro para o mais barato.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `preco`
- [ ] A query retorna exatamente 6 linhas
- [ ] Os resultados estão ordenados por `preco` em ordem decrescente

---

### Exercício 3 — Pedidos em andamento

Liste o `id`, o `status` e o `valor_total` de todos os pedidos cujo status seja
`'enviado'` ou `'confirmado'`, usando `IN`. Ordene pelo `id` crescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `id`, `status`, `valor_total`
- [ ] A query retorna exatamente 4 linhas
- [ ] Os resultados estão ordenados por `id` crescente

---

### Exercício 4 — Produtos que começam com "C"

Retorne o `nome` e o `preco` de todos os produtos cujo nome começa com a letra
maiúscula `'C'`, ordenados pelo nome alfabeticamente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `preco`
- [ ] A query retorna exatamente 5 linhas
- [ ] Todos os nomes retornados começam com a letra `'C'`
- [ ] Os resultados estão em ordem alfabética por `nome`

---

### Exercício 5 — Cliente sem telefone cadastrado

Escreva uma consulta que retorne o `nome` e o `email` do cliente que não possui
telefone cadastrado na tabela `clientes`.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `email`
- [ ] A query retorna exatamente 1 linha
- [ ] O cliente retornado realmente não possui valor em `telefone`

---

## Nível 2: Prática (Intermediário)

Cada exercício combina dois ou mais conceitos do capítulo. Leia o enunciado com
atenção antes de montar a query.

### Exercício 6 — Produtos na faixa intermediária de preço

Retorne o `nome`, o `preco` e o `categoria_id` de todos os produtos com preço
entre R$ 200,00 e R$ 600,00 (inclusive nos dois extremos), usando `BETWEEN`.
Ordene pelo preço crescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `preco`, `categoria_id`
- [ ] A query retorna exatamente 7 linhas
- [ ] Os resultados estão ordenados por `preco` crescente

---

### Exercício 7 — Pedidos ativos de clientes selecionados

Liste o `id`, o `cliente_id`, o `status` e o `valor_total` dos pedidos que
pertencem aos clientes de `id` 1, 2 ou 3 **e** que não estejam com status
`'cancelado'` nem `'pendente'`. Ordene pelo `valor_total` decrescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `id`, `cliente_id`, `status`, `valor_total`
- [ ] A query retorna exatamente 5 linhas
- [ ] Nenhum pedido com status `'cancelado'` ou `'pendente'` aparece
- [ ] Os resultados estão ordenados por `valor_total` decrescente

---

### Exercício 8 — Produtos distintos já vendidos

Usando `DISTINCT`, descubra quantos produtos diferentes já foram incluídos em
algum pedido. Retorne os valores únicos de `produto_id` da tabela `itens_pedido`,
ordenados pelo `produto_id` crescente.

**Critérios de conclusão:**
- [ ] A coluna retornada é: `produto_id`
- [ ] A query retorna exatamente 15 linhas
- [ ] Cada `produto_id` aparece exatamente uma vez
- [ ] Os resultados estão ordenados por `produto_id` crescente

---

### Exercício 9 — Paginando o catálogo de produtos

Simule a terceira página de um catálogo que exibe 5 produtos por página. Retorne
o `id`, o `nome` e o `preco` dos produtos da terceira página, na ordem natural
de inserção (por `id` crescente).

> Dica: a terceira página começa no produto de posição 11 (índice 10 com `OFFSET`).

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `id`, `nome`, `preco`
- [ ] A query retorna exatamente 5 linhas
- [ ] Os produtos retornados correspondem aos `id` de 11 a 15
- [ ] Os resultados estão ordenados por `id` crescente

---

## Nível 3: Desafio (Difícil)

Os exercícios abaixo simulam cenários de negócio reais. Cada um exige o uso de
múltiplos conceitos combinados. Planeje a query antes de escrevê-la.

### Exercício 10 — Catálogo premium das categorias principais

O setor de marketing quer um relatório dos produtos de maior valor das categorias
de Eletrônicos (`id` 1), Informática (`id` 2) e Áudio e Vídeo (`id` 3) que
custem pelo menos R$ 400,00. Retorne o `nome`, o `preco` e o `categoria_id`,
ordenados primeiro pelo `categoria_id` crescente e, dentro de cada categoria,
pelo `preco` decrescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `preco`, `categoria_id`
- [ ] A query retorna exatamente 6 linhas
- [ ] Todos os produtos têm `preco >= 400.00`
- [ ] Os resultados estão ordenados por `categoria_id` ASC e `preco` DESC

---

### Exercício 11 — Produtos de destaque no catálogo

Retorne o `nome` e o `preco` de todos os produtos que satisfaçam **pelo menos
uma** das condições abaixo:

- o nome contém a palavra `'Pro'` (ignorando diferença entre maiúsculas e
  minúsculas), **ou**
- o preço é superior a R$ 3.000,00.

Ordene os resultados pelo `preco` decrescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `preco`
- [ ] A query retorna exatamente 4 linhas
- [ ] Todos os produtos satisfazem ao menos uma das duas condições
- [ ] Os resultados estão ordenados por `preco` decrescente

---

### Exercício 12 — Novos clientes com contato disponível

O time de vendas quer contatar os clientes cadastrados entre abril e junho de
2024 (inclusive) que possuam telefone registrado, para uma ação de fidelização.
Retorne o `nome`, o `telefone` e o `criado_em`, ordenados pela data de cadastro
do mais recente para o mais antigo. Use `NULLS LAST` na ordenação para deixar
explícita a intenção de excluir nulos.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `telefone`, `criado_em`
- [ ] A query retorna exatamente 4 linhas
- [ ] Todos os clientes têm `criado_em` entre `'2024-04-01'` e `'2024-06-30'` (inclusive)
- [ ] Nenhum cliente sem telefone aparece no resultado
- [ ] Os resultados estão ordenados por `criado_em` decrescente