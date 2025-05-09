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
email varchar(60) not null unique,
senha varchar(200),
time  int,
constraint fk_time foreign key (time) references times(id)
);

INSERT INTO conferencia (conferencia, sigla) VALUES
('Conferência Americana de Futebol', 'AFC'),
('Conferência Nacional de Futebol', 'NFC');


INSERT INTO divisao (divisao, sigla, fk_conferencia) VALUES
('Divisão Leste da AFC', 'AFCE', 1),
('Divisão Norte da AFC', 'AFCN', 1),
('Divisão Sul da AFC', 'AFCS', 1),
('Divisão Oeste da AFC', 'AFCW', 1),
('Divisão Leste da NFC', 'NFCE', 2),
('Divisão Norte da NFC', 'NFCN', 2),
('Divisão Sul da NFC', 'NFCS', 2),
('Divisão Oeste da NFC', 'NFCW', 2);


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

INSERT INTO usuarios (email, senha, time) VALUES
('tom.brady@example.com', '123456', 31),
('patrick.mahomes@example.com', '123456', 17),
('joe.burrow@example.com', '123456', 7), 
('justin.jefferson@example.com', '123456', 21), 
('jalen.hurts@example.com', '123456', 27), 
('lamar.jackson@example.com', '123456', 3),
('josh.allen@example.com', '123456', 4), 
('aaron.donald@example.com', '123456', 19), 
('tyreek.hill@example.com', '123456', 20),
('miles.garrett@example.com', '123456', 8), 
('davante.adams@example.com', '123456', 17), 
('cooper.kupp@example.com', '123456', 19), 
('dk.metcalf@example.com', '123456', 29), 
('trevor.lawrence@example.com', '123456', 15), 
('nick.bosa@example.com', '123456', 28),
('micah.parsons@example.com', '123456', 9),
('derrick.henry@example.com', '123456', 32), 
('deebo.samuels@example.com', '123456', 28),
('kirk.cousins@example.com', '123456', 21),
('chris.godwin@example.com', '123456', 31);