-- CEPEF 2A | INSERT = DML/LMD | todos os dados são fictícios
-- Execute depois do arquivo 01, preferencialmente apenas uma vez em projeto novo.
BEGIN;
INSERT INTO public.setores(id_setor,nome) VALUES (1,'Direção'),(2,'Coordenação'),(3,'Secretaria'),(4,'Tecnologia'),(5,'Biblioteca'),(6,'Laboratórios'),(7,'Esportes'),(8,'Cultura'),(9,'Orientação'),(10,'Administração') ON CONFLICT(id_setor) DO NOTHING;
INSERT INTO public.usuarios(id_usuario,nome,email,id_setor) VALUES
(1,'Ana Modelo','ana.exemplo@example.org',1),(2,'Bruno Modelo','bruno.exemplo@example.org',2),(3,'Carla Modelo','carla.exemplo@example.org',3),(4,'Diego Modelo','diego.exemplo@example.org',4),(5,'Elisa Modelo','elisa.exemplo@example.org',5),(6,'Fabio Modelo','fabio.exemplo@example.org',6),(7,'Gabi Modelo','gabi.exemplo@example.org',7),(8,'Hugo Modelo','hugo.exemplo@example.org',8),(9,'Iris Modelo','iris.exemplo@example.org',9),(10,'Joao Modelo','joao.exemplo@example.org',10) ON CONFLICT(id_usuario) DO NOTHING;
INSERT INTO public.categorias(id_categoria,nome) VALUES (1,'Avaliação'),(2,'Evento'),(3,'Manutenção'),(4,'Reunião'),(5,'Matrícula'),(6,'Biblioteca'),(7,'Esporte'),(8,'Projeto'),(9,'Comunicado'),(10,'Oficina') ON CONFLICT(id_categoria) DO NOTHING;
INSERT INTO public.turmas(id_turma,nome) VALUES (1,'1A'),(2,'1B'),(3,'2A'),(4,'2B'),(5,'3A'),(6,'3B'),(7,'TI-1'),(8,'TI-2'),(9,'TI-3'),(10,'TI-4') ON CONFLICT(id_turma) DO NOTHING;
INSERT INTO public.avisos(id_aviso,titulo,descricao,data_evento,id_usuario,id_categoria) VALUES
(1,'Revisão de banco','Trazer o caderno e os diagramas.','2026-10-23',2,1),
(2,'Feira cultural','Apresentações no auditório.','2026-10-24',8,2),
(3,'Laboratório em revisão','Computadores da sala 2 em manutenção.','2026-10-26',4,3),
(4,'Reunião de representantes','Encontro na coordenação.','2026-10-27',2,4),
(5,'Prazo de documentação','Entregar formulário à secretaria.','2026-10-28',3,5),
(6,'Novos empréstimos','Biblioteca com livros de tecnologia.','2026-10-29',5,6),
(7,'Torneio escolar','Inscrição de equipes de futsal.','2026-11-03',7,7),
(8,'Mostra de projetos','Exposição dos sistemas desenvolvidos.','2026-11-04',6,8),
(9,'Aviso geral','Verificar horários na secretaria.','2026-11-05',1,9),
(10,'Oficina de SQL','Exercícios de consultas relacionais.','2026-11-06',10,10)
ON CONFLICT(id_aviso) DO NOTHING;
INSERT INTO public.aviso_turma(id_aviso,id_turma) VALUES (1,3),(1,4),(2,1),(2,3),(3,3),(4,5),(5,2),(6,7),(7,8),(8,3),(9,9),(10,3) ON CONFLICT DO NOTHING;
COMMIT;
