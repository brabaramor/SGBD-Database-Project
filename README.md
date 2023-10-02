# SGBD-Database-Project

Hello!
This project was created for the Database course of my System development graduation. To the project be completed, four parts must be deployed:
<ul>
  <li> The ERD (entity-relationship diagram);</li>
  <li> The relational database normalized in the 3FN;</li>
  <li> Three queries in relational algebra;</li>
  <li> The SQL script for the queries.</li>
</ul>

<h2> 1 First Part</h2>
For the ERD, I created 3 entities (people, object and event) and 2 relationships. You can visualize the ERD (in portuguese) in the image below.
<p> </p>
<a href='https://postimg.cc/025pQh4Q' target='_blank'><img src='https://i.postimg.cc/025pQh4Q/DER-Desafio-Barbara-Mor-Da-Mata.png' border='0' alt='ER Diagram' width='100%'/></a>
<h2> 2 Second Part </h2>
<table>
<!-- Criando as colunas -->
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
  <td>03</td>
</tr>

<!-- preenchendo a segunda linhas -->
<tr>
  <td>Tzuyu</td>
  <td>Chou</td>
  <td>36925814736</td>
  <td>14/06/1999</td>
  <td>B</td>
  <td>05</td>
</tr>
</table>

<h2>3 Third Part</h2>
Three relational algebra expressions must be created with the aim of meeting the following requirements:

A) Obtain all vehicles that have never been rented to any customer;

veiculo - (veiculo ⨝ aluga)

B) Find customers who rented a specific vehicle, identified by the license plate;

cliente ⨝ (σ(placa = 'TWI1CE12', veiculo) ⨝ aluga)

C) Obtain customers who rented vehicles, along with information about the rented vehicle, such as license plate, model and manufacturer.

(cliente ⨝ aluga) ⨝ veiculo

<h2>4 Fourth Part </h2>
