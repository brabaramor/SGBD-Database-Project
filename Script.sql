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
  cliente_nome varchar2(20) not null,
  cliente_sobrenome varchar2(20) not null,
  cpf number not null,
  nascimento date,
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
  preco_dia number,
  preco_semana number,
  preco_mes number,
  primary key (id_veiculo)
);


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
VALUES (11, 'Ferraz de Vasconcelos', 'SP');

INSERT INTO id_cidade (cod_cidade, nome_cidade, uf)
VALUES (12, 'Canoas', 'RS');

INSERT INTO id_cidade (cod_cidade, nome_cidade, uf)
VALUES (13, 'Porto Alegre', 'RS');

INSERT INTO id_cidade (cod_cidade, nome_cidade, uf)
VALUES (14, 'Niterói', 'RJ');

INSERT INTO id_cidade (cod_cidade, nome_cidade, uf)
VALUES (15, 'Salvador', 'BA');


SELECT cod_cidade, nome_cidade, uf FROM id_cidade;


--Inserções na tabela cliente_endereco
INSERT INTO cliente_endereco (cod_endereco, nome_end, no_casa, complemento, bairro, cod_cidade, cep)
VALUES (01, 'Rua Tóquio', 141, null, 'Praia do Flamengo', 15, 41601245);

INSERT INTO cliente_endereco (cod_endereco, nome_end, no_casa, complemento, bairro, cod_cidade, cep)
VALUES (02, 'Avenida Ernani do Amaral Peixoto', 35, null, 'Centro', 14, 24004900);

INSERT INTO cliente_endereco (cod_endereco, nome_end, no_casa, complemento, bairro, cod_cidade, cep)
VALUES (03, 'Rua Duque de Caxias', 1304, 'ap 1', 'Centro Histórico', 13, 90010280);

INSERT INTO cliente_endereco (cod_endereco, nome_end, no_casa, complemento, bairro, cod_cidade, cep)
VALUES (04, 'Rua Ferreira Viana', 76, 'ap 2', 'São José', 12, 92425140);

INSERT INTO cliente_endereco (cod_endereco, nome_end, no_casa, complemento, bairro, cod_cidade, cep)
VALUES (05, 'Rua Ricardo Samuel de Araujo', 123, 'casa 2', 'Jardim Figueiredo', 11, 08526030);


SELECT cod_endereco, nome_end, no_casa, complemento, bairro, cod_cidade, cep FROM cliente_endereco;


--Inserções na tabela cliente
INSERT INTO cliente (cliente_nome, cliente_sobrenome, cpf, nascimento, tipo_cnh, cod_endereco)
VALUES ('Jihyo', 'Park', 14725836914, null, 'B', 03);

INSERT INTO cliente (cliente_nome, cliente_sobrenome, cpf, nascimento, tipo_cnh, cod_endereco)
VALUES ('Tzuyu', 'Chou', 36925814736, null, 'B', 05);

INSERT INTO cliente (cliente_nome, cliente_sobrenome, cpf, nascimento, tipo_cnh, cod_endereco)
VALUES ('Mina', 'Myoi', 12345678912, null, 'B', 01);

INSERT INTO cliente (cliente_nome, cliente_sobrenome, cpf, nascimento, tipo_cnh, cod_endereco)
VALUES ('Sana', 'Minatozaki', 78945612378, null, 'B', 04);

INSERT INTO cliente (cliente_nome, cliente_sobrenome, cpf, nascimento, tipo_cnh, cod_endereco)
VALUES ('Nayeon', 'Lim', 15975385214, null, 'B', 02);


SELECT cliente_nome, cliente_sobrenome, cpf, nascimento, tipo_cnh, cod_endereco FROM cliente;



--inserir infos sobre os veículos
INSERT INTO veiculo (id_veiculo, placa, veiculo_nome, modelo, ano_veiculo, fabricante, no_passageiros, litros_portamalas, preco_dia, preco_semana, preco_mes)
VALUES (10, 'TWI1CE12', 'Cronos', 'Precision 1.3', 2023, 'Fiat', 5, 252, 250, 1575, 6000);

INSERT INTO veiculo (id_veiculo, placa, veiculo_nome, modelo, ano_veiculo, fabricante, no_passageiros, litros_portamalas, preco_dia, preco_semana, preco_mes)
VALUES (20, 'ONC3E13', 'Spin', 'LTZ', 2023, 'Chevrolet', 7, 710, 300, 1890, 7200);

INSERT INTO veiculo (id_veiculo, placa, veiculo_nome, modelo, ano_veiculo, fabricante, no_passageiros, litros_portamalas, preco_dia, preco_semana, preco_mes)
VALUES (30, 'TZU2Y01', 'Jetta', 'GTI', 2021, 'Volkswagen', 5, 510, 400, 2520, 9600);

INSERT INTO veiculo (id_veiculo, placa, veiculo_nome, modelo, ano_veiculo, fabricante, no_passageiros, litros_portamalas, preco_dia, preco_semana, preco_mes)
VALUES (40, 'MIN4T02', 'Peugeot', '208', 2024, 'Citroen', 5, 285, 250, 1575, 6000);

INSERT INTO veiculo (id_veiculo, placa, veiculo_nome, modelo, ano_veiculo, fabricante, no_passageiros, litros_portamalas, preco_dia, preco_semana, preco_mes)
VALUES (50, 'JIH1Y00', 'HB20', 'Comfort Plus', 2024, 'Hyundai', 5, 300, 200, 1260, 4800);


SELECT id_veiculo, placa, veiculo_nome, modelo, ano_veiculo, fabricante, no_passageiros, litros_portamalas, preco_dia, preco_semana, preco_mes FROM veiculo;



--inserir informações sobre alugueis realizados
INSERT INTO aluga (id_alug, cpf, id_veiculo, valor_alug, inicio_alug, fim_alug)
VALUES (001, 3692581473, 40, 2250, '2023-09-03', '2023-09-13');

INSERT INTO aluga (id_alug, cpf, id_veiculo, valor_alug, inicio_alug, fim_alug)
VALUES (002, 12345678912, 30, 2520, '2023-08-18', '2023-08-25');

INSERT INTO aluga (id_alug, cpf, id_veiculo, valor_alug, inicio_alug, fim_alug)
VALUES (003, 78945612378, 20, 1200, '2023-09-01', '2023-09-04');

INSERT INTO aluga (id_alug, cpf, id_veiculo, valor_alug, inicio_alug, fim_alug)
VALUES (004, 15975385214, 10, 500, '2023-09-10', '2023-09-12');


--inserir mnanutenções realizadas na tabela de manutenção (os preços são bem aproximados, porque eu não faço ideia de quanto custa, pois não dirijo nem tenho carro)
INSERT INTO manutencao (id_manu, id_veiculo, valor_manu, inicio_manu, fim_manu, tipo_manu)
VALUES (011, 20, 110, '2023-08-15', '2023-08-16', 'Troca de óleo');

INSERT INTO manutencao (id_manu, id_veiculo, valor_manu, inicio_manu, fim_manu, tipo_manu)
VALUES (012, 30, 400, '2023-09-01', '2023-09-02', 'Troca de fluido de transmissão');

INSERT INTO manutencao (id_manu, id_veiculo, valor_manu, inicio_manu, fim_manu, tipo_manu)
VALUES (013, 40, 400, '2023-09-28', '2023-09-29', 'Verificação dos freios e troca de pastilhas');

INSERT INTO manutencao (id_manu, id_veiculo, valor_manu, inicio_manu, fim_manu, tipo_manu)
VALUES (014, 50, 50, '2023-09-15', '2023-09-16', 'Troca de filtro de ar');
