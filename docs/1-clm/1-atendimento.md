---
title: Fluxo de Atendimento
parent: Clínica Médica
nav_order: 1
references:
  foo:
    doi: 10.1590/1413-81232025301.03722023
  bar:
    authors:
      - Fatima Laher
      - Linda-Gail Bekker
      - Nigel Garrett
      - Erica M Lazarus
      - Glenda E Gray
    title: Review of preventative HIV vaccine clinical trials in South Africa
    journal: Arch Virol
    publication: 2020 Nov
    volume: 165
    issue: 11
    pages: 2439-2452
  far:
    organization: Ministério da Saúde
    title: Manual de Manejo Clínico da Febre Amarela
    publication: 2020
  boo:
    doi: 10.1136/archdischild-2016-310459
---

# Fluxo de Atendimento

```mermaid
flowchart TD
  Start(["Atendimento<br>**Sempre LIBERAR ficha!**"]) -- Deixar<br>**no acrílico** --> Caixa("Apoio recolherá")
  Start -- **VOCÊ** orienta paciente --> Guide("Orientar: fluxo + onde ir")
  Caixa --> Unificado["Tudo em<br>**uma prescrição**"] & Stay["**Não** levar ao Apoio!"]
  Guide -- Azul+<br>Verde --> Labs_Verde("Coleta Labs<br>Bloco G")
  Guide -- Amarelo+<br>Laranja --> Labs_Amarelo("Coleta Labs<br>Espera 4")
  Guide -- "Dengue (qlq cor!)" --> Dengue("Coleta Labs+<br>Meds+<br>Reaval<br>Dengário")
  Labs_Verde --> Meds_Verde("Medicação<br>Bloco G")
  Labs_Amarelo --> Meds_Amarelo("Medicação<br>Espera 4")
  Dengue -- Após meds --> DengueIbagem("Exames Imagem")
  Meds_Verde --> Ibagem("Exames Imagem")
  Meds_Amarelo --> Ibagem
  Ibagem -- Após **tudo** --> Reaval("Aguardar Reavaliação<br>Espera 4")
  Dengue --> DengueReaval("Ag reaval<br>**no Dengário**")
```

{: .danger }
> **SEMPRE** liberar os atendimentos quando acabá-los!
>
> Em caso de dificuldades em liberar os atendimentos, procure ajuda do Apoio.

## Reavaliações

```mermaid
flowchart LR
  subgraph Actions ["Condutas"]
    direction TB
    Labs("Labs") <--> Images("Imagens<br>**Evitar TCs!**")
    Images <--> Meds("Medicações")
    Meds <--> ECG("ECG")
    ECG <--> Proceds("Procedimentos")
  end
  First("Primeiro Atendimento") --> Actions
  Actions --> Reeval("Reavaliação")
  Reeval --> End("Conduta definitiva")
  End --> Discharge("Alta") & Inpatient("Internação")
```

{: .warning }
> Evitar re-reavaliações!
>
> 70-80%{% cite boo %} dos diagnósticos definitivos podem ser feitos só com uma anamnese adequada &ndash; invista tempo nisso.
