-- Só para demonstração dos resultados; SELECT/JOIN serão estudados depois
SELECT a.id_aviso,a.titulo,u.nome AS responsavel,c.nome AS categoria
FROM central_avisos_demo.aviso a
JOIN central_avisos_demo.usuario u ON u.id_usuario=a.id_usuario
JOIN central_avisos_demo.categoria c ON c.id_categoria=a.id_categoria
ORDER BY a.id_aviso;
SELECT a.titulo,t.nome AS turma
FROM central_avisos_demo.aviso_turma at
JOIN central_avisos_demo.aviso a ON a.id_aviso=at.id_aviso
JOIN central_avisos_demo.turma t ON t.id_turma=at.id_turma
ORDER BY a.id_aviso,t.id_turma;