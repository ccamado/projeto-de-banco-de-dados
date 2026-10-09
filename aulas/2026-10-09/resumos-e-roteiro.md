# 09/10/2026 — Central de Avisos no Supabase
**CEPEF · 2º A · Projeto de Banco de Dados · Professor Claudio Amado**
**Status:** material produzido; aula não confirmada como ministrada.

## 1º tempo (07h00–07h50) — Modelagem e Supabase
- O PostgreSQL é um SGBD relacional; Supabase é uma plataforma que oferece PostgreSQL e ferramentas de gerenciamento.
- Conceitual: entidades/relacionamentos; lógico: tabelas/colunas/chaves; físico: banco implementado.
- Modelo didático: setores, usuarios, categorias, turmas, avisos, aviso_turma.
- PK identifica registro; FK aponta para PK de outra tabela; integridade referencial evita referência inexistente.
- usuarios 1:N avisos; categorias 1:N avisos; setores 1:N usuarios; avisos N:N turmas por aviso_turma.
**Caderno:** desenhar dois relacionamentos; indicar uma PK e duas FKs.

## 2º tempo (07h50–08h40) — SQL e scripts
- Script é arquivo com sequência de instruções SQL.
- DDL: CREATE (criar tabela), ALTER (alterar estrutura), DROP (remover estrutura).
- DML/LMD: INSERT (inserir), UPDATE (modificar dados), DELETE (excluir linhas).
- SELECT consulta (DQL em muitas classificações); WHERE filtra, ORDER BY ordena, JOIN associa dados.
- Leitura acompanhada dos arquivos: 01 cria tabelas; 02 popula dados; 03 consulta e testa.
**Caderno:** explicar diferença entre DROP e DELETE e identificar JOIN no script.

## 4º tempo (09h40–10h30) — laboratório
1. 0–10 min: acessar https://supabase.com/dashboard, criar/abrir projeto didático e localizar SQL Editor.
2. 10–22 min: executar 01_criar_tabelas.sql; verificar as seis tabelas no Table Editor.
3. 22–32 min: executar 02_inserir_dados.sql; verificar 10 registros em cada tabela principal e 12 em aviso_turma.
4. 32–43 min: executar SELECTs e JOINs de 03_consultas_e_testes.sql.
5. 43–50 min: registrar captura das tabelas e do JOIN e responder às perguntas.

**Perguntas:** (1) CREATE difere de INSERT como? (2) Que tabela resolve N:N? (3) Quais FKs tem avisos? (4) Qual JOIN mostra o publicador? (5) DELETE difere de DROP como?

**Segurança:** use dados fictícios e projeto separado. Não exponha senhas/chaves. SQL Editor pode ter privilégios elevados; não publique dados por API sem configurar RLS.

**Contingência:** se não houver acesso, acompanhar execução demonstrativa e prever o resultado das consultas; prática individual permanece pendente.

## Gabarito do professor
1. DDL cria estrutura; DML insere linhas. 2. aviso_turma; relacionamento muitos-para-muitos. 3. id_usuario → usuarios e id_categoria → categorias. 4. SELECT com JOIN de avisos e usuarios. 5. DELETE remove linhas; DROP remove a tabela.
**Resultados esperados:** 6 tabelas; 10 linhas em cada uma das primeiras cinco; 12 associações; consulta da turma 2A retorna avisos de IDs 1,2,3,8,10.
