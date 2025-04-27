create database fumble;

use fumble;

create table times(
id     int primary key auto_increment,
nome   varchar(30) not null,
apelido  varchar(30),
estado   varchar(30)
);

create table usuarios(
id    int primary key auto_increment,
email varchar(60) not null unique,
senha varchar(200),
time  int,
constraint fk_time foreign key (time) references times(id)
);

INSERT INTO times (nome, apelido, estado) VALUES
('Arizona Cardinals', 'Cardinals', 'Arizona'),
('Atlanta Falcons', 'Falcons', 'Georgia'),
('Baltimore Ravens', 'Ravens', 'Maryland'),
('Buffalo Bills', 'Bills', 'New York'),
('Carolina Panthers', 'Panthers', 'North Carolina'),
('Chicago Bears', 'Bears', 'Illinois'),
('Cincinnati Bengals', 'Bengals', 'Ohio'),
('Cleveland Browns', 'Browns', 'Ohio'),
('Dallas Cowboys', 'Cowboys', 'Texas'),
('Denver Broncos', 'Broncos', 'Colorado'),
('Detroit Lions', 'Lions', 'Michigan'),
('Green Bay Packers', 'Packers', 'Wisconsin'),
('Houston Texans', 'Texans', 'Texas'),
('Indianapolis Colts', 'Colts', 'Indiana'),
('Jacksonville Jaguars', 'Jaguars', 'Florida'),
('Kansas City Chiefs', 'Chiefs', 'Missouri'),
('Las Vegas Raiders', 'Raiders', 'Nevada'),
('Los Angeles Chargers', 'Chargers', 'California'),
('Los Angeles Rams', 'Rams', 'California'),
('Miami Dolphins', 'Dolphins', 'Florida'),
('Minnesota Vikings', 'Vikings', 'Minnesota'),
('New England Patriots', 'Patriots', 'Massachusetts'),
('New Orleans Saints', 'Saints', 'Louisiana'),
('New York Giants', 'Giants', 'New York'),
('New York Jets', 'Jets', 'New York'),
('Philadelphia Eagles', 'Eagles', 'Pennsylvania'),
('Pittsburgh Steelers', 'Steelers', 'Pennsylvania'),
('San Francisco 49ers', '49ers', 'California'),
('Seattle Seahawks', 'Seahawks', 'Washington'),
('Tampa Bay Buccaneers', 'Buccaneers', 'Florida'),
('Tennessee Titans', 'Titans', 'Tennessee'),
('Washington Commanders', 'Commanders', 'Washington D.C.');


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