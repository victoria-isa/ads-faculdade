-- -----------------------------------------------------------------------------
-- Limpeza (permite executar o script múltiplas vezes sem erro)
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS movimentacoes_estoque;
DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS estoque;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS clientes;


-- -----------------------------------------------------------------------------
-- clientes
-- -----------------------------------------------------------------------------
CREATE TABLE clientes (
    id         SERIAL PRIMARY KEY,
    nome       VARCHAR(100) NOT NULL,
    email      VARCHAR(150) NOT NULL UNIQUE,
    telefone   VARCHAR(20),
    criado_em  TIMESTAMP NOT NULL DEFAULT NOW()
);


-- -----------------------------------------------------------------------------
-- categorias
-- Autorelacionamento: categoria_id referencia a própria tabela.
-- Categorias raiz têm categoria_id = NULL.
-- Subcategorias apontam para a categoria pai correspondente.
-- -----------------------------------------------------------------------------
CREATE TABLE categorias (
    id                SERIAL PRIMARY KEY,
    nome              VARCHAR(80)  NOT NULL UNIQUE,
    descricao         TEXT,
    categoria_id  INT REFERENCES categorias(id)
);


-- -----------------------------------------------------------------------------
-- produtos
-- -----------------------------------------------------------------------------
CREATE TABLE produtos (
    id           SERIAL PRIMARY KEY,
    categoria_id INT NOT NULL REFERENCES categorias(id),
    nome         VARCHAR(150) NOT NULL,
    descricao    TEXT,
    preco        NUMERIC(10, 2) NOT NULL CHECK (preco >= 0),
    criado_em    TIMESTAMP NOT NULL DEFAULT NOW()
);


-- -----------------------------------------------------------------------------
-- estoque
-- Mantém o saldo atual de cada produto (atualizado a cada movimentação).
-- O histórico completo fica em movimentacoes_estoque.
-- -----------------------------------------------------------------------------
CREATE TABLE estoque (
    id            SERIAL PRIMARY KEY,
    produto_id    INT NOT NULL UNIQUE REFERENCES produtos(id),
    quantidade    INT NOT NULL DEFAULT 0 CHECK (quantidade >= 0),
    atualizado_em TIMESTAMP NOT NULL DEFAULT NOW()
);


-- -----------------------------------------------------------------------------
-- pedidos
-- -----------------------------------------------------------------------------
CREATE TABLE pedidos (
    id          SERIAL PRIMARY KEY,
    cliente_id  INT NOT NULL REFERENCES clientes(id),
    valor_total NUMERIC(10, 2) NOT NULL DEFAULT 0 CHECK (valor_total >= 0),
    status      VARCHAR(20) NOT NULL DEFAULT 'pendente'
                    CHECK (status IN ('pendente', 'confirmado', 'enviado', 'entregue', 'cancelado')),
    criado_em   TIMESTAMP NOT NULL DEFAULT NOW()
);


-- -----------------------------------------------------------------------------
-- itens_pedido
-- preco_unitario registra o preço no momento da compra,
-- independente de alterações futuras em produtos.preco.
-- -----------------------------------------------------------------------------
CREATE TABLE itens_pedido (
    id             SERIAL PRIMARY KEY,
    pedido_id      INT NOT NULL REFERENCES pedidos(id),
    produto_id     INT NOT NULL REFERENCES produtos(id),
    quantidade     INT NOT NULL CHECK (quantidade > 0),
    preco_unitario NUMERIC(10, 2) NOT NULL CHECK (preco_unitario >= 0)
);


-- -----------------------------------------------------------------------------
-- movimentacoes_estoque
-- Registra cada entrada ou saída de estoque com sua origem e motivo.
--
-- tipo:
--   'entrada' — reposição, devolução, ajuste positivo
--   'saida'   — venda, perda, ajuste negativo
--
-- pedido_id é NULL para movimentações sem pedido associado
-- (ex.: reposição de fornecedor, ajuste de inventário).
-- Esse é um exemplo de FK opcional.
-- -----------------------------------------------------------------------------
CREATE TABLE movimentacoes_estoque (
    id         SERIAL PRIMARY KEY,
    produto_id INT NOT NULL REFERENCES produtos(id),
    pedido_id  INT REFERENCES pedidos(id),             -- nullable: nem toda movimentação tem pedido
    tipo       VARCHAR(10) NOT NULL
                   CHECK (tipo IN ('entrada', 'saida')),
    quantidade INT NOT NULL CHECK (quantidade > 0),
    motivo     TEXT,
    criado_em  TIMESTAMP NOT NULL DEFAULT NOW()
);
