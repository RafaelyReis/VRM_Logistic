USE vrm_logistics;

-- READ: JOIN mostrando motoristas por pedido
SELECT P.pedido_id, C.nome AS cliente, P.tipo_carga, P.status,
       GROUP_CONCAT(M.nome SEPARATOR ', ') AS Motoristas
FROM Pedido P
JOIN Cliente C ON C.cliente_id = P.cliente_id
JOIN Pedido_Motorista PM ON PM.pedido_id = P.pedido_id
JOIN Motorista M ON M.motorista_id = PM.motorista_id
GROUP BY P.pedido_id;

-- READ: pedidos atrasados
SELECT P.pedido_id, C.nome AS cliente, P.destino, P.data_prevista
FROM Pedido P
JOIN Cliente C ON C.cliente_id = P.cliente_id
WHERE P.status = 'Atrasado';

-- UPDATE: marca pedido_id=2 como entregue
UPDATE Pedido SET status = 'Entregue' WHERE pedido_id = 2;

-- DELETE: limpa pedidos entregues com data anterior a hoje
DELETE FROM Pedido
WHERE status = 'Entregue' AND data_prevista < CURDATE();
