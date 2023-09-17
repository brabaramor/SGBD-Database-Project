--cria tabela do codigo da cidade
create table id_cidade (
  cod_cidade number not null,
  nome_cidade varchar2(50) not null,
  uf varchar2(2) not null,
  primary key (cod_cidade)
);

--cria tabela do endereco do cliente
create table cliente_endereco (
  cod_endereco number not null,
  nome_end varchar2(50) not null,
  no_casa number not null,
  complemento varchar2(50),
  bairro varchar2(50) not null,
  cod_cidade number not null,
  cep number not null,
  primary key (cod_endereco),
  CONSTRAINT fk_cliente_endereco_cod_cidade FOREIGN KEY (cod_cidade) REFERENCES id_cidade (cod_cidade)
);

--cria tabela de cliente
create table cliente (
  cliente_nome varchar2 not null,
  cliente_sobrenome varchar2 not null,
  cpf number not null,
  nascimento date not null,
  tipo_cnh varchar2(2),
  cod_endereco number not null,
  primary key (cpf),
  CONSTRAINT fk_cliente_cod_endereco FOREIGN KEY (cod_endereco) REFERENCES cliente_endereco (cod_endereco)
);

--cria tabela de veiculo
create table veiculo (
  id_veiculo number not null,
  placa varchar2(50) not null,
  veiculo_nome varchar2(50) not null,
  modelo varchar2(50) not null,
  ano_veiculo number not null,
  fabricante varchar2(50) not null,
  no_passageiros number not null,
  litros_portamalas number not null,
  primary key (id_veiculo)
);

--cria tabela do preco do veículo por dia, semana e mês
create table preco_veiculo (
  id_preco number not null,
  preco_dia number,
  preco_semana number,
  preco_mes number,
  primary key (id_preco)
);

--Inserir o id_preco na tabela de veiculo
ALTER TABLE veiculo 
ADD (id_preco number not null);

ALTER TABLE veiculo ADD CONSTRAINT fk_veiculo_id_preco FOREIGN KEY (id_preco) REFERENCES preco_veiculo (id_preco);

--Inserir o id_veiculo na tabela de preco
ALTER TABLE preco_veiculo 
ADD (id_veiculo number);

ALTER TABLE preco_veiculo ADD CONSTRAINT fk_preco_veiculo_id_veiculo FOREIGN KEY (id_veiculo) REFERENCES veiculo (id_veiculo);

--cria tabela do endereco da relação cliente > aluga > veículo
create table aluga (
  	id_alug number not null,
  	valor_alug number not null,
  	inicio_alug date not null,
  	fim_alug date not null,
    cpf number not null,
    id_veiculo number not null,
    primary key (id_alug),
    CONSTRAINT fk_aluga_cpf FOREIGN KEY (cpf) REFERENCES cliente (cpf),
    CONSTRAINT fk_aluga_id_veiculo FOREIGN KEY (id_veiculo) REFERENCES veiculo (id_veiculo)
);

--cria tabela da manutenção dos veículos
create table manutencao (
  id_manu number not null,
  id_veiculo number not null,
  valor_manu number not null,
  inicio_manu date not null,
  fim_manu date not null,
  tipo_manu varchar2(50),
  primary key (id_manu, id_veiculo),
  CONSTRAINT fk_manutencao_id_veiculo FOREIGN KEY (id_veiculo) REFERENCES veiculo (id_veiculo)
);


--Inserções na tabela id_cidade
INSERT INTO id_cidade (cod_cidade, nome_cidade, uf)
VALUES (01, 'Ferraz de Vasconcelos', 'SP');

INSERT INTO id_cidade (cod_cidade, nome_cidade, uf)
VALUES (02, 'Canoas', 'RS');

INSERT INTO id_cidade (cod_cidade, nome_cidade, uf)
VALUES (03, 'Porto Alegre', 'RS');

INSERT INTO id_cidade (cod_cidade, nome_cidade, uf)
VALUES (04, 'Niterói', 'RJ');

INSERT INTO id_cidade (cod_cidade, nome_cidade, uf)
VALUES (05, 'Salvador', 'BA');


--Inserções na tabela cliente_endereco
INSERT INTO cliente_endereco (cod_endereco, nome_end, no_casa, complemento, bairro, cod_cidade, cep)
VALUES (01, 'Rua Tóquio', 141, null, 'Praia do Flamengo', 05, 41601245);

INSERT INTO cliente_endereco (cod_endereco, nome_end, no_casa, complemento, bairro, cod_cidade, cep)
VALUES (02, 'Avenida Ernani do Amaral Peixoto', 35, null, 'Centro', 04, 24004900);

INSERT INTO cliente_endereco (cod_endereco, nome_end, no_casa, complemento, bairro, cod_cidade, cep)
VALUES (03, 'Rua Duque de Caxias', 1304, 'ap 1', 'Centro Histórico', 03, 90010280);

INSERT INTO cliente_endereco (cod_endereco, nome_end, no_casa, complemento, bairro, cod_cidade, cep)
VALUES (04, 'Rua Ferreira Viana', 76, 'ap 2', 'São José', 02, 92425140);

INSERT INTO cliente_endereco (cod_endereco, nome_end, no_casa, complemento, bairro, cod_cidade, cep)
VALUES (03, 'Rua Ricardo Samuel de Araujo', 123, 'casa 2', 'Jardim Figueiredo', 01, 08526030);


--Inserções na tabela cliente
INSERT INTO cliente (cliente_nome, cliente_sobrenome, cpf, nascimento, tipo_cnh, cod_endereco)
VALUES ('Jihyo', 'Park', 14725836914, '1997-02-01', 'B', 03);

INSERT INTO cliente (cliente_nome, cliente_sobrenome, cpf, nascimento, tipo_cnh, cod_endereco)
VALUES ('Tzuyu', 'Chou', 36925814736, '1999-06-14', 'B', 05);

INSERT INTO cliente (cliente_nome, cliente_sobrenome, cpf, nascimento, tipo_cnh, cod_endereco)
VALUES ('Mina', 'Myoi', 12345678912, '1997-03-24', 'B', 01);

INSERT INTO cliente (cliente_nome, cliente_sobrenome, cpf, nascimento, tipo_cnh, cod_endereco)
VALUES ('Sana', 'Minatozaki', 78945612378, '1996-12-29', 'B', 04);

INSERT INTO cliente (cliente_nome, cliente_sobrenome, cpf, nascimento, tipo_cnh, cod_endereco)
VALUES ('Nayeon', 'Lim', 15975385214, '1995-09-22', 'B', 02);


--inserir informações dos preços dos veículos por dia, semana e mês
INSERT INTO preco_veiculo (id_preco, preco_dia, preco_semana, preco_mes)
VALUES (11, 250, 1575, 6000);

INSERT INTO preco_veiculo (id_preco, preco_dia, preco_semana, preco_mes)
VALUES (12, 300, 1890, 7200);

INSERT INTO preco_veiculo (id_preco, preco_dia, preco_semana, preco_mes)
VALUES (13, 400, 2520, 9600);

INSERT INTO preco_veiculo (id_preco,  preco_dia, preco_semana, preco_mes)
VALUES (14, 250, 1575, 6000);

INSERT INTO preco_veiculo (id_preco, preco_dia, preco_semana, preco_mes)
VALUES (15, 200, 1260, 4800);


--inserir informações sobre id_veiculo na  tabela de preços
INSERT INTO preco_veiculo (id_veiculo)
VALUES 
  (01), 
  (02), 
  (03), 
  (04), 
  (05);


--inserir infos sobre os veículos
INSERT INTO veiculos (id_veiculo, placa, veiculo_nome, modelo, ano_veiculo, fabricante, no_passageiros, litros_portamalas, id_preco)
VALUES (01, 'TWI1CE12', 'Cronos', 'Precision 1.3', 2023, 'Fiat', 5, 252, 11);

INSERT INTO veiculos (id_veiculo, placa, veiculo_nome, modelo, ano_veiculo, fabricante, no_passageiros, litros_portamalas, id_preco)
VALUES (02, 'ONC3E13', 'Spin', 'LTZ', 2023, 'Chevrolet', 7, 710, 12);

INSERT INTO veiculos (id_veiculo, placa, veiculo_nome, modelo, ano_veiculo, fabricante, no_passageiros, litros_portamalas, id_preco)
VALUES (03, 'TZU2Y01', 'Jetta', 'GTI', 2021, 'Volkswagen', 5, 510 13);

INSERT INTO veiculos (id_veiculo, placa, veiculo_nome, modelo, ano_veiculo, fabricante, no_passageiros, litros_portamalas, id_preco)
VALUES (04, 'MIN4T02', 'Peugeot', '208', 2024, 'Citroen', 5, 285, 14);

INSERT INTO veiculos (id_veiculo, placa, veiculo_nome, modelo, ano_veiculo, fabricante, no_passageiros, litros_portamalas, id_preco)
VALUES (05, 'JIH1Y00', 'HB20', 'Comfort Plus', 2024, 'Hyundai', 5, 300, 15);


--inserir informações sobre alugueis realizados
INSERT INTO aluga (id_alug, cpf, id_veiculo, valor_alug, inicio_alug, fim_alug)
VALUES (1, 3692581473, 04, 2250, '2023-09-03', '2023-09-13');

INSERT INTO aluga (id_alug, cpf, id_veiculo, valor_alug, inicio_alug, fim_alug)
VALUES (2, 12345678912, 03, 2520, '2023-08-18', '2023-08-25');

INSERT INTO aluga (id_alug, cpf, id_veiculo, valor_alug, inicio_alug, fim_alug)
VALUES (3, 78945612378, 02, 1200, '2023-09-01', '2023-09-04');

INSERT INTO aluga (id_alug, cpf, id_veiculo, valor_alug, inicio_alug, fim_alug)
VALUES (4, 15975385214, 01, 500, '2023-09-10', '2023-09-12');


--inserir mnanutenções realizadas na tabela de manutenção (os preços são bem aproximados, porque eu não faço ideia de quanto custa, pois não dirijo nem tenho carro)
INSERT INTO manutencao (id_manu, id_veiculo, valor_manu, inicio_manu, fim_manu, tipo_manu)
VALUES (1, 02, 110, '2023-08-15', '2023-08-16', 'Troca de óleo');

INSERT INTO manutencao (id_manu, id_veiculo, valor_manu, inicio_manu, fim_manu, tipo_manu)
VALUES (2, 03, 400, '2023-09-01', '2023-09-02', 'Troca de fluido de transmissão');

INSERT INTO manutencao (id_manu, id_veiculo, valor_manu, inicio_manu, fim_manu, tipo_manu)
VALUES (3, 04, 400, '2023-09-28', '2023-09-29', 'Verificação dos freios e troca de pastilhas');

INSERT INTO manutencao (id_manu, id_veiculo, valor_manu, inicio_manu, fim_manu, tipo_manu)
VALUES (4, 05, 50, '2023-09-15', '2023-09-16', 'Troca de filtro de ar');
