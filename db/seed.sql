USE vrm_logistics;

-- Clientes
INSERT INTO Cliente (nome, cpf_cnpj, endereco, contato, produto, observacoes) VALUES
('Caixas Brasil LTDA', '12.345.678/0001-99', 'Rua das Indústrias, 100', '1198765-4321', 'Caixas de papelão', 'Cliente recorrente'),
('Papelão Forte', '98.765.432/0001-11', 'Av. Central, 500', '1192345-6789', 'Chapas de papelão', 'Solicita entregas semanais'),
('EcoPack Embalagens', '45.678.912/0001-33', 'Rua Verde, 80', '1191122-3344', 'Embalagens ecológicas', ''),
('MasterBox', '56.789.123/0001-44', 'Rua Azul, 200', '1199988-7766', 'Caixas reforçadas', ''),
('PapelMax', '23.456.789/0001-22', 'Av. Paulista, 3000', '1195555-4444', 'Caixas grandes', 'Entrega mensal'),
('TransPapel', '34.567.890/0001-55', 'Rua Alfa, 50', '1196666-5555', 'Caixas leves', ''),
('LogiPack', '11.223.344/0001-66', 'Rua Beta, 70', '1197777-6666', 'Embalagens industriais', ''),
('CardBoardX', '22.334.455/0001-77', 'Rua Gama, 120', '1198888-7777', 'Caixas exportação', ''),
('PaperPro', '33.445.566/0001-88', 'Rua Delta, 140', '1199999-8888', 'Papelão ondulado', ''),
('BoxPrime', '44.556.677/0001-99', 'Rua Sigma, 160', '1190000-9999', 'Embalagens premium', '');

-- Motoristas
INSERT INTO Motorista (nome, cnh, tipo_caminhao, capacidade_carga, situacao) VALUES
('Carlos Silva', '12345678900', 'Truck', 8000, 'Ativo'),
('João Pereira', '98765432100', 'Carreta', 12000, 'Ativo'),
('Marcos Souza', '11223344556', 'Toco', 6000, 'Ativo'),
('Rafael Gomes', '22334455667', 'Carreta', 15000, 'Ativo'),
('Paulo Almeida', '33445566778', 'Truck', 9000, 'Ativo'),
('Felipe Rocha', '44556677889', 'Toco', 5000, 'Ativo'),
('Eduardo Lima', '55667788990', 'Truck', 7000, 'Ativo'),
('André Costa', '66778899001', 'Carreta', 14000, 'Ativo'),
('Rodrigo Dias', '77889900112', 'Truck', 8000, 'Ativo'),
('Diego Ramos', '88990011223', 'Toco', 6000, 'Inativo');

-- Pedidos
INSERT INTO Pedido (cliente_id, tipo_carga, quantidade, origem, destino, km, status, data_prevista) VALUES
(1, 'Caixas pequenas', 100, 'São Paulo', 'Campinas', 100, 'Em rota', '2025-10-28'),
(2, 'Chapas reforçadas', 200, 'Campinas', 'Sorocaba', 130, 'Pendente', '2025-10-29'),
(3, 'Embalagens leves', 150, 'Jundiaí', 'Limeira', 90, 'Entregue', '2025-10-20'),
(4, 'Caixas grandes', 300, 'São Paulo', 'Piracicaba', 140, 'Atrasado', '2025-10-25'),
(5, 'Papelão liso', 250, 'Sumaré', 'Americana', 30, 'Em rota', '2025-10-27'),
(6, 'Caixas médias', 180, 'Campinas', 'Paulínia', 25, 'Pendente', '2025-10-30'),
(7, 'Caixas premium', 400, 'Campinas', 'Limeira', 80, 'Entregue', '2025-10-24'),
(8, 'Embalagens exportação', 120, 'São Paulo', 'Guarulhos', 40, 'Em rota', '2025-10-28'),
(9, 'Papelão ondulado', 90, 'Valinhos', 'Indaiatuba', 35, 'Pendente', '2025-10-29'),
(10, 'Caixas reforçadas', 350, 'Campinas', 'Itu', 100, 'Pendente', '2025-10-31');

-- Relacionamentos Pedido x Motorista
INSERT INTO Pedido_Motorista (pedido_id, motorista_id) VALUES
(1,1),(1,3),(2,2),(3,4),(4,5),(5,1),(5,6),(6,7),(7,8),(8,9),(9,2),(10,3);

-- Registros extras para testes
INSERT INTO Cliente (nome, cpf_cnpj, endereco, contato, produto, observacoes)
VALUES ('NovaPack', '55.667.778/0001-00', 'Rua Nova, 250', '1191234-5678', 'Caixas recicladas', 'Primeira compra');

INSERT INTO Pedido (cliente_id, tipo_carga, quantidade, origem, destino, km, status, data_prevista)
VALUES (LAST_INSERT_ID(), 'Caixas recicladas', 200, 'Campinas', 'Sumaré', 20, 'Pendente', '2025-11-01');
