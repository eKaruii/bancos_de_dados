create database if not exists hospital;

use hospital;

create table if not exists cargo( 
id_cargo int primary key,
nome varchar(45) not null
);

create table if not exists riscos_ocupacionais(
id_riscos int(11) primary key,
nome varchar(45) not null
);
 
 create table if not exists resultados_exames(
 id_tipo_resultado_exames int(11) primary key,
 tipo varchar(30) not null
 );
 
 create table if not exists tipo_exames(
 id_tipo_exames int(11) primary key,
 tipo varchar(50) not null
 );
 
  create table if not exists medico(
 id_medico int(11) primary key,
 crm int(11) not null,
 nome varchar(100) not null,
 cpf varchar(20) not null,
 especialidade varchar(30) not null,
 data_nascimento date not null,
 endereco varchar(200) not null,
 telefone varchar(20)
 );
 
  create table if not exists atestado(
 id_atestado int(11) primary key,
 resultado_riscos varchar(100) not null,
 resultado varchar(100) not null,
 observações varchar(300) not null,
 -- FK
 id_medico int(11) not null,
 constraint id_medico foreign key(id_medico) references medico(id_medico)
 );
 
create table if not exists exames(
 id_exames int(11) primary key,
 especialidade varchar(50) not null,
 data_realização date not null,
 -- FK
 tipo_exame_id_tipo_exames int(11) not null,
 resultado_exames_id_tipo_resultado_exames int(11) not null,
 constraint tipo_exame foreign key(tipo_exame_id_tipo_exames) references tipo_exames(id_tipo_exames),
 constraint resultado_exame foreign key(resultado_exames_id_tipo_resultado_exames) references resultados_exames(id_tipo_resultado_exames)
 );
 
  create table if not exists empresa(
 id_empresa int(11) primary key,
 cnpj varchar(20) not null,
 nome_fantasia varchar(50) not null,
 endereco varchar(200) not null,
 telefone varchar(20) not null,
 -- FK
 empresa_id_empresa int(11) not null,
 constraint empresa_id foreign key(empresa_id_empresa) references empresa(id_empresa)
 );
 
 create table if not exists funcionario( 
id_funcionario int(11) primary key,
nome varchar(100) not null,
cpf varchar(20) not null,
data_nascimento date not null,
endereço varchar(200) not null,
telefone varchar(20) not null,
-- FK
cargo_id_cargo int(11) not null,
empresa_id_empresa int(11) not null,
constraint cargo_id foreign key(cargo_id_cargo) references cargo(id_cargo),
constraint empresa_id2 foreign key(empresa_id_empresa) references empresa(id_empresa)
);

CREATE TABLE IF NOT EXISTS empresa_has_exame(
exame_id_exame int(15),
empresa_id_empresa INT(11),
PRIMARY KEY(exame_id_exame,empresa_id_empresa), -- CHAVE PRIMÁRIA COMPOSTA
-- CHAVES ESTRANGEIRAS
CONSTRAINT exame_id FOREIGN KEY(exame_id_exame) REFERENCES exames(id_exames),
CONSTRAINT empresa_id3 FOREIGN KEY(empresa_id_empresa) REFERENCES empresa(id_empresa)
);

CREATE TABLE IF NOT EXISTS funcionario_has_exame(
exame_id_exame int(11),
funcionario_id_funcionario INT(11),
PRIMARY KEY(exame_id_exame,funcionario_id_funcionario), -- CHAVE PRIMÁRIA COMPOSTA
-- CHAVES ESTRANGEIRAS
CONSTRAINT exame_id2 FOREIGN KEY(exame_id_exame) REFERENCES exames(id_exames),
CONSTRAINT funcionario_id FOREIGN KEY(funcionario_id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE IF NOT EXISTS exame_has_atestado(
exame_id_exame int(15),
atestado_id_atestado INT(11),
PRIMARY KEY(exame_id_exame,atestado_id_atestado), -- CHAVE PRIMÁRIA COMPOSTA
-- CHAVES ESTRANGEIRAS
CONSTRAINT exame_id3 FOREIGN KEY(exame_id_exame) REFERENCES exames(id_exames),
CONSTRAINT atestado_id FOREIGN KEY(atestado_id_atestado) REFERENCES atestado(id_atestado)
);

CREATE TABLE IF NOT EXISTS cargos_has_riscos_ocupacionais(
cargo_id_cargo int(15),
risco_ocupacionais_id_risco INT(11),
PRIMARY KEY(cargo_id_cargo,risco_ocupacionais_id_risco), -- CHAVE PRIMÁRIA COMPOSTA
-- CHAVES ESTRANGEIRAS
CONSTRAINT cargo_id2 FOREIGN KEY(cargo_id_cargo) REFERENCES cargo(id_cargo),
CONSTRAINT risco_id FOREIGN KEY(risco_ocupacionais_id_risco) REFERENCES riscos_ocupacionais(id_riscos)
);
 
 
