create database fumble;

use fumble;

create table conferencia(
id int primary key auto_increment,
conferencia varchar(60) not null unique,
sigla char(3)
);

create table divisao(
id int primary key auto_increment,
divisao varchar(60) not null unique,
sigla char(4),
fk_conferencia int,
constraint fk_conferencia foreign key (fk_conferencia) references conferencia(id)
);

create table times(
id     int primary key auto_increment,
nome   varchar(30) not null,
apelido  varchar(30),
estado   varchar(30),
fk_divisao int,
constraint fk_divisao foreign key (fk_divisao) references divisao(id)
);

create table usuarios(
id    int primary key auto_increment,
email varchar(100) not null unique,
nome varchar(50) not null,
senha varchar(200)
);

create table favoritar(
fk_time int,
fk_usuario int,
primary key (fk_time, fk_usuario),
constraint fk_time foreign key (fk_time) references times(id),
constraint fk_usuario foreign key (fk_usuario) references usuarios(id)
);

-- Inserindo conferências
INSERT INTO conferencia (conferencia, sigla) VALUES
('Conferência Americana de Futebol', 'AFC'),
('Conferência Nacional de Futebol', 'NFC');

-- Inserindo divisões
INSERT INTO divisao (divisao, sigla, fk_conferencia) VALUES
('Divisão Leste da AFC', 'AFCE', 1),
('Divisão Norte da AFC', 'AFCN', 1),
('Divisão Sul da AFC', 'AFCS', 1),
('Divisão Oeste da AFC', 'AFCW', 1),
('Divisão Leste da NFC', 'NFCE', 2),
('Divisão Norte da NFC', 'NFCN', 2),
('Divisão Sul da NFC', 'NFCS', 2),
('Divisão Oeste da NFC', 'NFCW', 2);

-- Inserindo times
INSERT INTO times (nome, apelido, estado, fk_divisao) VALUES
('Buffalo Bills', 'Bills', 'Nova York', 1),
('Miami Dolphins', 'Dolphins', 'Flórida', 1),
('New England Patriots', 'Patriots', 'Massachusetts', 1),
('New York Jets', 'Jets', 'Nova York', 1),
('Baltimore Ravens', 'Ravens', 'Maryland', 2),
('Cincinnati Bengals', 'Bengals', 'Ohio', 2),
('Cleveland Browns', 'Browns', 'Ohio', 2),
('Pittsburgh Steelers', 'Steelers', 'Pensilvânia', 2),
('Houston Texans', 'Texans', 'Texas', 3),
('Indianapolis Colts', 'Colts', 'Indiana', 3),
('Jacksonville Jaguars', 'Jaguars', 'Flórida', 3),
('Tennessee Titans', 'Titans', 'Tennessee', 3),
('Denver Broncos', 'Broncos', 'Colorado', 4),
('Kansas City Chiefs', 'Chiefs', 'Missouri', 4),
('Las Vegas Raiders', 'Raiders', 'Nevada', 4),
('Los Angeles Chargers', 'Chargers', 'Califórnia', 4),
('Dallas Cowboys', 'Cowboys', 'Texas', 5),
('New York Giants', 'Giants', 'Nova York', 5),
('Philadelphia Eagles', 'Eagles', 'Pensilvânia', 5),
('Washington Commanders', 'Commanders', 'D.C.', 5),
('Chicago Bears', 'Bears', 'Illinois', 6),
('Detroit Lions', 'Lions', 'Michigan', 6),
('Green Bay Packers', 'Packers', 'Wisconsin', 6),
('Minnesota Vikings', 'Vikings', 'Minnesota', 6),
('Atlanta Falcons', 'Falcons', 'Geórgia', 7),
('Carolina Panthers', 'Panthers', 'Carolina do Norte', 7),
('New Orleans Saints', 'Saints', 'Louisiana', 7),
('Tampa Bay Buccaneers', 'Buccaneers', 'Flórida', 7),
('Arizona Cardinals', 'Cardinals', 'Arizona', 8),
('Los Angeles Rams', 'Rams', 'Califórnia', 8),
('San Francisco 49ers', '49ers', 'Califórnia', 8),
('Seattle Seahawks', 'Seahawks', 'Washington', 8);

-- Inserindo usuários 
INSERT INTO usuarios (email, nome, senha) VALUES
('renan@gmail.com', 'Renan', '123'),
('tom.brady@example.com', 'Tom Brady', '123456'),
('patrick.mahomes@example.com', 'Patrick Mahomes', '123456'),
('joe.burrow@example.com', 'Joe Burrow', '123456'),
('justin.jefferson@example.com', 'Justin Jefferson', '123456'),
('jalen.hurts@example.com', 'Jalen Hurts', '123456'),
('lamar.jackson@example.com', 'Lamar Jackson', '123456'),
('josh.allen@example.com', 'Josh Allen', '123456'),
('aaron.donald@example.com', 'Aaron Donald', '123456'),
('tyreek.hill@example.com', 'Tyreek Hill', '123456'),
('miles.garrett@example.com', 'Myles Garrett', '123456'),
('davante.adams@example.com', 'Davante Adams', '123456'),
('cooper.kupp@example.com', 'Cooper Kupp', '123456'),
('dk.metcalf@example.com', 'DK Metcalf', '123456'),
('trevor.lawrence@example.com', 'Trevor Lawrence', '123456'),
('nick.bosa@example.com', 'Nick Bosa', '123456'),
('micah.parsons@example.com', 'Micah Parsons', '123456'),
('derrick.henry@example.com', 'Derrick Henry', '123456'),
('deebo.samuels@example.com', 'Deebo Samuel', '123456'),
('kirk.cousins@example.com', 'Kirk Cousins', '123456'),
('chris.godwin@example.com', 'Chris Godwin', '123456'),
('ricardo@gmail.com', 'Ricardo', '123'),
('ricardinho@gmail.com', 'Ricardinho', '123'),
('renata@gmail.com', 'Renata', '123'),
('anna@gmail.com', 'Anna', '123');

-- Inserindo favoritos 
INSERT INTO favoritar (fk_usuario, fk_time) VALUES
(9,8),(9,14),(9,24),
(25,12),(25,16),(25,17),(25,2),(25,28),
(21,11),(21,18),
(13,9),(13,15),(13,26),
(12,9),(12,15),(12,26),
(19,1),(19,17),(19,29),
(18,1),(18,16),(18,29),
(14,9),(14,15),(14,27),
(6,6),(6,13),(6,23),
(4,4),(4,13),(4,22),
(8,8),(8,14),(8,24),
(5,5),(5,13),(5,22),
(20,11),(20,17),
(7,7),(7,14),(7,23),
(17,1),(17,16),(17,28),
(11,8),(11,14),(11,25),
(16,1),(16,15),(16,28),
(3,3),(3,13),(3,21),
(1,1),(1,12),(1,2),(1,28),
(24,12),(24,19),
(23,11),(23,19),(23,28),
(22,11),(22,18),(22,28),
(2,2),(2,12),(2,21),
(15,9),(15,15),(15,27),
(10,8),(10,14),(10,25);

select * from usuarios;


select fk_usuario, fk_time  from usuarios u 
inner join favoritar on u.id = fk_usuario
inner join times t on t.id = fk_time;

SELECT 
    (SELECT COUNT(f1.fk_time) FROM favoritar f1) / 
    (SELECT COUNT(DISTINCT f2.fk_usuario) FROM favoritar f2 WHERE (SELECT COUNT(*) FROM favoritar) > 0) AS media
FROM favoritar
LIMIT 1;

select count(f.fk_time) / count(distinct f.fk_usuario) as media_favoritos_por_usuario
from favoritar f;