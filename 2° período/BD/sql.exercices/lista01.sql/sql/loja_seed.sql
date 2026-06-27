-- -----------------------------------------------------------------------------
-- clientes
-- -----------------------------------------------------------------------------
INSERT INTO clientes (nome, email, telefone, criado_em) VALUES
    ('Ana Lima',        'ana.lima@email.com',       '(81) 99100-1001', '2024-01-15 09:00:00'),
    ('Bruno Souza',     'bruno.souza@email.com',    '(81) 99100-1002', '2024-02-03 10:30:00'),
    ('Carla Mendes',    'carla.mendes@email.com',   '(81) 99100-1003', '2024-02-20 14:00:00'),
    ('Diego Ferreira',  'diego.ferreira@email.com', '(81) 99100-1004', '2024-03-05 16:45:00'),
    ('Elisa Rocha',     'elisa.rocha@email.com',    '(81) 99100-1005', '2024-03-18 08:15:00'),
    ('Felipe Nunes',    'felipe.nunes@email.com',   '(81) 99100-1006', '2024-04-02 11:00:00'),
    ('Gabriela Costa',  'gabriela.costa@email.com', '(81) 99100-1007', '2024-04-25 13:30:00'),
    ('Henrique Alves',  'henrique.alves@email.com', NULL,              '2024-05-10 09:45:00'),
    ('Isabela Martins', 'isabela.martins@email.com','(81) 99100-1009', '2024-05-22 15:00:00'),
    ('Jonas Pereira',   'jonas.pereira@email.com',  '(81) 99100-1010', '2024-06-01 10:00:00');


-- -----------------------------------------------------------------------------
-- categorias
--
-- Hierarquia:
--   id 1 — Eletrônicos      (raiz)
--   id 2 — Informática      (raiz)
--   id 3 — Áudio e Vídeo    (raiz)
--   id 4 — Games            (raiz)
--   id 5 — Escritório       (raiz)
--   id 6 — Smartphones      (filho de Eletrônicos)
--   id 7 — Periféricos      (filho de Informática)
--   id 8 — Consoles e Jogos (filho de Games)
--
-- As categorias raiz têm categoria_id = NULL.
-- As subcategorias referenciam o id da categoria pai —
-- exemplo de autorelacionamento (FK na própria tabela).
-- Os produtos do seed estão nas categorias raiz (ids 1–5);
-- as subcategorias estão disponíveis para exercícios de INSERT e JOIN.
-- -----------------------------------------------------------------------------
INSERT INTO categorias (nome, descricao, categoria_id) VALUES
    ('Eletrônicos',      'Smartphones, tablets, acessórios e dispositivos eletrônicos em geral', NULL),
    ('Informática',      'Notebooks, periféricos, componentes e acessórios para computador',     NULL),
    ('Áudio e Vídeo',    'Fones de ouvido, caixas de som, câmeras e acessórios multimídia',      NULL),
    ('Games',            'Consoles, jogos, controles e acessórios para jogadores',               NULL),
    ('Escritório',       'Impressoras, suprimentos e equipamentos para escritório',              NULL),
    ('Smartphones',      'Aparelhos celulares e seus acessórios',                                1),
    ('Periféricos',      'Mouse, teclado, monitor e demais periféricos para computador',         2),
    ('Consoles e Jogos', 'Videogames, jogos físicos e digitais',                                 4);


-- -----------------------------------------------------------------------------
-- produtos
-- -----------------------------------------------------------------------------
INSERT INTO produtos (categoria_id, nome, descricao, preco, criado_em) VALUES
    -- Eletrônicos
    (1, 'Smartphone Pro X',       'Tela 6.5", 128GB, câmera tripla 50MP',          2499.90, '2024-01-10 08:00:00'),
    (1, 'Tablet Ultra 10',        'Tela 10.5", 64GB, bateria 8000mAh',              1299.90, '2024-01-10 08:00:00'),
    (1, 'Smartwatch Fit',         'Monitor cardíaco, GPS, resistente à água',        599.90, '2024-02-01 08:00:00'),
    (1, 'Carregador Rápido 65W',  'Compatível com USB-C, cabo incluso',               89.90, '2024-02-01 08:00:00'),
    -- Informática
    (2, 'Notebook Ultra 15',      'Intel Core i7, 16GB RAM, SSD 512GB',             4599.90, '2024-01-12 08:00:00'),
    (2, 'Mouse Sem Fio Slim',     'Receptor USB, 1600 DPI, bateria AA',               79.90, '2024-01-12 08:00:00'),
    (2, 'Teclado Mecânico RGB',   'Switch Blue, ABNT2, iluminação por tecla',        349.90, '2024-03-01 08:00:00'),
    (2, 'Monitor 27" Full HD',    '75Hz, IPS, 1ms, bordas ultrafinas',              1199.90, '2024-03-01 08:00:00'),
    -- Áudio e Vídeo
    (3, 'Fone Bluetooth NC',      'Cancelamento de ruído ativo, 30h de bateria',     449.90, '2024-01-20 08:00:00'),
    (3, 'Caixa de Som Portátil',  'À prova d''água, 360°, 20W RMS',                 299.90, '2024-01-20 08:00:00'),
    (3, 'Webcam Full HD',         '1080p 30fps, microfone embutido, plug-and-play',  189.90, '2024-04-01 08:00:00'),
    (3, 'Microfone Condensador',  'Cardioide, USB, suporte articulado incluso',       379.90, '2024-04-01 08:00:00'),
    -- Games
    (4, 'Console Next Gen',       '4K HDR, 1TB SSD, controle sem fio incluso',      3999.90, '2024-02-10 08:00:00'),
    (4, 'Controle Extra',         'Sem fio, vibração haptica, bateria recarregável',  349.90, '2024-02-10 08:00:00'),
    (4, 'Headset Gamer 7.1',      'Surround virtual, microfone retrátil, USB',        279.90, '2024-02-10 08:00:00'),
    (4, 'Cadeira Gamer Pro',      'Reclinável 180°, suporte lombar, apoio de braço', 1099.90, '2024-05-01 08:00:00'),
    -- Escritório
    (5, 'Impressora Laser Mono',  'Duplex automático, 30ppm, Wi-Fi',                  899.90, '2024-03-15 08:00:00'),
    (5, 'Refil de Toner',         'Compatível com Impressora Laser Mono, 2000 pgs',   129.90, '2024-03-15 08:00:00'),
    (5, 'Suporte para Monitor',   'Altura ajustável, giro 360°, passa-cabos',         149.90, '2024-05-10 08:00:00'),
    (5, 'Hub USB-C 7 em 1',       'HDMI 4K, USB 3.0 x3, SD, MicroSD, PD 100W',      199.90, '2024-05-10 08:00:00');


-- -----------------------------------------------------------------------------
-- estoque
-- Saldo atual de cada produto — deve ser igual ao resultado de:
--   SUM(entradas) - SUM(saídas) em movimentacoes_estoque
-- Quantidades variadas para criar cenários ricos nos exemplos:
-- alguns produtos com estoque alto, outros baixo, um zerado.
-- -----------------------------------------------------------------------------
INSERT INTO estoque (produto_id, quantidade, atualizado_em) VALUES
    ( 1,  45, '2024-06-01 08:00:00'),  -- Smartphone Pro X
    ( 2,  30, '2024-06-01 08:00:00'),  -- Tablet Ultra 10
    ( 3,  60, '2024-06-01 08:00:00'),  -- Smartwatch Fit
    ( 4, 200, '2024-06-01 08:00:00'),  -- Carregador Rápido 65W
    ( 5,  12, '2024-06-01 08:00:00'),  -- Notebook Ultra 15
    ( 6, 150, '2024-06-01 08:00:00'),  -- Mouse Sem Fio Slim
    ( 7,  40, '2024-06-01 08:00:00'),  -- Teclado Mecânico RGB
    ( 8,  18, '2024-06-01 08:00:00'),  -- Monitor 27" Full HD
    ( 9,  55, '2024-06-01 08:00:00'),  -- Fone Bluetooth NC
    (10,  80, '2024-06-01 08:00:00'),  -- Caixa de Som Portátil
    (11,  35, '2024-06-01 08:00:00'),  -- Webcam Full HD
    (12,  25, '2024-06-01 08:00:00'),  -- Microfone Condensador
    (13,   8, '2024-06-01 08:00:00'),  -- Console Next Gen (estoque baixo — bom para exemplos de transação)
    (14,  50, '2024-06-01 08:00:00'),  -- Controle Extra
    (15,  45, '2024-06-01 08:00:00'),  -- Headset Gamer 7.1
    (16,  10, '2024-06-01 08:00:00'),  -- Cadeira Gamer Pro
    (17,  15, '2024-06-01 08:00:00'),  -- Impressora Laser Mono
    (18, 100, '2024-06-01 08:00:00'),  -- Refil de Toner
    (19,  22, '2024-06-01 08:00:00'),  -- Suporte para Monitor
    (20,   0, '2024-06-01 08:00:00');  -- Hub USB-C (sem estoque — bom para exemplos de filtro e CHECK)


-- -----------------------------------------------------------------------------
-- pedidos
-- Status variados para cobrir exemplos de filtro e GROUP BY.
-- Datas distribuídas ao longo do ano para exemplos de agregação por período.
-- -----------------------------------------------------------------------------
INSERT INTO pedidos (cliente_id, valor_total, status, criado_em) VALUES
    (1, 2589.80, 'entregue',   '2024-02-10 10:00:00'),
    (2, 4679.80, 'entregue',   '2024-02-25 11:30:00'),
    (3,  449.90, 'entregue',   '2024-03-05 09:00:00'),
    (4, 1299.90, 'entregue',   '2024-03-20 14:00:00'),
    (5, 4349.80, 'entregue',   '2024-04-02 10:30:00'),
    (1,  429.80, 'enviado',    '2024-04-18 16:00:00'),
    (6, 3999.90, 'enviado',    '2024-05-03 09:15:00'),
    (7, 1549.80, 'confirmado', '2024-05-15 11:00:00'),
    (2,  279.90, 'confirmado', '2024-05-28 13:45:00'),
    (8, 1099.90, 'pendente',   '2024-06-01 08:30:00'),
    (3,  699.80, 'pendente',   '2024-06-02 10:00:00'),
    (9, 2499.90, 'pendente',   '2024-06-03 14:30:00'),
    (5,  629.80, 'cancelado',  '2024-04-10 09:00:00'),
    (10, 349.90, 'cancelado',  '2024-05-07 15:00:00'),
    (4,  199.90, 'pendente',   '2024-06-04 11:00:00');


-- -----------------------------------------------------------------------------
-- itens_pedido
-- preco_unitario captura o preço no momento da venda.
-- Alguns itens têm preco_unitario diferente do atual em produtos.preco
-- para ilustrar a importância desse campo nos exemplos de modelagem.
-- -----------------------------------------------------------------------------
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
    -- Pedido 1: Smartphone + Carregador
    (1,  1, 1, 2499.90),
    (1,  4, 1,   89.90),
    -- Pedido 2: Notebook + Mouse
    (2,  5, 1, 4599.90),
    (2,  6, 1,   79.90),
    -- Pedido 3: Fone Bluetooth
    (3,  9, 1,  449.90),
    -- Pedido 4: Tablet
    (4,  2, 1, 1299.90),
    -- Pedido 5: Console + Headset Gamer
    (5, 13, 1, 3999.90),
    (5, 15, 1,  279.90),  -- preço antigo (era 279.90, agora 349.90 — bom exemplo de modelagem)
    -- Pedido 6: Mouse x2 + Carregador x3
    (6,  6, 2,   79.90),
    (6,  4, 3,   89.90),
    -- Pedido 7: Console
    (7, 13, 1, 3999.90),
    -- Pedido 8: Monitor + Webcam
    (8,  8, 1, 1199.90),
    (8, 11, 1,  189.90),
    -- Pedido 9: Headset Gamer
    (9, 15, 1,  279.90),
    -- Pedido 10: Cadeira Gamer
    (10, 16, 1, 1099.90),
    -- Pedido 11: Smartwatch + Carregador
    (11,  3, 1,  599.90),
    (11,  4, 1,   89.90),
    -- Pedido 12: Smartphone
    (12,  1, 1, 2499.90),
    -- Pedido 13: Fone + Caixa de Som (cancelado — bom para exemplos de filtro)
    (13,  9, 1,  449.90),
    (13, 10, 1,  179.90),  -- preço antigo (era 179.90, agora 299.90)
    -- Pedido 14: Controle Extra (cancelado)
    (14, 14, 1,  349.90),
    -- Pedido 15: Hub USB-C
    (15, 20, 1,  199.90);


-- -----------------------------------------------------------------------------
-- movimentacoes_estoque
--
-- Regra de negócio aplicada neste seed:
--   - Pedidos 'entregue', 'enviado' e 'confirmado' geram saída de estoque
--   - Pedidos 'pendente' ainda não geraram saída (aguardando confirmação)
--   - Pedidos 'cancelado' não geram saída de estoque
--
-- Verificação de consistência por produto:
--   produto | entrada_inicial | saidas | ajuste | saldo_esperado | saldo_atual
--   --------|----------------|--------|--------|----------------|------------
--      1    |      47        |    2   |    -   |      45        |     45  ✓
--      2    |      31        |    1   |    -   |      30        |     30  ✓
--      3    |      61        |    1   |    -   |      60        |     60  ✓
--      4    |     205        |    5   |    -   |     200        |    200  ✓
--      5    |      13        |    1   |    -   |      12        |     12  ✓
--      6    |     153        |    3   |    -   |     150        |    150  ✓
--      7    |      40        |    0   |    -   |      40        |     40  ✓
--      8    |      19        |    1   |    -   |      18        |     18  ✓
--      9    |      56        |    1   |    -   |      55        |     55  ✓
--     10    |      80        |    0   |    -   |      80        |     80  ✓
--     11    |      36        |    1   |    -   |      35        |     35  ✓
--     12    |      25        |    0   |    -   |      25        |     25  ✓
--     13    |      12        |    2   |   -2   |       8        |      8  ✓
--     14    |      50        |    0   |    -   |      50        |     50  ✓
--     15    |      47        |    2   |    -   |      45        |     45  ✓
--     16    |      11        |    1   |    -   |      10        |     10  ✓
--     17    |      15        |    0   |    -   |      15        |     15  ✓
--     18    |     100        |    0   |    -   |     100        |    100  ✓
--     19    |      22        |    0   |    -   |      22        |     22  ✓
--     20    |       5        |    5   |    -   |       0        |      0  ✓
-- -----------------------------------------------------------------------------
INSERT INTO movimentacoes_estoque
    (produto_id, pedido_id, tipo, quantidade, motivo, criado_em)
VALUES

    -- =========================================================================
    -- ENTRADAS INICIAIS DE FORNECEDOR (pedido_id = NULL — FK opcional)
    -- Representam o estoque inicial recebido antes das vendas.
    -- =========================================================================

    -- Eletrônicos
    ( 1, NULL, 'entrada',  47, 'Recebimento inicial de fornecedor', '2024-01-11 08:00:00'),
    ( 2, NULL, 'entrada',  31, 'Recebimento inicial de fornecedor', '2024-01-11 08:00:00'),
    ( 3, NULL, 'entrada',  61, 'Recebimento inicial de fornecedor', '2024-02-02 08:00:00'),
    ( 4, NULL, 'entrada', 205, 'Recebimento inicial de fornecedor', '2024-02-02 08:00:00'),
    -- Informática
    ( 5, NULL, 'entrada',  13, 'Recebimento inicial de fornecedor', '2024-01-13 08:00:00'),
    ( 6, NULL, 'entrada', 153, 'Recebimento inicial de fornecedor', '2024-01-13 08:00:00'),
    ( 7, NULL, 'entrada',  40, 'Recebimento inicial de fornecedor', '2024-03-02 08:00:00'),
    ( 8, NULL, 'entrada',  19, 'Recebimento inicial de fornecedor', '2024-03-02 08:00:00'),
    -- Áudio e Vídeo
    ( 9, NULL, 'entrada',  56, 'Recebimento inicial de fornecedor', '2024-01-21 08:00:00'),
    (10, NULL, 'entrada',  80, 'Recebimento inicial de fornecedor', '2024-01-21 08:00:00'),
    (11, NULL, 'entrada',  36, 'Recebimento inicial de fornecedor', '2024-04-02 08:00:00'),
    (12, NULL, 'entrada',  25, 'Recebimento inicial de fornecedor', '2024-04-02 08:00:00'),
    -- Games
    (13, NULL, 'entrada',  12, 'Recebimento inicial de fornecedor', '2024-02-11 08:00:00'),
    (14, NULL, 'entrada',  50, 'Recebimento inicial de fornecedor', '2024-02-11 08:00:00'),
    (15, NULL, 'entrada',  47, 'Recebimento inicial de fornecedor', '2024-02-11 08:00:00'),
    (16, NULL, 'entrada',  11, 'Recebimento inicial de fornecedor', '2024-05-02 08:00:00'),
    -- Escritório
    (17, NULL, 'entrada',  15, 'Recebimento inicial de fornecedor', '2024-03-16 08:00:00'),
    (18, NULL, 'entrada', 100, 'Recebimento inicial de fornecedor', '2024-03-16 08:00:00'),
    (19, NULL, 'entrada',  22, 'Recebimento inicial de fornecedor', '2024-05-11 08:00:00'),
    (20, NULL, 'entrada',   5, 'Recebimento inicial de fornecedor', '2024-05-11 08:00:00'),

    -- =========================================================================
    -- SAÍDAS POR VENDAS
    -- Apenas pedidos com status: entregue, enviado ou confirmado.
    -- Pedidos pendentes e cancelados não geram saída.
    -- =========================================================================

    -- Pedido 1 (entregue): Smartphone x1, Carregador x1
    ( 1,  1, 'saida', 1, 'Venda — pedido confirmado', '2024-02-10 10:01:00'),
    ( 4,  1, 'saida', 1, 'Venda — pedido confirmado', '2024-02-10 10:01:00'),

    -- Pedido 2 (entregue): Notebook x1, Mouse x1
    ( 5,  2, 'saida', 1, 'Venda — pedido confirmado', '2024-02-25 11:31:00'),
    ( 6,  2, 'saida', 1, 'Venda — pedido confirmado', '2024-02-25 11:31:00'),

    -- Pedido 3 (entregue): Fone Bluetooth x1
    ( 9,  3, 'saida', 1, 'Venda — pedido confirmado', '2024-03-05 09:01:00'),

    -- Pedido 4 (entregue): Tablet x1
    ( 2,  4, 'saida', 1, 'Venda — pedido confirmado', '2024-03-20 14:01:00'),

    -- Pedido 5 (entregue): Console x1, Headset Gamer x1
    (13,  5, 'saida', 1, 'Venda — pedido confirmado', '2024-04-02 10:31:00'),
    (15,  5, 'saida', 1, 'Venda — pedido confirmado', '2024-04-02 10:31:00'),

    -- Pedido 6 (enviado): Mouse x2, Carregador x3
    ( 6,  6, 'saida', 2, 'Venda — pedido confirmado', '2024-04-18 16:01:00'),
    ( 4,  6, 'saida', 3, 'Venda — pedido confirmado', '2024-04-18 16:01:00'),

    -- Pedido 7 (enviado): Console x1
    (13,  7, 'saida', 1, 'Venda — pedido confirmado', '2024-05-03 09:16:00'),

    -- Pedido 8 (confirmado): Monitor x1, Webcam x1
    ( 8,  8, 'saida', 1, 'Venda — pedido confirmado', '2024-05-15 11:01:00'),
    (11,  8, 'saida', 1, 'Venda — pedido confirmado', '2024-05-15 11:01:00'),

    -- Pedido 9 (confirmado): Headset Gamer x1
    (15,  9, 'saida', 1, 'Venda — pedido confirmado', '2024-05-28 13:46:00'),

    -- Pedido 10 (pendente): Cadeira Gamer — SEM saída de estoque
    -- Pedido 11 (pendente): Smartwatch + Carregador — SEM saída de estoque
    -- Pedido 12 (pendente): Smartphone — SEM saída de estoque
    -- Pedido 13 (cancelado): Fone + Caixa de Som — SEM saída de estoque
    -- Pedido 14 (cancelado): Controle Extra — SEM saída de estoque
    -- Pedido 15 (pendente): Hub USB-C — SEM saída de estoque

    -- =========================================================================
    -- AJUSTE DE INVENTÁRIO
    -- Console Next Gen: após contagem física, identificadas 2 unidades
    -- danificadas na entrada. Registro corretivo sem pedido vinculado.
    -- Resultado: entrada 12 - saídas 2 - ajuste 2 = saldo 8 ✓
    -- Ilustra o uso de pedido_id NULL para movimentações internas.
    -- =========================================================================
    (13, NULL, 'saida', 2, 'Ajuste de inventário — unidades danificadas na entrada', '2024-02-12 09:00:00'),

    -- =========================================================================
    -- SAÍDA DE ESTOQUE ZERADO
    -- Hub USB-C: 5 unidades vendidas em pedido avulso antes do sistema,
    -- registradas manualmente para zerar o saldo. Ilustra saldo zero com
    -- histórico rastreável — diferente de um produto nunca cadastrado.
    -- =========================================================================
    (20, NULL, 'saida', 5, 'Venda anterior ao sistema — regularização de saldo', '2024-05-12 10:00:00');
