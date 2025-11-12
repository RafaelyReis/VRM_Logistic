# VRM_Logistic
Sistema mobile para gestão de operações logísticas, com controle de pedidos, rotas, motoristas e clientes. Projeto integrador do 4º semestre de Sistemas de Informação.

# Integrantes e funções
- Rafaely Reis: Gestora de Configuração / Revisora de Código  
- Beatriz: Desenvolvedora Principal (responsável pelo código SQL)

# Descrição técnica do projeto (resumo do SQL)

O sistema VRM Logistics foi construído para gerenciar os principais processos de uma transportadora desde o cadastro de clientes até o acompanhamento dos pedidos e motoristas.

Ele é composto por quatro tabelas principais, que se relacionam entre si para representar o fluxo completo da operação logística:

# Cliente

Essa tabela guarda todas as informações das empresas que contratam os serviços de transporte.
Cada registro representa um cliente da VRM Logistics.

Campos principais:

- cliente_id: identificador único de cada cliente;

- nome: nome da empresa;

- pf_cnpj: documento de identificação;

- endereco, contato: dados de localização e comunicação;

- produto: tipo de mercadoria transportada;

observacoes: campo livre para anotações gerais.

🧩 Um cliente pode ter vários pedidos associados.

# Motorista

Tabela responsável por armazenar os dados dos motoristas que realizam as entregas.
Serve para controlar quem está ativo e quais veículos podem ser utilizados.

Campos principais:

- motorista_id: identificador único;

- nome e cnh: dados do condutor;

- tipo_caminhao e capacidade_carga: definem o tipo e limite de transporte;

situacao: indica se o motorista está “Ativo” ou “Inativo”.

Um motorista pode realizar várias entregas diferentes.

# Pedido

Essa tabela representa os pedidos de transporte solicitados pelos clientes.
Cada pedido é vinculado a um cliente e contém todas as informações da entrega.

Campos principais:

- pedido_id: identificador único;

- cliente_id: chave estrangeira que liga o pedido ao cliente;

- tipo_carga, quantidade, origem, destino, km: definem a operação logística;

- status: mostra se o pedido está “Pendente”, “Em rota”, “Entregue” ou “Atrasado”;

- data_prevista: data estimada para conclusão da entrega.

Um pedido pertence a um cliente e pode envolver vários motoristas.

# Pedido_Motorista

Tabela intermediária criada para representar o relacionamento muitos-para-muitos entre pedidos e motoristas.
Ela indica quais motoristas estão atribuídos a cada pedido.

Campos principais:

- pedido_id: identifica o pedido;

- motorista_id: identifica o motorista;

Ambos formam uma chave primária composta, garantindo que um mesmo motorista não seja cadastrado duas vezes no mesmo pedido.

Um pedido pode ter vários motoristas, e um motorista pode atender vários pedidos.