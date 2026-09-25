# Atividade Prática — Auditoria do DER
**Projeto de Banco de Dados — 2º A — 25/09/2026**

## Missão
Sua equipe recebeu um DER com erros intencionais. O objetivo é provar se o modelo consegue representar as regras do sistema.

## Regras
1. Abra o DER-base no diagrams.net.
2. Leia o caso antes de alterar.
3. Marque **PASSOU** apenas se o modelo representar a situação sem contradição.
4. Em falha: registre evidência → proponha correção → altere o DER → repita o teste.
5. Toda alteração precisa de justificativa.

## Casos T01–T05
- **T01:** Ana publica três avisos. Um usuário pode relacionar-se a vários avisos?
- **T02:** Dois usuários podem ter o mesmo nome. O sistema identifica cada um sem depender do nome?
- **T03:** O título “Prova de Programação” pertence a qual entidade?
- **T04:** Vinte avisos podem pertencer à categoria “Evento”. O relacionamento representa isso?
- **T05:** Todo aviso precisa ter data e descrição/conteúdo no lugar correto.

## Casos surpresa T06–T08
- **T06:** Dois avisos de um usuário e outro aviso de outro usuário, todos na mesma categoria.
- **T07:** Alterar um aviso sem mudar a identidade de quem publicou.
- **T08:** Categoria “Evento” existe uma única vez e se relaciona a muitos avisos.

## Aceitação cruzada T09–T11
- **T09:** Identificar autor, título, descrição, data e categoria de um aviso.
- **T10:** Verificar se dois usuários com mesmo nome continuam distintos.
- **T11:** Procurar atributo armazenado em entidade conceitualmente errada.

## Entrega
- DER final.
- Matriz de auditoria com resultado inicial, evidência, correção e reteste.
- Parecer: **APROVADO / APROVADO COM RESSALVAS / AINDA INCONSISTENTE**.
