# SGBD-Database-Project

Hello!
This project was created for the Database course of my System development graduation. To the project be completed, four parts must be deployed:
<ul>
  <li><a href="#text1">The ERD (entity-relationship diagram);</a></li>
  <li><a href="#text2">The relational database model (normalized in the 3FN);</a></li>
  <li><a href="#text3">Three queries in relational algebra and SQL;</a></li>
  <li><a href="https://github.com/brabaramor/SGBD-Database-Project/">The SQL script to the Database and the SQL queries (available in this repository)</a></li>
</ul>

<h2> 1 First Part: The ERD (entity-relationship diagram)<a name="text1"></a></h2>
For the ERD, I created 3 entities (people, object and event) and 2 relationships. You can visualize the ERD (in portuguese) in the image below.
<p> </p>
<a href='https://postimg.cc/025pQh4Q' target='_blank'><img src='https://i.postimg.cc/025pQh4Q/DER-Desafio-Barbara-Mor-Da-Mata.png' border='0' alt='ER Diagram' width='100%'/></a>

<h2> 2 Second Part: The relational database model (normalized in the 3FN)<a name="text2"></a></h2>
<p> To deploy the database in the Oracle tool properly, we should create the logical data structure and do the normalization process in it to a relational database. So, I did normalize the data tables in the 3FN. As Machado (2004, p. 184) presents, the table is only in the 3FN if it is in 1FN and 2FN and if and only if there's no transitive dependency on any of the attributes but the primary key. So author also discusses that the table structure is in first normal form if all the columns have a single value and if there's no repetitive groups in a single line. Beyond, the table is in the second normal form if it is in the first normal form and if there's no functional dependency on either key than the primary key. </p>
<p> After that, in the tables below you can see the result of the normalization process of the relationships, with some examples, to create and test the SQL script of the database.</p>

<!-- Tabela 1: Criando as colunas -->
<h4>1) CLIENTE (CLIENTE_NOME, CLIENTE_SOBRENOME, CPF, NASCIMENTO, TIPO_CNH, COD_ENDERECO)</h4>
<table>
<tr>
  <th>CLIENTE_NOME </th>
  <th>CLIENTE_SOBRENOME</th>
  <th>CPF</th>
  <th>NASCIMENTO</th>
  <th>TIPO_CNH</th>
  <th>COD_ENDERECO</th>
</tr>

<!-- preenchendo a primeira linha -->
<tr>
  <td>Jihyo</td>
  <td>Park</td>
  <td>14725836914</td>
  <td>01/02/1997</td>
  <td>B</td>
  <td>01</td>
</tr>

<!-- preenchendo a segunda linha -->
<tr>
  <td>Tzuyu</td>
  <td>Chou</td>
  <td>36925814736</td>
  <td>14/06/1999</td>
  <td>B</td>
  <td>02</td>
</tr>
</table>

<!-- Tabela 2: Criando as colunas -->
<h4>2) CLIENTE_ENDERECO (COD_ENDERECO, NOME_END, NO_CASA, COMPLEMENTO, BAIRRO, COD_CIDADE, CEP)</h4>
<table>
<tr>
  <th>COD_ENDERECO</th>
  <th>NOME_END</th>
  <th>NO_CASA</th>
  <th>COMPLEMENTO</th>
  <th>BAIRRO</th>
  <th>COD_CIDADE</th>
  <th>CEP</th>
</tr>

<!-- preenchendo a primeira linha -->
<tr>
  <td>01</td>
  <td>Rua Tóquio</td>
  <td>141</td>
  <td> </td>
  <td>Praia do Flamengo</td>
  <td>15</td>
 <td>41601245</td>
</tr>

<!-- preenchendo a segunda linha -->
<tr>
  <td>02</td>
  <td>Avenida Ernani do Amaral Peixoto</td>
  <td>35</td>
  <td> ap  1</td>
  <td>Centro</td>
  <td>14</td>
 <td>24004900</td>
</tr>
</table>

<!-- Tabela 3: Criando as colunas -->
<h4>3) ID_CIDADE (COD_CIDADE, NOME_CIDADE, UF)</h4>
<table>
<tr>
  <th>COD_CIDADE</th>
  <th>NOME_CIDADE</th>
  <th>UF</th>
</tr>

<!-- preenchendo a primeira linha -->
<tr>
  <td>14</td>
  <td>Niterói</td>
  <td>RJ</td>
</tr>

<!-- preenchendo a segunda linha -->
<tr>
  <td>15</td>
  <td>Salvador</td>
  <td>BA</td>
</tr>
</table>

<!-- Tabela 4: Criando as colunas -->
<h4>4) VEICULO (ID_VEICULO, PLACA, VEICULO_NOME, MODELO, ANO_VEICULO, FABRICANTE, NO_PASSAGEIROS, LITROS_PORTAMALAS, PRECO_DIA, PRECO_SEMANA, PRECO_MES)</h4>
<table>
<tr>
  <th>ID_VEICULO</th>
  <th>PLACA</th>
  <th>VEICULO_NOME</th>
  <th>MODELO</th>
  <th>ANO_VEICULO</th>
  <th>FABRICANTE</th>
  <th>NO_PASSAGEIROS</th>
  <th>LITROS_PORTAMALAS</th>
  <th>PRECO_DIA</th>
  <th>PRECO_SEMANA</th>
  <th>PRECO_MES</th>
</tr>

<!-- preenchendo a primeira linha -->
<tr>
  <td>01</td>
  <td>TWI1CE12</td>
  <td>Cronos</td>
  <td>Precision 1.3</td>
  <td>2023</td>
  <td>Fiat</td>
  <td>5</td>
  <td>525</td>
  <td>250</td>
  <td>1575</td>
  <td>6000</td>
</tr>

<!-- preenchendo a segunda linha -->
<tr>
  <td>02</td>
  <td>ONC3E13</td>
  <td>Spin</td>
  <td>LTZ</td>
  <td>2023</td>
  <td>Chevrolet</td>
  <td>7</td>
  <td>710</td>
  <td>300</td>
  <td>1890</td>
  <td>7200</td>
</tr>
</table>

<!-- Tabela 5: Criando as colunas -->
<h4>5) ALUGA (ID_ALUG, CPF, ID_VEICULO, VALOR_ALUG, INICIO_ALUG, FIM_ALUG)</h4>
<table>
<tr>
  <th>ID_ALUG</th>
  <th>CPF</th>
  <th>ID_VEICULO</th>
  <th>VALOR_ALUG</th>
  <th>INICIO_ALUG</th>
  <th>FIM_ALUG</th>
</tr>

<!-- preenchendo a primeira linha -->
<tr>
  <td>001</td>
  <td>36925814736</td>
  <td>20</td>
  <td>1200</td>
  <td>01/09/2023</td>
  <td>04/09/2023</td>
</tr>
</table>

<!-- Tabela 6: Criando as colunas -->
<h4>6) MANUTENCAO (ID_MANU, ID_VEICULO, VALOR_MANU, INICIO_MANU, FIM_MANU, TIPO_MANU)</h4>
<table>
<tr>
  <th>ID_MANU</th>
  <th>ID_VEICULO</th>
  <th>VALOR_MANU</th>
  <th>INICIO_MANU</th>
  <th>FIM_MANU</th>
  <th>TIPO_MANU</th>
</tr>

<!-- preenchendo a primeira linha -->
<tr>
  <td>011</td>
  <td>10</td>
  <td>110</td>
  <td>5/08/2023</td>
  <td>16/08/2023</td>
  <td>Troca de óleo</td>
</tr>

<!-- preenchendo a segunda linha -->
<tr>
  <td>012</td>
  <td>20</td>
  <td>400</td>
  <td>01/09/2023</td>
  <td>02/09/2023</td>
  <td>Troca de fluido de transmissão</td>
</tr>
</table>

<h2>3 Third Part: Queries in Relational Algebra and SQL<a name="text3"></a></h2>
Three relational algebra expressions must be created with the aim of meeting the following requirements:
<br>
<br>
<strong> A) Obtain all vehicles that have never been rented to any customer; </strong>
<br>
<br>
<table align='center'>
  <tr>
    <th>(πid_veiculo(veiculo) - πid_veiculo(aluga))</th>
  </tr>
</table>

<p>By projecting (π) the "id_veiculo" in the set difference of "veiculo" and "aluga" relationships, you can discover where "id_veiculo" is not present in "aluga" relationship. It means you can get the answer to: "which vehicle has never been rented?" </p>
<p>The query to this relational algebraic expression is:</p>
<table align='center'>
  <tr align='left'>
    <th>SELECT id_veiculo FROM veiculo <br>
WHERE id_veiculo NOT IN (SELECT id_veiculo FROM aluga);</th>
  </tr>
</table>
<p> The query explains itself, but let's take a look: </p>

<strong> B) Find customers who rented a specific vehicle, identified by the license plate; </strong>
<table align='center'> 
  <tr>
    <th>πcpf(σplaca = 'TWI1CE12' (aluga ⨝ veiculo))</th> 
  </tr>
</table>

<p>First, you join (⨝) "aluga" and "veiculo" relationships, based on the "id_veiculo", which is a common attribute between them. Then, you select (σ) the data types with "TWI1CE12" as "placa" attribute in the "aluga" and "veiculo" joinning. Finally, you project (π) the "cpf" to answer: "who was the client which has rented the vehicle with "TWI1CE12" plate?"</p>
<p>The SQL query is kind of similar to the algebraic expression. The "ON veiculo.id_veiculo = aluga.id_veiculo" was deployed to show the common attribute in the joinning "aluga ⨝ veiculo" </p>

<table align='center'>
  <tr align='left'>
    <th>SELECT aluga.cpf FROM aluga <br>
INNER JOIN veiculo <br>
ON aluga.id_veiculo = veiculo.id_veiculo <br>
WHERE veiculo.placa = 'TWI1CE12';</th>
  </tr>
</table>

<strong> C) Obtain customers who rented vehicles, along with information about the rented vehicle, such as license plate, model and manufacturer. </strong>
<table align='center'>
  <tr>
    <th>π cpf, modelo, placa, fabricante(aluga ⨝ veiculo)</th>
  </tr>
</table>
<p>To answer the query: "which client has rented what vehicle? And what its plate and its manufactured?" You can project (π) "cpf", "modelo", "placa" and "fabricante" data types in the "aluga" and "veiculo" joinning.</p>
<p>About the SQL query:</p>

<table align='center'> 
  <tr align='left'>
    <th>SELECT veiculo.modelo, veiculo.placa, veiculo.fabricante, aluga.cpf <br>
      FROM veiculo <br>INNER JOIN aluga <br>
      ON veiculo.id_veiculo = aluga.id_veiculo <br>
      WHERE cpf IN(SELECT cpf from aluga); </th>
  </tr>
</table>

<p>The "SELECT x FROM y INNER JOIN w" shows us the projection and joinning, but it's necessary to include the "ON veiculo.id_veiculo = aluga.id_veiculo" to show the common attribute in the joinning "aluga ⨝ veiculo", as I said in the second query (B) above Also, the subquery "SELECT cpf from aluga" will present only the "cpf" from "aluga" relationship.</p>
<br>
</div>
