# SGBD-Database-Project

Hello!
This project was created for the Database course of my System development graduation. To the project be completed, four parts must be deployed:

<h2> First Part </h2>
Three relational algebra expressions must be created with the aim of meeting the following requirements:

A) Obtain all vehicles that have never been rented to any customer;

veiculo - (veiculo ⨝ aluga)

B) Find customers who rented a specific vehicle, identified by the license plate;

cliente ⨝ (σ(placa = 'TWI1CE12', veiculo) ⨝ aluga)

C) Obtain customers who rented vehicles, along with information about the rented vehicle, such as license plate, model and manufacturer.

(cliente ⨝ aluga) ⨝ veiculo
