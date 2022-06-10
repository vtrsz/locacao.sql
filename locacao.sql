/*
    ALUNO: VITOR SOUZA RIBEIRO
    MATRICULA: 01500227
*/

DROP DATABASE IF EXISTS `locacao`;
CREATE DATABASE IF NOT EXISTS `locacao` /*!40100 COLLATE 'utf8mb4_general_ci' */;
USE `locacao`;

CREATE TABLE IF NOT EXISTS `clientes`(
    `id` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `cpf` varchar(11) NOT NULL,
    `nome` varchar(255) NOT NULL,
    `data_nasc` date NOT NULL,
    `telefone` varchar(15) NOT NULL,
    `email` varchar(255) NOT NULL,
    `total_pagar` double(16, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS `veiculos`(
    `placa` char(7) PRIMARY KEY NOT NULL,
    `marca` varchar(64) NOT NULL,
    `modelo` varchar(64) NOT NULL,
    `ano` int(4) NOT NULL,
    `cor` varchar(24) NOT NULL,
    `chassi` char(17) NOT NULL
);

CREATE TABLE IF NOT EXISTS `funcionarios`(
    `id` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `cpf` varchar(11) NOT NULL,
    `nome` varchar(255) NOT NULL,
    `salario` double(16, 2) NOT NULL,
    `data_nasc` date NOT NULL
);

CREATE TABLE IF NOT EXISTS `movimento`(
    `id` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `custo_aluguel` double(16, 2) NOT NULL,
    `data_retirada` date NOT NULL,
    `data_devolucao` date NOT NULL,
    `fk_veiculos_placa` char(7) NOT NULL,
    `fk_clientes_id` int NOT NULL,
    FOREIGN KEY (`fk_veiculos_placa`) REFERENCES `veiculos`(`placa`),
    FOREIGN KEY (`fk_clientes_id`) REFERENCES `clientes`(`id`)
);

CREATE TABLE IF NOT EXISTS `oficina`(
    `id` int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `data_lavagem` date NOT NULL,
    `data_manutencao` date NOT NULL,
    `relatorio_manutencao` varchar(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS `atende`(
    `fk_oficina_id` int NOT NULL,
    `fk_veiculos_placa` char(7) NOT NULL,
    FOREIGN KEY (`fk_oficina_id`) REFERENCES `oficina`(`id`),
    FOREIGN KEY (`fk_veiculos_placa`) REFERENCES `veiculos`(`placa`)
);


INSERT INTO `clientes`  (`cpf`, `nome`, `data_nasc`, `telefone`, `email`, `total_pagar`) 
VALUES  ('88245805130', 'Henry Leandro Cardoso', '1990-02-21', '5592993884907', 'hnryleandro@imagine.com', '6500'),
        ('66758983374', 'Thiago Caleb da Silva', '1962-12-27', '5569991343610', 'thiago-csilv@newthings.com.br', '1259'),
        ('48789173260', 'Heloise Priscila Raquel Barros', '1994-04-15', '5559628552724', 'helopriscilabarros@infranet.com', '700'),
        ('95072420310', 'Olivia Daiane Peixoto', '1975-09-13', '5596992718008', 'olivia-peixoto@amazingmail.com', '2700'),
        ('27357111881', 'Daniel Ricardo Pinto', '1989-07-16', '5562982443633', 'danielfromnarnia@googmail.com', '4100');

INSERT INTO `veiculos`  (`placa`, `marca`, `modelo`, `ano`, `cor`, `chassi`)
VALUES  ('JFP9825', 'Acura', 'NSX 3.0', '1991', 'Preto', '03711714474177040'),
        ('LIQ2648', 'Troller', 'PANTANAL 3.0', '2006', 'Vermelho', '09333306781975500'),
        ('JNW7094', 'Nissan', 'MARCH SV 1.6', '2017', 'Amarelo', '03408883615964736'),
        ('HQB4073', 'BMW', '328iA M Sport 2.0', '2015', 'Azul', '18672085935626914'),
        ('KDD3925', 'Toyota', 'Corolla GLi 1.8', '2017', 'Branco', '00539709922457740');

INSERT INTO `funcionarios` (`cpf`, `nome`, `salario`, `data_nasc`)
VALUES  ('24027819047', 'Arthur Kaique Gonçalves', '2600', '1990-07-22'),
        ('30224136020', 'Helena Mariane Josefa Assis', '2600', '1987-01-05'),
        ('52581764015', 'Danilo Cauã Lopes', '5000', '1976-06-10'),
        ('18441226032', 'Elias Bryan Ferreira', '1700', '2000-04-16'),
        ('87773294062', 'Pietro João Santos', '3100', '1986-05-17');

INSERT INTO `movimento` (`custo_aluguel`, `data_retirada`, `data_devolucao`, `fk_veiculos_placa`, `fk_clientes_id`)
VALUES  ('6500', '2022-04-21', '2022-04-28', 'JFP9825', '1'),
        ('1259', '2022-04-23', '2022-04-30', 'LIQ2648', '2'),
        ('700', '2022-03-04', '2022-03-05', 'JNW7094', '3'),
        ('4100', '2022-05-01', '2022-05-10', 'HQB4073', '4'),
        ('2700', '2018-01-01', '2018-01-02', 'KDD3925', '5');

INSERT INTO `oficina` (`data_lavagem`, `data_manutencao`, `relatorio_manutencao`)
VALUES  ('2022-03-01', '2022-03-02', 'Troca de óleo e revisão no motor, tudo OK.'),
        ('2022-01-14', '2022-01-17', 'Parachoque refeito e revisão de rotina.'),
        ('2022-03-01', '2022-03-02', 'Troca de freios e fluidos.'),
        ('2022-02-07', '2022-02-25', 'Revisão geral e pintura.'),
        ('2022-04-12', '2022-04-27', 'Troca de faróis e pintura');

INSERT INTO `atende` (`fk_oficina_id`, `fk_veiculos_placa`)
VALUES  ('1', 'JFP9825'),
        ('2', 'LIQ2648'),
        ('3', 'JNW7094'),
        ('4', 'HQB4073'),
        ('5', 'KDD3925');

USE mysql;
DROP USER IF EXISTS `arthur_kaique`@'localhost';
CREATE USER IF NOT EXISTS `arthur_kaique`@'localhost' IDENTIFIED BY 'mypassissafe123';
DROP USER IF EXISTS `helena_mariane`@'localhost';
CREATE USER IF NOT EXISTS `helena_mariane`@'localhost' IDENTIFIED BY 'mom999143';
DROP USER IF EXISTS `danilo_lopes`@'localhost';
CREATE USER IF NOT EXISTS `danilo_lopes`@'localhost' IDENTIFIED BY '!@#asisamaz';
DROP USER IF EXISTS `elias_bryan`@'localhost';
CREATE USER IF NOT EXISTS `elias_bryan`@'localhost' IDENTIFIED BY 'eliasisagoodboy124';
DROP USER IF EXISTS `pietro_santos`@'localhost';
CREATE USER IF NOT EXISTS `pietro_santos`@'localhost' IDENTIFIED BY 'iloveworkwithcars999';

GRANT ALL PRIVILEGES ON locacao.* TO 'arthur_kaique'@'localhost';
GRANT INSERT ON locacao.movimento TO 'helena_mariane'@'localhost';
GRANT SELECT ON locacao.movimento TO 'helena_mariane'@'localhost';
GRANT UPDATE ON locacao.movimento TO 'helena_mariane'@'localhost';
GRANT INSERT ON locacao.* TO 'danilo_lopes'@'localhost';
GRANT SELECT ON locacao.* TO 'danilo_lopes'@'localhost';
GRANT UPDATE ON locacao.* TO 'danilo_lopes'@'localhost';
GRANT SELECT ON locacao.clientes TO 'elias_bryan'@'localhost';
GRANT INSERT ON locacao.clientes TO 'elias_bryan'@'localhost';
GRANT UPDATE ON locacao.clientes TO 'elias_bryan'@'localhost';
GRANT INSERT ON locacao.oficina TO 'pietro_santos'@'localhost';
GRANT SELECT ON locacao.oficina TO 'pietro_santos'@'localhost';
GRANT UPDATE ON locacao.oficina TO 'pietro_santos'@'localhost';
FLUSH PRIVILEGES;