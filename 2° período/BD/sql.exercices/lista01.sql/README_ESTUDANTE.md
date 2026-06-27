# Sua lista de exercícios – Banco de Dados

Este é o seu repositório **individual** para esta lista. Aqui você vai encontrar os exercícios e deverá escrever suas soluções.

## 🚀 Passo a passo para resolver e entregar

### 1. Clone o repositório (faça uma única vez por lista)

```bash
git clone https://github.com/tads-hs-bd/SEU_USUARIO-bd-lista-NN.git
cd SEU_USUARIO-bd-lista-NN
```

### 2. Leia o enunciado

O arquivo `enunciado-lista-NN.md` contém todos os exercícios. Cada exercício tem um arquivo de resposta correspondente: `resp-lstMM-exNN.sql`.

### 3. Resolva os exercícios

Abra cada arquivo `.sql` em um editor de código (VS Code, Sublime, etc.) e escreva o comando SQL solicitado. Você deve testar as consultas em um banco de dados real fornecidos nesse repositório.

**Scripts do banco de dados:**
- `sql/loja_schema.sql` – cria as tabelas.
- `sql/loja_seed.sql` – insere dados de exemplo.

Execute‑os no seu PostgreSQL para testar suas consultas.

### 4. Salve (commit) suas soluções

```bash
git add .
git commit -m "feat: resolve exercícios da lista NN"
```

> Use mensagens de commit descritivas – veja o guia de boas práticas em padroes_commit.md.

### 5. Envie para o GitHub (push)

```bash
git push origin main
```

> ⚠️ **Importante:** O professor só verá o que estiver no GitHub. Não se esqueça do `push`!

## 🔁 Se você precisar atualizar o repositório (raramente necessário)

Caso o professor informe que houve correção no enunciado, execute:

```bash
git pull origin main
```

Isso trará as alterações sem perder seu trabalho.

## 🆘 Problemas comuns

| Problema | Solução |
|----------|---------|
| `fatal: not a git repository` | Você não está dentro da pasta do repositório. Use `cd nome-da-pasta` primeiro. |
| `Permission denied` ou erro de autenticação | Gere um token de acesso pessoal no GitHub (Settings → Developer settings → Personal access tokens) e use‑o como senha. |
| `! [rejected] main -> main (fetch first)` | Execute `git pull origin main` e depois `git push` novamente. |
| `Please tell me who you are` | Configure seu nome e e‑mail: `git config --global user.name "Seu Nome"` e `git config --global user.email "seu@email.com"`. |

## 📌 Dicas finais

- Faça commits pequenos e frequentes.
- Verifique no GitHub se os arquivos apareceram após o `push`.
- Em caso de dúvida, peça ajuda ao professor ou monitor.

Bons estudos! 🎓
