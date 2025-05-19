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
('chris.godwin@example.com', 'Chris Godwin', '123456');

-- Inserindo favoritos 
INSERT INTO favoritar (fk_usuario, fk_time) VALUES
(1, 3),   
(1, 30),  
(2, 14),  
(2, 17), 
(3, 6),  
(3, 7),  
(4, 24),  
(4, 19),  
(5, 19),  
(5, 20),  
(6, 5),   
(6, 2),   
(7, 1),   
(7, 4),  
(8, 30),  
(8, 29),  
(9, 20),  
(9, 2),   
(10, 8),  
(10, 6),  
(11, 14), 
(11, 15), 
(12, 29), 
(12, 30), 
(13, 32), 
(13, 28), 
(14, 11), 
(14, 3),  
(15, 28), 
(15, 30); 

select u.*, t.* from usuarios u 
inner join favoritar on u.id = fk_usuario
inner join times t on t.id = fk_time;
