-- ===============================================
-- VRM Logistics - Sistema para gestão de logística
-- Script feito por: Beatriz & Rafaely
-- ===============================================

DROP DATABASE IF EXISTS vrm_logistics;
CREATE DATABASE vrm_logistics
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_unicode_ci;
USE vrm_logistics;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- Tabela Cliente
CREATE TABLE Cliente (
  cliente_id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cpf_cnpj VARCHAR(20) NOT NULL UNIQUE,
  endereco VARCHAR(150),
  contato VARCHAR(50),
  produto VARCHAR(100),
  observacoes TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela Motorista
CREATE TABLE Motorista (
  motorista_id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  cnh VARCHAR(20) NOT NULL UNIQUE,
  tipo_caminhao VARCHAR(50),
  capacidade_carga DECIMAL(10,2),
  situacao ENUM('Ativo','Inativo') DEFAULT 'Ativo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela Pedido
CREATE TABLE Pedido (
  pedido_id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  tipo_carga VARCHAR(100),
  quantidade INT,
  origem VARCHAR(100),
  destino VARCHAR(100),
  km INT,
  status ENUM('Pendente','Em rota','Entregue','Atrasado') DEFAULT 'Pendente',
  data_prevista DATE,
  FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Associação Pedido x Motorista (muitos-para-muitos)
CREATE TABLE Pedido_Motorista (
  pedido_id INT NOT NULL,
  motorista_id INT NOT NULL,
  PRIMARY KEY (pedido_id, motorista_id),
  FOREIGN KEY (pedido_id) REFERENCES Pedido(pedido_id) ON DELETE CASCADE,
  FOREIGN KEY (motorista_id) REFERENCES Motorista(motorista_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;
