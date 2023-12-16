create database bd_Hander;

use bd_Hander;



create table tb_usuarios (
  id_usuario int primary key auto_increment,
  foto_perfil varchar(255),
  nome varchar(15),
  sobrenome varchar(100),
  numero_celular char(11),
  cpf char(11),
  data_nascimento date,
  data_criacao timestamp,
  ativo bool,
  email varchar(60),
  senha varchar(40)
);




create table tb_categorias (
  id_categoria int primary key auto_increment,
  nome_categoria varchar(50),
  descricao_categoria text,
  ativo bool
);

create table tb_contas_bancarias (
  id_conta_bancaria int primary key auto_increment,
  numero_conta int,
  cpf char(11),
  agencia int,
  codigo_banco int,
  nome_titular varchar(50)
);

create table tb_documentacao (
  id_documentacao int primary key auto_increment,
  cpf char(11),
  rg varchar(20),
  nome_pai varchar(120),
  nome_mae varchar(120),
  orgao_expedidor varchar(5),
  estado_emissor char(2),
  data_emissao date
);



create table tb_profissionais(
  id_profissional int primary key auto_increment,
  documentacao_id int,
    foreign key (documentacao_id) references tb_documentacao(id_documentacao),
  categoria_id int,
  foreign key (categoria_id) references tb_categorias(id_categoria),
  nome varchar(15),
  sobrenome varchar(100),
  cpf char(11),
	conta_bancaria_id int,
  foreign key (conta_bancaria_id) references tb_contas_bancarias(id_conta_bancaria),
  servico varchar(50),
  descricao_servico text,
  numero_celular char(11),
  data_nascimento date,
  data_criacao timestamp,
  qtd_servicos_realizado int,
  ativo bool,
  email varchar(60),
  senha varchar(40),
  status bool
);



create table tb_Mensagem(
  id_mensagem int primary key auto_increment,
  usuario_id int ,
  foreign key (usuario_id) references tb_usuarios(id_usuario),
  profissional_id int,
  foreign key (profissional_id) references tb_profissionais(id_profissional),
  mensagem text ,
  data datetime
);

 create table tb_Imagens_Mensagem(
   id_imagem int primary key auto_increment,
   mensagem_id int,
   foreign key (mensagem_id) references tb_Mensagem(id_mensagem),
   url_imagem varchar(255),
   data datetime
);


create table tb_enderecos(
  id_endereco int primary key auto_increment,
  id_usuario INT,
  id_profissional INT,
  foreign key (id_usuario) references tb_usuarios(id_usuario),
  foreign key (id_profissional) references tb_profissionais(id_profissional),
  cep char(8),
  estado char(2),
  cidade varchar(30),
  logradouro varchar(100),
  numero int,
  comp varchar(100),
  ativo bool
);

create table tb_cartoes (
  id_cartao int primary key auto_increment,
  usuario_id int,
  foreign key (usuario_id) references tb_usuarios(id_usuario),
  numero_cartao char(16),
  cvv char(3),
  validade char(6),
  cpf char(11),
  nome_usuario varchar(140),
  ativo bool
);

create table fotos_perfil (
  id_foto_perfil int primary key auto_increment,
  profissional_id int,
   foreign key (profissional_id) references tb_profissionais(id_profissional),
  url_foto varchar(255),
  data_post datetime 
);





INSERT INTO tb_usuarios (foto_perfil, nome, sobrenome, numero_celular, cpf, data_nascimento, data_criacao, ativo, email, senha) VALUES 
('foto1.png', 'João', 'da Silva', '11987654321', '12345678901', '1990-05-15', '2023-12-05 14:35:00', true, 'joao.silva@email.com', 'Senha123'),
('foto2.png', 'Maria', 'dos Santos', '21987654321', '98765432109', '1985-08-22', '2023-12-05 14:40:00', true, 'maria.santos@email.com', 'Senha456'),
('foto3.png', 'Carlos', 'Oliveira Silva', '11999887766', '11223344556', '1998-02-10', '2023-12-05 14:45:00', true, 'carlos.oliveira@email.com', 'Senha789'),
('foto4.png', 'Ana', 'Pereira Oliveira', '11998765432', '99887766554', '1980-11-30', '2023-12-05 14:50:00', true, 'ana.pereira@email.com', 'SenhaABC'),
('foto5.png', 'Gabriel', 'Gomes Silva', '11976543210', '76543210987', '1995-07-18', '2023-12-05 14:55:00', true, 'gabriel.gomes@email.com', 'SenhaXYZ'),
('foto6.png', 'Amanda', 'Fernandes Oliveira', '21987654321', '54321098765', '1992-04-03', '2023-12-05 15:00:00', true, 'amanda.fernandes@email.com', 'Senha123');

INSERT INTO tb_usuarios (foto_perfil, nome, sobrenome, numero_celular, cpf, data_nascimento, data_criacao, ativo, email, senha) VALUES 
('foto7.png', 'Laura', 'Almeida Pereira', '11987651234', '12345678912', '1993-09-28', '2023-12-05 15:05:00', true, 'laura.almeida@email.com', 'Senha456'),
('foto8.png', 'Rodrigo', 'Cavalcanti Santos', '21987652345', '98765432121', '1987-12-15', '2023-12-05 15:10:00', true, 'rodrigo.cavalcanti@email.com', 'Senha789'),
('foto9.png', 'Juliana', 'Ferreira Lima', '11999887654', '11223344567', '1990-03-07', '2023-12-05 15:15:00', true, 'juliana.ferreira@email.com', 'SenhaABC'),
('foto10.png', 'Fernando', 'Oliveira da Costa', '11998761122', '99887766543', '1984-06-12', '2023-12-05 15:20:00', true, 'fernando.oliveira@email.com', 'SenhaXYZ'),
('foto11.png', 'Camila', 'Silveira Rocha', '11976547788', '76543210998', '1997-01-23', '2023-12-05 15:25:00', true, 'camila.silveira@email.com', 'Senha123'),
('foto12.png', 'Lucas', 'Mendonça Santos', '21987658899', '54321098776', '1991-08-05', '2023-12-05 15:30:00', true, 'lucas.mendonca@email.com', 'Senha456');

INSERT INTO tb_usuarios (foto_perfil, nome, sobrenome, numero_celular, cpf, data_nascimento, data_criacao, ativo, email, senha) VALUES 
('foto13.png', 'Eduardo', 'Moraes Oliveira', '11987654432', '87654321098', '1996-03-19', '2023-12-06 10:15:00', true, 'eduardo.moraes@email.com', 'Senha789'),
('foto14.png', 'Patrícia', 'Fernandes Souza', '21987655555', '65432109876', '1988-11-07', '2023-12-06 10:30:00', true, 'patricia.fernandes@email.com', 'SenhaABC'),
('foto15.png', 'Ricardo', 'Silva Costa', '11999887777', '32109876543', '1994-05-24', '2023-12-06 10:45:00', true, 'ricardo.silva@email.com', 'SenhaXYZ'),
('foto16.png', 'Aline', 'Santos Pereira', '11998766666', '54321098765', '1990-09-15', '2023-12-06 11:00:00', true, 'aline.santos@email.com', 'Senha123'),
('foto17.png', 'Mateus', 'Pereira Lima', '21987651111', '98765432100', '1982-02-01', '2023-12-06 11:15:00', true, 'mateus.pereira@email.com', 'Senha456');

INSERT INTO tb_usuarios (foto_perfil, nome, sobrenome, numero_celular, cpf, data_nascimento, data_criacao, ativo, email, senha) VALUES 
('foto18.png', 'Beatriz', 'Sousa Lima', '11987652211', '87654321000', '1998-07-12', '2023-12-06 11:30:00', true, 'beatriz.sousa@email.com', 'Senha789'),
('foto19.png', 'Pedro', 'Martins Costa', '21987653322', '65432109800', '1991-04-05', '2023-12-06 11:45:00', true, 'pedro.martins@email.com', 'SenhaABC'),
('foto20.png', 'Gabriela', 'Oliveira Santos', '11999884433', '32109876500', '1985-10-18', '2023-12-06 12:00:00', true, 'gabriela.oliveira@email.com', 'SenhaXYZ'),
('foto21.png', 'Vinícius', 'Pereira Rocha', '11998755544', '54321098700', '1996-01-30', '2023-12-06 12:15:00', true, 'vinicius.pereira@email.com', 'Senha123'),
('foto22.png', 'Renata', 'Fernandes Oliveira', '21987656655', '98765432110', '1980-08-22', '2023-12-06 12:30:00', true, 'renata.fernandes@email.com', 'Senha456');

INSERT INTO tb_usuarios (foto_perfil, nome, sobrenome, numero_celular, cpf, data_nascimento, data_criacao, ativo, email, senha) VALUES 
('foto23.png', 'Rafael', 'Almeida Silva', '11987657766', '12309876500', '1992-03-08', '2023-12-06 12:45:00', true, 'rafael.almeida@email.com', 'Senha789'),
('foto24.png', 'Isabela', 'Cavalcanti Lima', '21987658877', '45698712300', '1987-09-25', '2023-12-06 13:00:00', true, 'isabela.cavalcanti@email.com', 'SenhaABC'),
('foto25.png', 'Felipe', 'Santos Pereira', '11999889988', '78965432100', '1995-12-01', '2023-12-06 13:15:00', true, 'felipe.santos@email.com', 'SenhaXYZ'),
('foto26.png', 'Juliana', 'Oliveira Rocha', '11998751122', '98765432123', '1983-05-14', '2023-12-06 13:30:00', true, 'juliana.oliveira@email.com', 'Senha123'),
('foto27.png', 'Miguel', 'Ferreira Lima', '21987652233', '32198765400', '1998-10-03', '2023-12-06 13:45:00', true, 'miguel.ferreira@email.com', 'Senha456');


INSERT INTO tb_usuarios (foto_perfil, nome, sobrenome, numero_celular, cpf, data_nascimento, data_criacao, ativo, email, senha) VALUES 
('foto28.png', 'Aline', 'Mendes Silva', '11987653344', '65432198700', '1993-08-19', '2023-12-06 14:00:00', true, 'aline.mendes@email.com', 'Senha789'),
('foto29.png', 'Lucas', 'Almeida Santos', '21987654455', '12398765400', '1989-04-12', '2023-12-06 14:15:00', true, 'lucas.almeida@email.com', 'SenhaABC'),
('foto30.png', 'Carolina', 'Cavalcanti Rocha', '11999887722', '78965432110', '1996-01-27', '2023-12-06 14:30:00', true, 'carolina.cavalcanti@email.com', 'SenhaXYZ'),
('foto31.png', 'Thiago', 'Santos Oliveira', '11998755533', '45698712300', '1984-06-05', '2023-12-06 14:45:00', true, 'thiago.santos@email.com', 'Senha123'),
('foto32.png', 'Fernanda', 'Ferreira Lima', '21987656644', '32165498700', '1991-10-18', '2023-12-06 15:00:00', true, 'fernanda.ferreira@email.com', 'Senha456');

INSERT INTO tb_usuarios (foto_perfil, nome, sobrenome, numero_celular, cpf, data_nascimento, data_criacao, ativo, email, senha) VALUES 
('foto33.png', 'Gustavo', 'Oliveira Silva', '11987657799', '12309876501', '1990-02-28', '2023-12-06 15:15:00', true, 'gustavo.oliveira@email.com', 'Senha789'),
('foto34.png', 'Natália', 'Moraes Santos', '21987658800', '45698712301', '1985-11-15', '2023-12-06 15:30:00', true, 'natalia.moraes@email.com', 'SenhaABC'),
('foto35.png', 'Henrique', 'Sousa Lima', '11999889911', '78965432101', '1998-04-03', '2023-12-06 15:45:00', true, 'henrique.sousa@email.com', 'SenhaXYZ'),
('foto36.png', 'Mariana', 'Cavalcanti Rocha', '11998751133', '32198765401', '1993-09-14', '2023-12-06 16:00:00', true, 'mariana.cavalcanti@email.com', 'Senha123'),
('foto37.png', 'Rafaela', 'Almeida Silva', '21987652244', '98765432124', '1980-12-27', '2023-12-06 16:15:00', true, 'rafaela.almeida@email.com', 'Senha456'),
('foto38.png', 'Vinícius', 'Martins Costa', '11987653355', '87654321001', '1991-06-08', '2023-12-06 16:30:00', true, 'vinicius.martins@email.com', 'Senha789'),
('foto39.png', 'Amanda', 'Oliveira Santos', '21987654466', '12309876502', '1996-01-22', '2023-12-06 16:45:00', true, 'amanda.oliveira@email.com', 'SenhaABC'),
('foto40.png', 'Lucas', 'Santos Pereira', '11999887744', '45698712302', '1995-08-13', '2023-12-06 17:00:00', true, 'lucas.santos@email.com', 'SenhaXYZ'),
('foto41.png', 'Carla', 'Cavalcanti Lima', '11998755522', '32198765402', '1987-04-30', '2023-12-06 17:15:00', true, 'carla.cavalcanti@email.com', 'Senha123'),
('foto42.png', 'Thiago', 'Oliveira Rocha', '21987656633', '98765432125', '1992-11-07', '2023-12-06 17:30:00', true, 'thiago.oliveira@email.com', 'Senha456'),
('foto43.png', 'Fernanda', 'Ferreira Lima', '11987657755', '87654321002', '1988-07-18', '2023-12-06 17:45:00', true, 'fernanda.ferreira@email.com', 'Senha789'),
('foto44.png', 'Eduardo', 'Mendes Silva', '21987658822', '12309876503', '1997-03-01', '2023-12-06 18:00:00', true, 'eduardo.mendes@email.com', 'SenhaABC'),
('foto45.png', 'Tatiane', 'Almeida Santos', '11999889933', '45698712303', '1983-10-09', '2023-12-06 18:15:00', true, 'tatiane.almeida@email.com', 'SenhaXYZ'),
('foto46.png', 'André', 'Sousa Lima', '11998751144', '32198765403', '1990-05-26', '2023-12-06 18:30:00', true, 'andre.sousa@email.com', 'Senha123'),
('foto47.png', 'Natália', 'Martins Costa', '21987652255', '98765432126', '1995-02-13', '2023-12-06 18:45:00', true, 'natalia.martins@email.com', 'Senha456'),
('foto48.png', 'Carlos', 'Oliveira Santos', '11987653366', '87654321003', '1981-09-05', '2023-12-06 19:00:00', true, 'carlos.oliveira@email.com', 'Senha789'),
('foto49.png', 'Beatriz', 'Cavalcanti Lima', '21987654477', '12309876504', '1996-12-22', '2023-12-06 19:15:00', true, 'beatriz.cavalcanti@email.com', 'SenhaABC'),
('foto50.png', 'Rafael', 'Oliveira Rocha', '11999887755', '45698712304', '1989-07-09', '2023-12-06 19:30:00', true, 'rafael.oliveira@email.com', 'SenhaXYZ'),
('foto51.png', 'Juliana', 'Santos Pereira', '11998751155', '32198765404', '1992-04-17', '2023-12-06 19:45:00', true, 'juliana.santos@email.com', 'Senha123'),
('foto52.png', 'Vinícius', 'Ferreira Lima', '21987656611', '98765432127', '1985-11-30', '2023-12-06 20:00:00', true, 'vinicius.ferreira@email.com', 'Senha456'),
('foto53.png', 'Mariana', 'Mendes Silva', '11987657788', '87654321004', '1998-08-18', '2023-12-06 20:15:00', true, 'mariana.mendes@email.com', 'Senha789'),
('foto54.png', 'Lucas', 'Almeida Santos', '21987658899', '12309876505', '1993-01-12', '2023-12-06 20:30:00', true, 'lucas.almeida@email.com', 'SenhaABC'),
('foto55.png', 'Carla', 'Cavalcanti Lima', '11999889900', '45698712305', '1987-06-25', '2023-12-06 20:45:00', true, 'carla.cavalcanti@email.com', 'SenhaXYZ'),
('foto56.png', 'Thiago', 'Oliveira Rocha', '11998751166', '32198765405', '1990-03-03', '2023-12-06 21:00:00', true, 'thiago.oliveira@email.com', 'Senha123'),
('foto57.png', 'Fernanda', 'Martins Costa', '21987652277', '98765432128', '1995-10-15', '2023-12-06 21:15:00', true, 'fernanda.martins@email.com', 'Senha456'),
('foto58.png', 'Eduardo', 'Oliveira Santos', '11987653388', '87654321005', '1988-05-28', '2023-12-06 21:30:00', true, 'eduardo.oliveira@email.com', 'Senha789'),
('foto59.png', 'Tatiane', 'Cavalcanti Lima', '11999887700', '12309876506', '1993-12-11', '2023-12-06 21:45:00', true, 'tatiane.cavalcanti@email.com', 'SenhaABC'),
('foto60.png', 'André', 'Oliveira Rocha', '21987654411', '45698712306', '1985-03-26', '2023-12-06 22:00:00', true, 'andre.oliveira@email.com', 'SenhaXYZ');

INSERT INTO tb_usuarios (foto_perfil, nome, sobrenome, numero_celular, cpf, data_nascimento, data_criacao, ativo, email, senha) VALUES 
('foto61.png', 'Laura', 'Almeida Pereira', '11987655566', '12309876507', '1997-06-05', '2023-12-07 10:15:00', false, 'laura.almeida@email.com', 'Senha789'),
('foto62.png', 'Roberto', 'Cavalcanti Santos', '21987656677', '45698712307', '1989-11-18', '2023-12-07 10:30:00', false, 'roberto.cavalcanti@email.com', 'SenhaABC'),
('foto63.png', 'Carolina', 'Ferreira Lima', '11999887788', '78965432107', '1994-04-03', '2023-12-07 10:45:00', false, 'carolina.ferreira@email.com', 'SenhaXYZ'),
('foto64.png', 'José', 'Oliveira Silva', '11998759900', '32198765407', '1982-09-15', '2023-12-07 11:00:00', false, 'jose.oliveira@email.com', 'Senha123'),
('foto65.png', 'Isabela', 'Martins Costa', '21987651011', '98765432129', '1990-01-23', '2023-12-07 11:15:00', false, 'isabela.martins@email.com', 'Senha456'),
('foto66.png', 'Eduardo', 'Mendes Silva', '11987651122', '87654321006', '1995-08-11', '2023-12-07 11:30:00', false, 'eduardo.mendes@email.com', 'Senha789'),
('foto67.png', 'Natália', 'Almeida Santos', '21987652233', '12309876508', '1998-02-27', '2023-12-07 11:45:00', false, 'natalia.almeida@email.com', 'SenhaABC'),
('foto68.png', 'Rafael', 'Cavalcanti Lima', '11999883344', '45698712308', '1984-07-10', '2023-12-07 12:00:00', false, 'rafael.cavalcanti@email.com', 'SenhaXYZ'),
('foto69.png', 'Carla', 'Oliveira Rocha', '11998754455', '32198765408', '1991-03-25', '2023-12-07 12:15:00', false, 'carla.oliveira@email.com', 'Senha123'),
('foto70.png', 'Lucas', 'Ferreira Lima', '21987655566', '98765432130', '1987-10-08', '2023-12-07 12:30:00', false, 'lucas.ferreira@email.com', 'Senha456');


INSERT INTO tb_cartoes (usuario_id, numero_cartao, cvv, validade, cpf, nome_usuario, ativo) VALUES 
(1, 5204710662406369, 844, 062024, 12345678901, 'João da Silva', true),
(2, 4532891444767459, 234, 082025, 98765432109, 'Maria dos Santos', true),
(3, 4716238416793018, 567, 032023, 11223344556, 'Carlos Oliveira Silva', true),
(4, 4485756309362163, 789, 012026, 99887766554, 'Ana Pereira Oliveira', true),
(5, 4024007136374243, 123, 072024, 76543210987, 'Gabriel Gomes Silva', true),
(6, 4556485791477203, 456, 042025, 54321098765, 'Amanda Fernandes Oliveira', true),
(7, 4532015112830366, 321, 112023, 12345678912, 'Laura Almeida Pereira', true),
(8, 4916252320085220, 987, 052024, 98765432121, 'Rodrigo Cavalcanti Santos', true),
(9, 4716833157425743, 654, 092023, 11223344567, 'Juliana Ferreira Lima', true),
(10, 4556634408757638, 876, 012026, 99887766543, 'Fernando Oliveira da Costa', true),
(11, 4024007121240404, 234, 032025, 76543210998, 'Camila Silveira Rocha', true),
(12, 4716857850748948, 567, 072024, 54321098776, 'Lucas Mendonça Santos', true),
(13, 4916253284265694, 456, 062025, 87654321098, 'Eduardo Moraes Oliveira', true),
(14, 4532118833327044, 789, 082024, 65432109876, 'Patrícia Fernandes Souza', true),
(15, 4024007179084347, 321, 112023, 32109876543, 'Ricardo Silva Costa', true),
(16, 4716142515510015, 654, 032024, 54321098765, 'Aline Santos Pereira', true),
(17, 4532723483587449, 987, 012025, 98765432100, 'Mateus Pereira Lima', true),
(18, 4716825055958698, 123, 072024, 87654321000, 'Beatriz Sousa Lima', true),
(19, 4485256391121406, 456, 102025, 65432109800, 'Pedro Martins Costa', true),
(20, 4556603036886790, 789, 012024, 32109876500, 'Gabriela Oliveira Santos', true),
(21, 4916075232958192, 234, 022025, 54321098700, 'Vinícius Pereira Rocha', true),
(22, 4024007117868456, 567, 032024, 98765432110, 'Renata Fernandes Oliveira', true),
(23, 4532131424519802, 567, 082024, 12309876500, 'Rafael Almeida Silva', true),
(24, 4716591680534791, 789, 012025, 45698712300, 'Isabela Cavalcanti Lima', true),
(25, 4556041212299485, 234, 042024, 78965432100, 'Felipe Santos Pereira', true),
(26, 4916427060597936, 876, 052025, 98765432123, 'Juliana Oliveira Rocha', true),
(27, 4024007134275256, 321, 032024, 32198765400, 'Miguel Ferreira Lima', true);


INSERT INTO tb_categorias (nome_categoria, descricao_categoria, ativo) VALUES 
('Encanador', 'Soluções para problemas hidráulicos e instalações.', true),
('Eletricista', 'Instalações e reparos elétricos residenciais e comerciais.', true),
('Pintor', 'Serviço de pintura para ambientes internos e externos.', true),
('Jardineiro', 'Serviços relacionados a jardins e áreas verdes.', true),
('Carpinteiro', 'Trabalhos em madeira, móveis sob medida e reparos.', true);

INSERT INTO tb_documentacao (cpf, rg, nome_pai, nome_mae, orgao_expedidor, estado_emissor, data_emissao) VALUES 
(10703262599, 87592312, 'Carlos Augusto Alves Santos', 'Tatiane Alves Pereira', 'SSP', 'SP', '2018-04-12'),
(20703262588, 7654321, 'Roberto Silva Pereira', 'Mariana Silva Pereira', 'SSP', 'RJ', '2019-05-20'),
(30703262577, 6543210, 'José Fernandes Oliveira', 'Amanda Oliveira Santos', 'SSP', 'SP', '2020-06-18'),
(40703262566, 5432109, 'Rafael Mendes Santos', 'Camila Mendes Santos', 'SSP', 'RJ', '2021-07-25'),
(50703262555, 4321098, 'Bruno Cavalcanti Rocha', 'Ana Cavalcanti Lima', 'SSP', 'SP', '2017-08-30'),
(60703262544, 3210987, 'Lucas Pereira Lima', 'Viviane Pereira Lima', 'SSP', 'RJ', '2016-09-12'),
(70703262533, 2109876, 'Diego Oliveira Silva', 'Aline Oliveira Silva', 'SSP', 'SP', '2015-10-18'),
(80703262522, 1098765, 'Pedro Santos Pereira', 'Isabela Santos Pereira', 'SSP', 'RJ', '2014-11-24'),
(90703262511, 9987654, 'Carlos Cavalcanti Lima', 'Carolina Cavalcanti Lima', 'SSP', 'SP', '2013-12-31'),
(100703262500, 9876543, 'Fernando Mendes Santos', 'Larissa Mendes Lima', 'SSP', 'RJ', '2012-01-07'),
(110703262511, 8765432, 'Gabriel Ferreira Lima', 'Juliana Ferreira Lima', 'SSP', 'SP', '2011-02-13'),
(120703262500, 7654321, 'Roberto Almeida Silva', 'Carolina Almeida Silva', 'SSP', 'RJ', '2010-03-20'),
(130703262511, 6543210, 'Carolina Cavalcanti Rocha', 'Thiago Cavalcanti Rocha', 'SSP', 'SP', '2009-04-26'),
(140703262522, 5432109, 'Thiago Mendes Santos', 'Larissa Mendes Santos', 'SSP', 'RJ', '2008-05-02'),
(150703262533, 4321098, 'Larissa Ferreira Lima', 'Felipe Ferreira Lima', 'SSP', 'SP', '2019-06-08'),
(160703262544, 3210987, 'Renato Oliveira Silva', 'Viviane Oliveira Silva', 'SSP', 'RJ', '2017-07-14'),
(170703262555, 2109876, 'Camilo Santos Pereira', 'Aline Santos Pereira', 'SSP', 'SP', '2016-08-20'),
(180703262566, 1098765, 'Aline Mendes Lima', 'Diego Mendes Lima', 'SSP', 'RJ', '2015-09-26'),
(190703262577, 9987654, 'Felipe Cavalcanti Rocha', 'Carolina Cavalcanti Rocha', 'SSP', 'SP', '2014-10-02'),
(200703262588, 9876543, 'Viviane Ferreira Lima', 'Thiago Ferreira Lima', 'SSP', 'RJ', '2013-11-08'),
(210703262599, 8765432, 'Diego Almeida Silva', 'Carolina Almeida Silva', 'SSP', 'SP', '2012-12-14');


INSERT INTO tb_contas_bancarias (numero_conta, cpf, agencia, codigo_banco, nome_titular) VALUES 
(10824952, 10703262599, 4589, 001, 'Gabriel Augusto Pereira Santos'),
(20824952, 20703262588, 7890, 237, 'Lucas Silva Pereira'),
(30824952, 30703262577, 1234, 341, 'Ana Fernandes Oliveira'),
(40824952, 40703262566, 5678, 748, 'Rafael Mendes Santos'),
(50824952, 50703262555, 9876, 033, 'Mariana Cavalcanti Rocha'),
(60824952, 60703262544, 4321, 104, 'Lucas Pereira Lima'),
(70824952, 70703262533, 8765, 748, 'Diego Oliveira Silva'),
(80824952, 80703262522, 9012, 033, 'Pedro Santos Pereira'),
(90824952, 90703262511, 3456, 237, 'Carlos Cavalcanti Lima'),
(100824952, 100703262500, 7890, 341, 'Fernando Mendes Santos'),
(110824952, 110703262511, 1234, 748, 'Gabriel Ferreira Lima'),
(120824952, 120703262500, 5678, 033, 'Roberto Almeida Silva'),
(130824952, 130703262511, 9876, 104, 'Carolina Cavalcanti Rocha'),
(140824952, 140703262522, 4321, 237, 'Thiago Mendes Santos'),
(150824952, 150703262533, 8765, 341, 'Larissa Ferreira Lima'),
(160824952, 160703262544, 9012, 748, 'Renato Oliveira Silva'),
(170824952, 170703262555, 3456, 033, 'Camilo Santos Pereira'),
(180824952, 180703262566, 7890, 237, 'Aline Mendes Lima'),
(190824952, 190703262577, 1234, 341, 'Felipe Cavalcanti Rocha'),
(200824952, 200703262588, 5678, 104, 'Viviane Ferreira Lima'),
(210824952, 210703262599, 9876, 748, 'Diego Almeida Silva');

INSERT INTO tb_profissionais (documentacao_id, categoria_id, nome, sobrenome, cpf, conta_bancaria_id, servico, descricao_servico, numero_celular, data_nascimento, data_criacao, qtd_servicos_realizado, ativo, email, senha, status) VALUES 
(1, 1, 'Gabriel', 'Augusto Pereira', 10703262599, 1, 'Encanador', 'Sou um ótimo encanador.', '11998817700', '2004-10-25', '2023-12-01 13:49:23', 23, true, 'gabrielgapseu@gmail.com', 'Senha2510', true),
(2, 2, 'Lucas', 'Silva Pereira', 20703262588, 2, 'Eletricista', 'Especialista em instalações elétricas.', '21997718800', '1990-07-15', '2023-12-02 10:30:45', 15, true, 'lucas.silva@gmail.com', 'Senha1234', true),
(3, 3, 'Ana', 'Fernandes Oliveira', 30703262577, 3, 'Pintor', 'Trabalho com pinturas internas e externas.', '11995551111', '1985-05-20', '2023-12-03 11:15:12', 10, false, 'ana.fernandes@gmail.com', 'Senha5678', true),
(4, 5, 'Rafael', 'Mendes Santos', 40703262566, 4, 'Carpinteiro', 'Experiência em trabalhos de carpintaria.', '21996662222', '1992-03-12', '2023-12-04 12:00:37', 7, true, 'rafael.mendes@gmail.com', 'Senha9101', true),
(5, 4, 'Mariana', 'Cavalcanti Rocha', 50703262555, 5, 'Jardineiro', 'Cuido do seu jardim com carinho e dedicação.', '11994443333', '1988-11-05', '2023-12-05 13:45:54', 12, false, 'mariana.cavalcanti@gmail.com', 'Senha1122', true),
(6, 1, 'João', 'Pereira Lima', 60703262544, 6, 'Encanador', 'Soluções rápidas para problemas hidráulicos.', '11993334444', '1995-09-28', '2023-12-06 14:30:21', 18, true, 'joao.pereira@gmail.com', 'Senha3344', true),
(7, 5, 'Camila', 'Oliveira Silva', 70703262533, 7, 'Carpinteiro', 'Trabalhos em madeira de alta qualidade.', '21992225555', '1983-06-18', '2023-12-07 15:15:48', 9, false, 'camila.oliveira@gmail.com', 'Senha5566', true),
(8, 3, 'Pedro', 'Santos Pereira', 80703262522, 8, 'Pintor', 'Transformo ambientes através das cores.', '11991116666', '1998-02-10', '2023-12-08 16:00:15', 14, true, 'pedro.santos@gmail.com', 'Senha7788', true),
(9, 4, 'Isabela', 'Cavalcanti Lima', 90703262511, 9, 'Jardineiro', 'Paisagismo e cuidado com plantas.', '79988177777', '1990-12-02', '2023-12-09 16:45:42', 11, false, 'isabela.cavalcanti@gmail.com', 'Senha9900', true),
(10, 2, 'Fernando', 'Mendes Santos', 100703262500, 10, 'Eletricista', 'Manutenção elétrica residencial e comercial.', '11998818888', '1987-08-22', '2023-12-10 17:30:09', 20, true, 'fernando.mendes@gmail.com', 'Senha0011', true),
(11, 5, 'Juliana', 'Ferreira Lima', 110703262511, 11, 'Carpinteiro', 'Móveis sob medida e reparos em madeira.', '11996661111', '1996-03-07', '2023-12-11 18:15:36', 8, false, 'juliana.ferreira@gmail.com', 'Senha2233', true);

INSERT INTO tb_profissionais (documentacao_id, categoria_id, nome, sobrenome, cpf, conta_bancaria_id, servico, descricao_servico, numero_celular, data_nascimento, data_criacao, qtd_servicos_realizado, ativo, email, senha, status) VALUES 
(12, 3, 'Roberto', 'Almeida Silva', 120703262500, 12, 'Pintor', 'Especialista em pinturas artísticas.', '11998819999', '1993-09-28', '2023-12-12 10:45:00', 14, true, 'roberto.almeida@gmail.com', 'Senha3344', true),
(13, 2, 'Carolina', 'Cavalcanti Rocha', 130703262511, 13, 'Eletricista', 'Instalações e reparos elétricos.', '21996662233', '1990-05-15', '2023-12-13 11:00:00', 17, false, 'carolina.cavalcanti@gmail.com', 'Senha5566', true),
(14, 1, 'Thiago', 'Mendes Santos', 140703262522, 14, 'Encanador', 'Soluções para problemas hidráulicos.', '11995553333', '1988-11-30', '2023-12-14 12:15:00', 9, true, 'thiago.mendes@gmail.com', 'Senha7788', true),
(15, 5, 'Larissa', 'Ferreira Lima', 150703262533, 15, 'Carpinteiro', 'Trabalhos em madeira sob medida.', '21994444444', '1995-07-18', '2023-12-15 13:30:00', 11, false, 'larissa.ferreira@gmail.com', 'Senha9900', true),
(16, 3, 'Renato', 'Oliveira Silva', 160703262544, 16, 'Pintor', 'Transformo ambientes com cores vibrantes.', '11993335555', '1982-09-15', '2023-12-16 14:45:00', 22, true, 'renato.oliveira@gmail.com', 'Senha0011', true),
(17, 4, 'Camilo', 'Santos Pereira', 170703262555, 17, 'Jardineiro', 'Cuidado especial com jardins.', '21992226666', '1996-03-07', '2023-12-17 16:00:00', 13, false, 'camilo.santos@gmail.com', 'Senha2233', true),
(18, 2, 'Aline', 'Mendes Lima', 180703262566, 18, 'Eletricista', 'Manutenção elétrica de qualidade.', '11991117777', '1987-08-22', '2023-12-18 17:15:00', 18, true, 'aline.mendes@gmail.com', 'Senha4455', true),
(19, 5, 'Felipe', 'Cavalcanti Rocha', 190703262577, 19, 'Carpinteiro', 'Móveis artesanais personalizados.', '21990008888', '1992-03-12', '2023-12-19 18:30:00', 8, false, 'felipe.cavalcanti@gmail.com', 'Senha6677', true),
(20, 3, 'Viviane', 'Ferreira Lima', 200703262588, 20, 'Pintor', 'Decoração e pintura residencial.', '11998819999', '1990-12-02', '2023-12-20 19:45:00', 25, true, 'viviane.ferreira@gmail.com', 'Senha8899', true),
(21, 4, 'Diego', 'Almeida Silva', 210703262599, 21, 'Jardineiro', 'Criação e manutenção de jardins.', '21997710000', '1987-05-15', '2023-12-21 21:00:00', 10, false, 'diego.almeida@gmail.com', 'Senha0011', true);



INSERT INTO fotos_perfil (profissional_id, url_foto, data_post) VALUES 
(1, 'https://picsum.photos/200/300?random=1', '2023-12-02 15:23:49'),
(2, 'https://picsum.photos/200/300?random=2', '2023-12-02 15:25:10'),
(3, 'https://picsum.photos/200/300?random=3', '2023-12-02 15:26:35'),
(4, 'https://picsum.photos/200/300?random=4', '2023-12-02 15:28:00'),
(5, 'https://picsum.photos/200/300?random=5', '2023-12-02 15:30:22'),
(6, 'https://picsum.photos/200/300?random=6', '2023-12-02 15:31:47'),
(7, 'https://picsum.photos/200/300?random=7', '2023-12-02 15:33:15'),
(8, 'https://picsum.photos/200/300?random=8', '2023-12-02 15:34:40'),
(9, 'https://picsum.photos/200/300?random=9', '2023-12-02 15:36:05'),
(10, 'https://picsum.photos/200/300?random=10', '2023-12-02 15:37:30'),
(11, 'https://picsum.photos/200/300?random=11', '2023-12-02 15:39:00'),
(12, 'https://picsum.photos/200/300?random=12', '2023-12-02 15:40:25'),
(13, 'https://picsum.photos/200/300?random=13', '2023-12-02 15:41:50'),
(14, 'https://picsum.photos/200/300?random=14', '2023-12-02 15:43:15'),
(15, 'https://picsum.photos/200/300?random=15', '2023-12-02 15:44:40'),
(16, 'https://picsum.photos/200/300?random=16', '2023-12-02 15:46:05'),
(17, 'https://picsum.photos/200/300?random=17', '2023-12-02 15:47:30'),
(18, 'https://picsum.photos/200/300?random=18', '2023-12-02 15:49:00'),
(19, 'https://picsum.photos/200/300?random=19', '2023-12-02 15:50:25'),
(20, 'https://picsum.photos/200/300?random=20', '2023-12-02 15:51:50');

INSERT INTO tb_enderecos (id_usuario, cep, estado, cidade, logradouro, numero, comp, ativo)
VALUES
  (1, '01001000', 'SP', 'São Paulo', 'Avenida Fictícia 1', 123, 'Apto 1', true),
  (2, '20010010', 'RJ', 'Rio de Janeiro', 'Rua Imaginária 2', 456, 'Casa 2', true),
  (3, '04005020', 'SP', 'São Paulo', 'Rua dos Sonhos 3', 789, 'Casa 3', true),
  (4, '22041001', 'RJ', 'Rio de Janeiro', 'Avenida da Ilusão 4', 101, 'Apto 5', true),
  (5, '01123000', 'SP', 'São Paulo', 'Rua dos Desejos 5', 567, 'Apartamento 6', true),
  (6, '08210210', 'SP', 'São Paulo', 'Alameda da Esperança 6', 890, 'Cobertura 7', true),
  (7, '05015010', 'SP', 'São Paulo', 'Praça da Fantasia 8', 111, 'Casa 9', true),
  (8, '21051080', 'RJ', 'Rio de Janeiro', 'Travessa dos Sonhos 10', 222, 'Apto 11', true),
  (9, '03322040', 'SP', 'São Paulo', 'Viela da Imaginação 12', 333, 'Sobrado 13', true),
  (10, '15055320', 'SP', 'São Paulo', 'Passagem dos Anseios 14', 444, 'Apartamento 15', true),
  (11, '04548030', 'SP', 'São Paulo', 'Largo da Utopia 16', 555, 'Casa 17', true),
  (12, '32020440', 'MG', 'Belo Horizonte', 'Avenida dos Ideais 18', 666, 'Apto 19', true),
  (13, '01309000', 'SP', 'São Paulo', 'Travessa dos Sonhos 20', 777, 'Cobertura 21', true),
  (14, '51030300', 'MT', 'Cuiabá', 'Rua dos Devaneios 22', 888, 'Sobrado 23', true),
  (15, '04150020', 'SP', 'São Paulo', 'Praça da Esperança 24', 999, 'Apartamento 25', true),
  (16, '29016008', 'ES', 'Vitória', 'Avenida da Ilusão 26', 1010, 'Casa 27', true),
  (17, '04310100', 'SP', 'São Paulo', 'Largo dos Sonhos 28', 1111, 'Apto 29', true),
  (18, '77021042', 'TO', 'Palmas', 'Rua da Imaginação 30', 1212, 'Casa 31', true),
  (19, '03023000', 'SP', 'São Paulo', 'Alameda das Expectativas 32', 1313, 'Apartamento 33', true),
  (20, '04141020', 'SP', 'São Paulo', 'Avenida da Realidade 34', 2020, 'Apto 21', true),
  (21, '23010010', 'CE', 'Fortaleza', 'Rua das Possibilidades 36', 2121, 'Casa 23', true),
  (22, '60175200', 'CE', 'Fortaleza', 'Alameda da Imaginação 38', 2222, 'Cobertura 25', true),
  (23, '69058215', 'AM', 'Manaus', 'Praça dos Projetos 40', 2323, 'Sobrado 27', true),
  (24, '49072010', 'SE', 'Aracaju', 'Avenida da Concretização 42', 2424, 'Apartamento 29', true),
  (25, '89010500', 'SC', 'Blumenau', 'Rua das Conquistas 44', 2525, 'Casa 31', true),
  (26, '57052090', 'AL', 'Maceió', 'Travessa dos Resultados 46', 2626, 'Apto 33', true),
  (27, '76873240', 'RO', 'Porto Velho', 'Viela da Efetivação 48', 2727, 'Cobertura 35', true),
  (28, '69067456', 'AM', 'Manaus', 'Passagem da Materialização 50', 2828, 'Sobrado 37', true),
  (29, '52041030', 'GO', 'Goiânia', 'Largo das Execuções 52', 2929, 'Apartamento 39', true),
  (30, '78048520', 'MT', 'Cuiabá', 'Rua da Prosperidade 54', 3030, 'Casa 41', true),
  (31, '20020902', 'RJ', 'Rio de Janeiro', 'Alameda da Transformação 56', 3131, 'Apto 43', true),
  (32, '77024224', 'TO', 'Palmas', 'Praça das Realizações 58', 3232, 'Cobertura 45', true),
  (33, '69073140', 'AM', 'Manaus', 'Avenida do Sucesso 60', 3333, 'Sobrado 47', true),
  (34, '70070900', 'DF', 'Brasília', 'Travessa das Metas 62', 3434, 'Apartamento 49', true),
  (35, '71015025', 'DF', 'Brasília', 'Rua das Vitórias 64', 3535, 'Casa 51', true),
  (36, '32123450', 'MG', 'Belo Horizonte', 'Avenida da Finalização 66', 3636, 'Apto 67', true),
  (37, '58010987', 'PB', 'João Pessoa', 'Rua das Completudes 68', 3737, 'Casa 69', true),
  (38, '88045900', 'SC', 'Florianópolis', 'Alameda da Plenitude 70', 3838, 'Cobertura 71', true),
  (39, '69010101', 'AM', 'Manaus', 'Praça das Realizações 72', 3939, 'Sobrado 73', true),
  (40, '49045678', 'SE', 'Aracaju', 'Avenida dos Êxitos 74', 4040, 'Apartamento 75', true),
  (41, '89098765', 'SC', 'Blumenau', 'Rua dos Êxitos 76', 4141, 'Casa 77', true),
  (42, '57012345', 'AL', 'Maceió', 'Travessa das Conquistas 78', 4242, 'Apto 79', true),
  (43, '76856789', 'RO', 'Porto Velho', 'Viela das Concretizações 80', 4343, 'Cobertura 81', true),
  (44, '69098765', 'AM', 'Manaus', 'Passagem da Consolidação 82', 4444, 'Sobrado 83', true),
  (45, '52012345', 'GO', 'Goiânia', 'Largo da Estabilidade 84', 4545, 'Apartamento 85', true),
  (46, '78045678', 'MT', 'Cuiabá', 'Rua da Segurança 86', 4646, 'Casa 87', true),
  (47, '20098765', 'RJ', 'Rio de Janeiro', 'Alameda do Triunfo 88', 4747, 'Apto 89', true),
  (48, '77012345', 'TO', 'Palmas', 'Praça das Realidades 90', 4848, 'Cobertura 91', true),
  (49, '69045678', 'AM', 'Manaus', 'Avenida da Prosperidade 92', 4949, 'Sobrado 93', true),
  (50, '70098765', 'DF', 'Brasília', 'Travessa dos Sucessos 94', 5050, 'Apartamento 95', true),
  (51, '71012345', 'DF', 'Brasília', 'Rua da Vitória 96', 5151, 'Casa 97', true),
  (52, '32123456', 'MG', 'Belo Horizonte', 'Alameda da Conclusão 98', 5252, 'Apto 99', true),
  (53, '58010988', 'PB', 'João Pessoa', 'Passagem das Realizações 100', 5353, 'Cobertura 101', true),
  (54, '88045901', 'SC', 'Florianópolis', 'Largo da Plenitude 102', 5454, 'Sobrado 103', true),
  (55, '69010102', 'AM', 'Manaus', 'Rua das Conclusões 104', 5555, 'Apartamento 105', true),
  (56, '49045679', 'SE', 'Aracaju', 'Viela das Superações 106', 5656, 'Casa 107', true),
  (57, '89098766', 'SC', 'Blumenau', 'Avenida da Efetivação 108', 5757, 'Apto 109', true),
  (58, '57012346', 'AL', 'Maceió', 'Rua da Consolidação 110', 5858, 'Cobertura 111', true),
  (59, '76856790', 'RO', 'Porto Velho', 'Travessa da Estabilidade 112', 5959, 'Sobrado 113', true),
  (60, '69098766', 'AM', 'Manaus', 'Praça das Superações 114', 6060, 'Apartamento 115', true),
  (61, '52012346', 'GO', 'Goiânia', 'Alameda do Sucesso 116', 6161, 'Casa 117', true),
  (62, '78045679', 'MT', 'Cuiabá', 'Passagem da Prosperidade 118', 6262, 'Apto 119', true),
  (63, '20098766', 'RJ', 'Rio de Janeiro', 'Largo das Realidades 120', 6363, 'Cobertura 121', true),
  (64, '77012346', 'TO', 'Palmas', 'Rua das Conquistas 122', 6464, 'Sobrado 123', true),
  (65, '69045679', 'AM', 'Manaus', 'Avenida da Estabilidade 124', 6565, 'Apartamento 125', true),
  (66, '70098766', 'DF', 'Brasília', 'Travessa da Prosperidade 126', 6666, 'Casa 127', true),
  (67, '71012346', 'DF', 'Brasília', 'Praça da Superação 128', 6767, 'Apto 129', true),
  (68, '32123457', 'MG', 'Belo Horizonte', 'Largo das Realizações 130', 6868, 'Cobertura 131', true),
  (69, '58010989', 'PB', 'João Pessoa', 'Passagem da Prosperidade 132', 6969, 'Sobrado 133', true),
  (70, '88045902', 'SC', 'Florianópolis', 'Avenida do Sucesso 134', 7070, 'Apartamento 135', true);
  



INSERT INTO tb_enderecos (id_profissional, cep, estado, cidade, logradouro, numero, comp, ativo)
VALUES
  (1, '30170110', 'MG', 'Belo Horizonte', 'Avenida dos Profissionais 1', 123, 'Sala 10', true),
  (2, '80020010', 'PR', 'Curitiba', 'Rua dos Especialistas 2', 456, 'Andar 2', true),
  (3, '70002900', 'DF', 'Brasília', 'Quadra dos Experts 3', 789, 'Bloco C', true),
  (4, '50050100', 'MS', 'Campo Grande', 'Avenida das Competências 4', 101, 'Sala 5', true),
  (5, '21015100', 'MA', 'São Luís', 'Travessa dos Talentos 5', 222, 'Sala 6', true),
  (6, '60175020', 'CE', 'Fortaleza', 'Avenida das Habilidades 6', 333, 'Andar 7', true),
  (7, '04329010', 'SP', 'São Paulo', 'Rua dos Conhecimentos 7', 444, 'Sala 8', true),
  (8, '58015410', 'PB', 'João Pessoa', 'Avenida das Especialidades 8', 555, 'Andar 9', true),
  (9, '25015010', 'PB', 'Campina Grande', 'Praça das Aptidões 9', 666, 'Sala 10', true),
  (10, '80240320', 'PR', 'Curitiba', 'Rua das Profissões 10', 777, 'Andar 11', true),
  (11, '37062470', 'MG', 'Juiz de Fora', 'Travessa dos Especialistas 11', 888, 'Sala 12', true),
  (12, '69073240', 'AM', 'Manaus', 'Rua das Competências 12', 999, 'Andar 13', true),
  (13, '80020970', 'PR', 'Curitiba', 'Praça dos Experts 13', 1010, 'Bloco A', true),
  (14, '50020200', 'MS', 'Campo Grande', 'Avenida dos Profissionais 14', 1111, 'Sala 15', true),
  (15, '21030000', 'MA', 'São Luís', 'Rua dos Talentos 15', 1212, 'Sala 16', true),
  (16, '60190020', 'CE', 'Fortaleza', 'Avenida das Habilidades 16', 1313, 'Andar 17', true),
  (17, '04315030', 'SP', 'São Paulo', 'Travessa dos Conhecimentos 17', 1414, 'Sala 18', true),
  (18, '58052100', 'PB', 'João Pessoa', 'Rua das Especialidades 18', 1515, 'Andar 19', true),
  (19, '25010100', 'PB', 'Campina Grande', 'Avenida das Aptidões 19', 1616, 'Sala 20', true),
  (20, '80230120', 'PR', 'Curitiba', 'Travessa das Profissões 20', 1717, 'Andar 21', true),
  (21, '69098000', 'AM', 'Manaus', 'Rua das Habilidades 21', 1818, 'Sala 22', true);
  
  

INSERT INTO tb_Mensagem (usuario_id, mensagem, data) values (40, 'Oi, tudo bem?', '2023-12-06 23:10:20'), (40, 'Queria saber se você pode prestar um serviço na minha casa, é com urgência', '2023-12-06 23:12:02'), (40, 'É para semana que vem... se possível.', '2023-12-06 23:13:22'), (40, 'Acontece que a rede da minha casa está com problemas, caindo toda hora, olha como ta a minha casa', '2023-12-06 23:13:22'), (40, 'Agradeço pela resposta rápida!', '2023-12-06 23:20:15'),
  (40, 'Acredito que seja um problema com a fiação, mas não entendo muito disso.', '2023-12-06 23:21:40'),
  (40, 'Você pode vir dar uma olhada amanhã?', '2023-12-06 23:23:10');

  
INSERT INTO tb_Mensagem (profissional_id, mensagem, data) VALUES (10, 'Olá!', '2023-12-06 23:16:21'), (10, 'Amigo, estou disponível sim.', '2023-12-06 23:16:50'), (10, 'O que aconteceu com a rede elétrica para ficar assim?.', '2023-12-06 23:17:50'), (10, 'Sim, posso ir amanhã à tarde para verificar o problema.', '2023-12-06 23:25:30'),
  (10, 'Gostaria de saber se você tem mais alguma informação sobre a situação.', '2023-12-06 23:26:45'),
  (10, 'Caso precise de algum material específico, me avise para que eu possa providenciar.', '2023-12-06 23:28:15');

INSERT INTO tb_Imagens_Mensagem(mensagem_id, url_imagem) VALUES (4, 'img-hmc123123123412412414.png'), (4, 'img-hmc1142121231454414.png'), (4, 'img-hmc1233914sdade414.png'), (4, 'img-hmc123221mkdsamd2412414.png'), (4, 'img-hmcSKsdamegkef412412414.png');


INSERT INTO tb_Mensagem (usuario_id, mensagem, data)
VALUES
  (41, 'Oi, estou com um problema no encanamento da minha casa. Pode me ajudar?', '2023-12-07 10:30:00'),
  (41, 'A água está vazando por toda parte, e não sei o que fazer.', '2023-12-07 10:32:15'),
  (41, 'Você poderia vir o mais rápido possível? Estou desesperado.', '2023-12-07 10:35:40'),
  (42, 'Bom dia! Preciso de ajuda para instalar um novo chuveiro na minha residência.', '2023-12-07 11:20:00'),
  (42, 'Você tem disponibilidade para fazer o serviço ainda hoje?', '2023-12-07 11:25:30'),
  (43, 'Olá! Estou com problemas na parte elétrica da minha loja. Pode me ajudar?', '2023-12-07 14:45:00'),
  (43, 'Os equipamentos estão desligando sozinhos, e não sei o que fazer.', '2023-12-07 14:48:20'),
  (43, 'Quanto antes puder vir, melhor!', '2023-12-07 14:50:45');

INSERT INTO tb_Mensagem (profissional_id, mensagem, data)
VALUES
  (11, 'Olá! Como posso ajudar com o problema no encanamento?', '2023-12-07 10:40:00'),
  (11, 'Entendo a urgência. Já estou a caminho, chego aí em 30 minutos.', '2023-12-07 10:42:30'),
  (12, 'Bom dia! Claro, posso ajudar com a instalação do chuveiro.', '2023-12-07 11:30:00'),
  (12, 'Podemos agendar para a tarde. O que acha?', '2023-12-07 11:32:15'),
  (13, 'Olá! Estou disponível para resolver os problemas elétricos em sua loja.', '2023-12-07 15:00:00'),
  (13, 'Preciso de mais detalhes sobre os equipamentos e o que está acontecendo.', '2023-12-07 15:05:30'),
  (13, 'Posso passar aí amanhã pela manhã?', '2023-12-07 15:10:45');
  

INSERT INTO tb_Mensagem (usuario_id, mensagem, data)
VALUES
  (44, 'Olá, estou precisando de ajuda para consertar a porta da minha casa. Ela não está fechando corretamente.', '2023-12-08 09:15:00'),
  (44, 'Você poderia vir dar uma olhada e me passar um orçamento?', '2023-12-08 09:20:30'),
  (45, 'Oi, estou com um vazamento na pia da cozinha. A água está se acumulando e não consigo resolver.', '2023-12-08 11:45:00'),
  (45, 'Pode me ajudar a resolver isso o mais rápido possível?', '2023-12-08 11:50:15'),
  (46, 'Bom dia! Preciso de alguém para fazer a manutenção do meu ar condicionado. Está fazendo um barulho estranho.', '2023-12-08 14:30:00'),
  (46, 'Você pode vir verificar e fazer a manutenção?', '2023-12-08 14:35:45'),
  (47, 'Olá, estou reformando minha sala e preciso de um eletricista para instalar novas tomadas.', '2023-12-08 16:20:00'),
  (47, 'Você tem disponibilidade para fazer esse serviço?', '2023-12-08 16:25:30');


INSERT INTO tb_Mensagem (profissional_id, mensagem, data)
VALUES
  (14, 'Oi! Claro, eu posso consertar a porta para você. Vou passar aí em breve.', '2023-12-08 09:30:00'),
  (14, 'Vou avaliar a situação e te passar um orçamento.', '2023-12-08 09:35:20'),
  (15, 'Olá! Posso resolver o vazamento na sua pia. Chego aí em 30 minutos.', '2023-12-08 12:00:00'),
  (15, 'Fique tranquilo, vou resolver o problema rapidamente.', '2023-12-08 12:05:15'),
  (16, 'Bom dia! Estou disponível para fazer a manutenção do seu ar condicionado. Chego aí em breve.', '2023-12-08 15:00:00'),
  (16, 'Vou verificar e fazer a manutenção necessária para que volte a funcionar corretamente.', '2023-12-08 15:05:30'),
  (17, 'Olá! Posso ajudar com a instalação das tomadas. Podemos agendar para amanhã?', '2023-12-08 17:00:00'),
  (17, 'Informe quantas tomadas você precisa instalar para que eu possa trazer o material adequado.', '2023-12-08 17:05:45');



-- conta o numero de profissionais por categoria 
select categorias.nome_categoria, count(profissionais.id_profissional) as total_profissionais
from tb_profissionais as profissionais
inner join tb_categorias as categorias on profissionais.categoria_id = categorias.id_categoria
group by categorias.nome_categoria;

-- conta o numero de usuarios por estados 
select estados.estado, count(usuarios.id_usuario) as total_usuarios
from tb_enderecos as estados
inner join tb_usuarios as usuarios on estados.id_usuario = usuarios.id_usuario
group by estados.estado;

-- conta o numero de profissionais por estado 
select estados.estado, count(profissionais.id_profissional) as total_profissionais
from tb_enderecos as estados
inner join tb_profissionais as profissionais on estados.id_profissional = profissionais.id_profissional
group by estados.estado;


-- Mostra quantidade de mensagens por profissionais
SELECT tb_profissionais.nome, tb_profissionais.sobrenome,
       COUNT(tb_Mensagem.id_mensagem) AS qtd_mensagens
FROM tb_profissionais
LEFT JOIN tb_Mensagem ON tb_profissionais.id_profissional = tb_Mensagem.profissional_id
GROUP BY tb_profissionais.nome;

-- Conta o número de mensagens por usuarios
SELECT tb_usuarios.nome, tb_usuarios.sobrenome,
       COUNT(tb_Mensagem.id_mensagem) AS qtd_mensagens
FROM tb_usuarios
LEFT JOIN tb_Mensagem ON tb_usuarios.id_usuario = tb_Mensagem.usuario_id
GROUP BY tb_usuarios.nome;



