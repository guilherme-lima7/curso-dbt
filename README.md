# Projetos de Engenharia de Dados com dbt & PostgreSQL

Este repositório reúne projetos práticos de transformação de dados e modelagem dimensional desenvolvidos durante o meu aprendizado em Engenharia de Dados.

## 📂 Projetos no Repositório

### 1. Data Warehouse Veterinário
Este é um projeto focado na extração de dados clínicos complexos a partir de fontes semi-estruturadas.

- Decodificação de dados brutos em Base64 e extração de informações aninhadas em arquivos XML.
- Implementação de lógica XPath para lidar com múltiplos blocos de diagnóstico (`Dados_Clinicos`) dentro de um único laudo, garantindo a granularidade correta na tabela de factos.
- Star Schema completo com Dimensões (`Paciente`, `Medico`, `Exame`) e a `FactLaudo`.

### 2. Modelagem Dimensional Reviews
Primeiro contato com o dbt, focado nos fundamentos de transformação de dados.

-Carga e limpeza de 100 reviews para criação de um modelo dimensional básico.

---

## 🛠️ Tecnologias e Conceitos
- dbt: Orquestração das transformações e linhagem de dados.
- PostgreSQL: Banco de dados utilizado para o Data Warehouse.
- SQL & XPath: Extração e manipulação de dados complexos em XML.
- Git & GitHub: Versionamento e documentação do código.

*Desenvolvido por Guilherme Lima como parte dos estudos de DBT através curso ministrado pelo Engenheiro de Dados Gabriel Ritcher.*
