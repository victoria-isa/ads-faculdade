# 📝 Guia de Mensagens de Commit

## Por que padronizar mensagens de commit?

- Facilita a leitura do histórico do projeto.
- Permite gerar changelogs automaticamente.
- Ajuda na revisão e entendimento das alterações.
- É uma prática profissional esperada em equipes de desenvolvimento.

## Estrutura básica

```
<tipo>(<escopo opcional>): <descrição resumida>

<corpo opcional>

<rodapé opcional>
```

- **Tipo**: indica a natureza da mudança (obrigatório).
- **Escopo**: indica a parte do projeto afetada (opcional, mas recomendado).
- **Descrição**: frase curta no imperativo, até 50 caracteres.

## Tipos de commit mais comuns

| Tipo | Quando usar | Exemplo (contexto BD) |
|------|-------------|------------------------|
| `feat` | Adicionar nova funcionalidade, novo exercício resolvido, novo script. | `feat(lista-01): adiciona solução do exercício 3` |
| `fix` | Corrigir um erro (bug) em código, enunciado ou solução. | `fix(sql): corrige condição WHERE na consulta de clientes` |
| `docs` | Alterações apenas na documentação (README, comentários, etc.). | `docs(lista-02): corrige link da tabela no enunciado` |
| `style` | Formatação, espaços, ponto-e-vírgula – sem mudança lógica. | `style: ajusta indentação dos arquivos .sql` |
| `refactor` | Mudança no código que não corrige bug nem adiciona feature. | `refactor(lista-03): simplifica JOIN utilizando subconsulta` |
| `test` | Adicionar ou corrigir testes. | `test: adiciona verificação para dados inconsistentes` |
| `chore` | Tarefas de manutenção (configuração, dependências, scripts). | `chore: atualiza script de seed com novos produtos` |
| `perf` | Melhoria de performance. | `perf: adiciona índice na coluna email da tabela clientes` |

> **Dica**: Use `feat` para entregas de exercícios e `fix` para correções de respostas anteriores.

## Escopo (opcional, mas recomendado)

Indica a parte do projeto afetada. Exemplos para sua disciplina:

- `lista-01`, `lista-02`, etc.
- `sql`
- `docs`
- `seed`

Exemplo: `feat(lista-03): resolve exercício 5 (subconsulta correlacionada)`

## Regras para uma boa descrição

- Use **imperativo** (como se desse uma ordem): "adiciona", "corrige", "remove", "refatora".
- Não use ponto final.
- Limite a 50 caracteres.

### ❌ Exemplos ruins
```
"trabalho pronto"
"mudei algumas coisas"
"lista 2"
"Corrigindo erro" (não está no imperativo, letra maiúscula inicial)
```

### ✅ Exemplos bons
```
feat(lista-01): adiciona solução do exercício 2
fix(sql): ajusta alias da coluna para evitar ambiguidade
docs: complementa enunciado da lista 04 com exemplo de GROUP BY
refactor(lista-02): substitui subconsulta por JOIN
```

## Mensagens com corpo (quando necessário)

Use o corpo para explicar **o que** mudou e **por que**, especialmente em commits mais complexos.

```
feat(lista-05): resolve exercício 3 (índices em colunas de busca)

Adiciona índice B-tree na coluna email da tabela clientes.
A consulta de login agora é executada em média 80% mais rápido.

Testado com 10 mil registros.
```

## Mensagens com rodapé (para referências)

Pode referenciar issues, tarefas ou pull requests.

```
fix(seed): remove duplicatas na tabela produtos

Os produtos "Monitor" e "Teclado" estavam inseridos duas vezes.
Corrige o script de seed.

Refs: #23 (issue no repositório template)
```

## Exemplos específicos para suas listas de SQL

| Situação | Commit sugerido |
|----------|----------------|
| Primeira entrega da lista 01, exercícios 1 a 4 | `feat(lista-01): adiciona soluções dos exercícios 1 a 4` |
| Corrigir uma consulta que estava trazendo resultados errados | `fix(lista-02): corrige condição de junção no exercício 3` |
| Adicionar comentários explicativos no código SQL | `docs(lista-03): adiciona comentários na solução do exercício 2` |
| Reorganizar a ordem das soluções sem alterar lógica | `style(lista-04): reordena arquivos de resposta por ordem numérica` |
| Remover uma solução antiga que estava incorreta | `refactor(lista-01): remove abordagem incorreta do exercício 5` |
| Adicionar script de criação de índices para otimizar consultas | `perf(sql): cria índice idx_cliente_email para acelerar buscas` |

## Ferramentas que ajudam a seguir o padrão

- **Commitizen**: assistente interativo para criar mensagens padronizadas.
- **commitlint**: valida mensagens de commit automaticamente.
- Extensões para VS Code (ex: "Conventional Commits").

## Checklist antes de commitar

- [ ] O tipo está correto (feat, fix, docs, etc.)?
- [ ] O escopo (se usado) está entre parênteses e sem espaços?
- [ ] A descrição está no imperativo e até 50 caracteres?
- [ ] Não há ponto final na descrição?
- [ ] O corpo (se existir) explica o "porquê" da mudança?

## Referências

- [Conventional Commits - especificação oficial](https://www.conventionalcommits.org/)
- [Guia do GitHub sobre mensagens de commit](https://github.com/git-guides/commit-message)

---

**Adote esse padrão desde agora.** Seu eu do futuro (e seus professores) agradecerão! 🚀