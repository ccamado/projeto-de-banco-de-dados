-- Preparação exclusiva do professor: dados fictícios, não ensinar INSERT na RPP
INSERT INTO central_avisos_demo.usuario VALUES (1,'Ana','Professora'),(2,'Carlos','Direção'),(3,'Marina','Coordenação'),(4,'Paulo','TI');
INSERT INTO central_avisos_demo.categoria VALUES (1,'Avaliação'),(2,'Evento'),(3,'Manutenção'),(4,'Comunicado');
INSERT INTO central_avisos_demo.turma VALUES (1,'1A'),(2,'2A'),(3,'3A');
INSERT INTO central_avisos_demo.aviso VALUES
(1,'Revisão para avaliação','2026-10-26',1,1),
(2,'Reunião de representantes','2026-10-27',2,2),
(3,'Manutenção do laboratório','2026-10-28',4,3),
(4,'Entrega de atividades','2026-10-29',3,4),
(5,'Avaliação de Banco de Dados','2026-11-13',1,1),
(6,'Organização da feira','2026-11-06',2,2);
INSERT INTO central_avisos_demo.aviso_turma VALUES (1,2),(2,1),(2,2),(2,3),(3,2),(4,3),(5,2),(6,1);