-- SQL para consultas e verificação. SELECT costuma ser classificado como DQL.
SELECT * FROM public.categorias ORDER BY id_categoria;
SELECT titulo,data_evento FROM public.avisos ORDER BY data_evento;
SELECT titulo,data_evento FROM public.avisos WHERE id_categoria=1;
-- JOIN: título, nome do autor e categoria, sem repetir dados nas tabelas
SELECT a.id_aviso,a.titulo,u.nome AS publicador,c.nome AS categoria FROM public.avisos a
JOIN public.usuarios u ON u.id_usuario=a.id_usuario
JOIN public.categorias c ON c.id_categoria=a.id_categoria ORDER BY a.id_aviso;
-- N:N: avisos destinados à turma 2A
SELECT t.nome AS turma,a.titulo,a.data_evento FROM public.aviso_turma at
JOIN public.turmas t ON t.id_turma=at.id_turma
JOIN public.avisos a ON a.id_aviso=at.id_aviso
WHERE t.nome='2A' ORDER BY a.id_aviso;
-- UPDATE altera uma linha e DELETE exclui uma associação; ROLLBACK desfaz
BEGIN;
UPDATE public.avisos SET titulo='Título de teste' WHERE id_aviso=10;
SELECT titulo FROM public.avisos WHERE id_aviso=10;
DELETE FROM public.aviso_turma WHERE id_aviso=10 AND id_turma=3;
ROLLBACK;
