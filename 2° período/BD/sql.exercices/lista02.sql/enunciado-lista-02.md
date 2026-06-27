# Lista de Exercícios: Capítulo 3.1 — Refinando Consultas: Ordenação e Funções de Linha

## Pré-requisitos

- Execute o script `production_artifacts/setup/setup_cap03.sql` para preparar o banco de dados `loja`.

---

## Nível 1: Fixação (Fácil)

Os exercícios a seguir focam em um conceito por vez. Se travou, releia a seção
correspondente do capítulo antes de tentar novamente.

### Exercício 1 — Catálogo com preço promocional

Retorne o `nome`, o `preco` e o preço com 15% de desconto (arredondado a 2 casas
decimais, alias `preco_com_desconto`) de todos os produtos. Ordene pelo
`preco_com_desconto` de forma decrescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `preco`, `preco_com_desconto`
- [ ] A query retorna exatamente 20 linhas
- [ ] Os resultados estão ordenados por `preco_com_desconto` em ordem decrescente
- [ ] `preco_com_desconto` está arredondado a 2 casas decimais

---

### Exercício 2 — Arredondamento versus truncamento de preços

Retorne o `nome`, o `preco`, o preço arredondado para zero casas decimais
(`preco_arredondado`) e o preço truncado para zero casas decimais
(`preco_truncado`) de todos os produtos com preço inferior a R$ 200,00.
Ordene pelo `preco` crescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `preco`, `preco_arredondado`, `preco_truncado`
- [ ] A query retorna exatamente 6 linhas
- [ ] Todos os produtos têm `preco < 200.00`
- [ ] Os resultados estão ordenados por `preco` crescente

---

### Exercício 3 — Comprimento e capitalização dos nomes dos clientes

Retorne o `nome`, o número de caracteres do nome (alias `tamanho_nome`) e o `email`
em maiúsculas (alias `email_maiusculo`) de todos os clientes. Ordene pelo
`tamanho_nome` de forma decrescente e, em caso de empate, pelo `nome` alfabeticamente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `tamanho_nome`, `email_maiusculo`
- [ ] A query retorna exatamente 10 linhas
- [ ] `email_maiusculo` exibe o email todo em letras maiúsculas
- [ ] Os resultados estão ordenados por `tamanho_nome` decrescente e `nome` crescente em empate

---

### Exercício 4 — Clientes cadastrados no primeiro trimestre

Retorne o `nome`, o `criado_em`, o mês extraído (alias `mes`) e o dia extraído
(alias `dia`) de todos os clientes cujo cadastro ocorreu entre janeiro e março
(meses 1 a 3). Ordene por `criado_em` crescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `criado_em`, `mes`, `dia`
- [ ] A query retorna exatamente 5 linhas
- [ ] Todos os clientes retornados têm `mes` entre 1 e 3
- [ ] Os resultados estão ordenados por `criado_em` crescente

---

### Exercício 5 — Classificação de produtos por faixa de preço

Retorne o `nome`, o `preco` e uma coluna `faixa_preco` calculada com `CASE`:
- preço abaixo de R$ 200,00 → `'Básico'`
- preço entre R$ 200,00 e R$ 999,99 → `'Intermediário'`
- preço igual ou acima de R$ 1.000,00 → `'Premium'`

Ordene pelo `preco` crescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `preco`, `faixa_preco`
- [ ] A query retorna exatamente 20 linhas
- [ ] Os 6 produtos mais baratos são classificados como `'Básico'`
- [ ] Os resultados estão ordenados por `preco` crescente

---

## Nível 2: Prática (Intermediário)

Cada exercício combina dois ou mais conceitos do capítulo. Leia o enunciado com
atenção antes de montar a query.

### Exercício 6 — Contato completo formatado

Retorne o `nome`, o número de caracteres do nome (alias `tamanho_nome`) e uma
string no formato `'nome <email>'` (alias `contato_formatado`) de todos os
clientes, usando o operador de concatenação `||`. Ordene pelo `tamanho_nome`
decrescente e, em empate, pelo `nome` alfabeticamente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `tamanho_nome`, `contato_formatado`
- [ ] A query retorna exatamente 10 linhas
- [ ] `contato_formatado` segue o padrão `'Fulano <fulano@email.com>'`
- [ ] Os resultados estão ordenados por `tamanho_nome` decrescente e `nome` crescente em empate

---

### Exercício 7 — Situação do estoque com prioridade de exibição

Para cada produto no estoque, retorne o `produto_id`, a `quantidade` e uma coluna
`situacao` usando `CASE`:
- `quantidade = 0` → `'Esgotado'`
- `quantidade BETWEEN 1 AND 15` → `'Estoque baixo'`
- `quantidade BETWEEN 16 AND 50` → `'Estoque normal'`
- acima de 50 → `'Estoque alto'`

Ordene exibindo primeiro os esgotados, depois estoque baixo, normal e alto. Dentro
de cada situação, ordene por `quantidade` crescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `produto_id`, `quantidade`, `situacao`
- [ ] A query retorna exatamente 20 linhas
- [ ] O produto de `produto_id = 20` aparece primeiro com `situacao = 'Esgotado'`
- [ ] A ordenação respeita a prioridade: Esgotado → Estoque baixo → Estoque normal → Estoque alto

---

### Exercício 8 — Exportação formatada dos produtos mais baratos

Gere uma listagem formatada dos produtos com preço inferior a R$ 200,00. Retorne
o `id` com zeros à esquerda até 5 dígitos (alias `codigo_produto`), o `nome` e o
preço no formato `'R$ 99.90'` (alias `preco_formatado`), usando `LPAD` e `TO_CHAR`.
Ordene pelo preço crescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `codigo_produto`, `nome`, `preco_formatado`
- [ ] A query retorna exatamente 6 linhas
- [ ] Todos os produtos têm `preco < 200.00`
- [ ] `codigo_produto` tem exatamente 5 caracteres, preenchido com `'0'` à esquerda
- [ ] Os resultados estão ordenados pelo preço crescente

---

### Exercício 9 — Pedidos entregues com data e valor formatados

Retorne o `id`, a data do pedido no formato `'DD/MM/YYYY'` (alias `data_pedido`),
o `valor_total` e o valor no formato `'R$ 9999.90'` (alias `valor_formatado`)
de todos os pedidos com status `'entregue'`. Ordene pelo `valor_total` decrescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `id`, `data_pedido`, `valor_total`, `valor_formatado`
- [ ] A query retorna exatamente 5 linhas
- [ ] Todos os pedidos retornados têm `status = 'entregue'`
- [ ] `data_pedido` está no formato `'DD/MM/YYYY'`
- [ ] Os resultados estão ordenados por `valor_total` decrescente

---

## Nível 3: Desafio (Difícil)

Os exercícios abaixo simulam cenários de negócio reais. Cada um exige o uso de
múltiplos conceitos combinados. Planeje a query antes de escrevê-la.

### Exercício 10 — Produtos mais próximos de uma faixa de preço alvo

O time de vendas quer recomendar produtos "perto de R$ 400,00". Retorne o `nome`,
o `preco` e a distância absoluta em relação a R$ 400,00 (alias `distancia_de_400`)
dos 5 produtos com preço mais próximo desse valor. Em caso de empate na distância,
ordene pelo `preco` crescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `nome`, `preco`, `distancia_de_400`
- [ ] A query retorna exatamente 5 linhas
- [ ] O produto com menor `distancia_de_400` aparece primeiro
- [ ] Em empate de distância, o produto com menor `preco` aparece antes

---

### Exercício 11 — Catálogo com faixa de preço, código e ordenação por categoria

Gere um catálogo completo com: código do produto com zeros à esquerda até 5 dígitos
(alias `codigo_produto`), `nome`, `preco` e `faixa_preco` (mesmos critérios do
exercício 5). Ordene exibindo primeiro os produtos `'Premium'`, depois
`'Intermediário'` e por último `'Básico'`. Dentro de cada faixa, ordene pelo
`preco` decrescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `codigo_produto`, `nome`, `preco`, `faixa_preco`
- [ ] A query retorna exatamente 20 linhas
- [ ] Os 6 produtos `'Premium'` aparecem nas primeiras posições
- [ ] Dentro de cada faixa, os resultados estão ordenados por `preco` decrescente

---

### Exercício 12 — Painel de acompanhamento de pedidos de alto valor

O time de operações quer acompanhar pedidos com `valor_total >= R$ 1.000,00`.
Retorne o `id`, a data no formato `'DD/MM/YYYY'` (alias `data_pedido`),
o `valor_total` e o status traduzido (alias `descricao_status`) com `CASE`:
- `'entregue'` → `'Concluído'`
- `'confirmado'` → `'Pagamento confirmado'`
- `'enviado'` → `'Em transporte'`
- `'pendente'` → `'Aguardando pagamento'`
- `'cancelado'` → `'Cancelado'`

Ordene pelos pedidos concluídos primeiro, depois confirmados, em transporte,
aguardando e cancelados por último. Dentro de cada status, ordene pelo `valor_total`
decrescente.

**Critérios de conclusão:**
- [ ] As colunas retornadas são: `id`, `data_pedido`, `valor_total`, `descricao_status`
- [ ] A query retorna exatamente 8 linhas
- [ ] Apenas pedidos com `valor_total >= 1000.00` aparecem
- [ ] `data_pedido` está no formato `'DD/MM/YYYY'`
- [ ] Os resultados respeitam a prioridade: Concluído → Pagamento confirmado → Em transporte → Aguardando pagamento → Cancelado
- [ ] Dentro de cada status, os resultados estão ordenados por `valor_total` decrescente
