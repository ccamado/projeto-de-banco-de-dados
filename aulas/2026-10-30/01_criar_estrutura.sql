-- CEPEF 2A | 30/10/2026 | demonstração em projeto de teste
-- Executar uma vez, preferencialmente num projeto Supabase vazio.
CREATE SCHEMA IF NOT EXISTS central_avisos_demo;
CREATE TABLE central_avisos_demo.usuario (id_usuario INTEGER PRIMARY KEY, nome VARCHAR(100) NOT NULL, tipo VARCHAR(30) NOT NULL);
CREATE TABLE central_avisos_demo.categoria (id_categoria INTEGER PRIMARY KEY, nome VARCHAR(60) NOT NULL UNIQUE);
CREATE TABLE central_avisos_demo.turma (id_turma INTEGER PRIMARY KEY, nome VARCHAR(20) NOT NULL UNIQUE);
CREATE TABLE central_avisos_demo.aviso (
 id_aviso INTEGER PRIMARY KEY, titulo VARCHAR(150) NOT NULL, data_aviso DATE NOT NULL,
 id_usuario INTEGER NOT NULL REFERENCES central_avisos_demo.usuario(id_usuario),
 id_categoria INTEGER NOT NULL REFERENCES central_avisos_demo.categoria(id_categoria)
);
CREATE TABLE central_avisos_demo.aviso_turma (
 id_aviso INTEGER NOT NULL REFERENCES central_avisos_demo.aviso(id_aviso),
 id_turma INTEGER NOT NULL REFERENCES central_avisos_demo.turma(id_turma),
 PRIMARY KEY (id_aviso,id_turma)
);