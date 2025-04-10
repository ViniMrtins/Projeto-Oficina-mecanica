CREATE DATABASE OFICINA;
USE OFICINA;

CREATE TABLE IF NOT EXISTS cliente(
  idCliente INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(45) NOT NULL,
  Contato VARCHAR(45) NOT NULL,
  Endereço VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCliente)
);


CREATE TABLE IF NOT EXISTS carro(
  idCarro INT NOT NULL AUTO_INCREMENT,
  cliente_idCliente INT NOT NULL,
  Placa VARCHAR(45) NOT NULL,
  Modelo VARCHAR(45) NOT NULL,
  Cor VARCHAR(45) NOT NULL,
  PRIMARY KEY (idCarro, cliente_idCliente),
  INDEX fk_carro_cliente_idx (cliente_idCliente),
  CONSTRAINT fk_carro_cliente FOREIGN KEY (cliente_idCliente) REFERENCES cliente(idCliente)
);


CREATE TABLE IF NOT EXISTS EqMecanicos (
  idEqMecanicos INT NOT NULL AUTO_INCREMENT,
  Identificacao VARCHAR(45),
  Quantidade INT,
  carro_idCarro INT NOT NULL,
  PRIMARY KEY (idEqMecanicos),
  FOREIGN KEY (carro_idCarro) REFERENCES carro(idCarro)
);



CREATE TABLE IF NOT EXISTS OrdemServico(
  idOrdemServico INT NOT NULL AUTO_INCREMENT,
  EqMecanicos_idEqMecanicos INT NOT NULL,
  Numero VARCHAR(45) NULL,
  Emissao DATE NULL,
  Valor VARCHAR(45) NULL,
  StatusOrdem VARCHAR(45) NULL,
  DataConclusao DATE(45) NULL,
  PRIMARY KEY (idOrdemServico),
  INDEX fk_EqMecanicos_idx (EqMecanicos_idEqMecanicos),
  CONSTRAINT fk_EqMecanicos FOREIGN KEY (EqMecanicos_idEqMecanicos) REFERENCES EqMecanicos(idEqMecanicos)
);



CREATE TABLE IF NOT EXISTS servico(
  TipoServico INT NOT NULL AUTO_INCREMENT,
  PrecoServico VARCHAR(45) NULL,
  idOrdemServico INT NOT NULL,
  PRIMARY KEY (TipoServico),
  INDEX fk_servico_OrdemServico_idx (idOrdemServico),
  CONSTRAINT fk_servico_OrdemServico FOREIGN KEY (idOrdemServico)  REFERENCES OrdemServico(idOrdemServico)
);


CREATE TABLE IF NOT EXISTS pecas(
  idPeca INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(100) NOT NULL,
  Valor VARCHAR(45) NULL,
  servico_TipoServico INT NOT NULL,
  PRIMARY KEY (idPeca),
  INDEX fk_pecas_servico_idx (servico_TipoServico),
  CONSTRAINT fk_pecas_servico FOREIGN KEY (servico_TipoServico) REFERENCES servico(TipoServico)
);


CREATE TABLE IF NOT EXISTS mecanico (
  idMecanico INT NOT NULL AUTO_INCREMENT,
  idEqMecanicos INT NOT NULL,
  Codigo VARCHAR(45),
  Nome VARCHAR(45),
  Endereco VARCHAR(45),
  Especialidade VARCHAR(45),
  PRIMARY KEY (idMecanico),
  FOREIGN KEY (idEqMecanicos) REFERENCES EqMecanicos(idEqMecanicos)
);
