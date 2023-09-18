--aqui, estarão dispostos os códigos das consultas, montadas a partir das expressões algébricas
-- consulta da primeira expressão algébricas
SELECT id_veiculo FROM veiculo 
WHERE id_veiculo NOT IN (SELECT id_veiculo FROM aluga);

--consulta segunda expressão algébrica
SELECT aluga.cpf FROM aluga
INNER JOIN veiculo
ON aluga.id_veiculo = veiculo.id_veiculo
WHERE veiculo.placa = 'TWI1CE12';

--consulta terceira expressão algégrica
SELECT veiculo.modelo, veiculo.placa, veiculo.fabricante, aluga.cpf
FROM veiculo
INNER JOIN aluga
ON veiculo.id_veiculo = aluga.id_veiculo
WHERE cpf IN(SELECT cpf from aluga);