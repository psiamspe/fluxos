---
title: Dengue
parent: Clínica Médica
nav_order: 90
---

# Dengue

```mermaid
flowchart TD
  Suspeita(["Suspeita de **Dengue**"]) --> Triagem("Triagem normal")
  Triagem --> Fila("Abertura p/ Fila<br>**CLINICA MEDICA - DENGUE**")
  Fila --> Espera3("Espera 3")
  Espera3 --> Atendimento("Atendimento **Sala 10**")
  Atendimento --> PrescPadrao{{"**SEMPRE** usar a **Prescrição Padrão** para Dengue!!!"}} & Medic("Direcionar para **Concierge**")
  Medic --> FodasseCor("**TODO** pcte no Fluxo<br>Dengue fica no Bloco C!") & IrDireto("Concierge libera entrada")
  IrDireto --> IrDireto2("Pcte aguarda coleta e meds<br>em poltronas")
  FodasseCor ---> AgReaval("Pcte aguarda reaval<br>**nas poltronas**!")
  IrDireto2 --> AgReaval
  AgReaval --> Reaval("Reavais na **Sala Reaval Dengue**")
  Reaval --> Dengue{"Dengue?"}
  Dengue -- Não --> Alta["Alta do Fluxo"]
  Dengue -- Sim --> Grupos{"Grupo"}
  Grupos -- A ou B --> AB["Alta + Retorno 2-3d"]
  Grupos -- C --> C["IH à **Moléstias Infecciosas**"]
  Grupos -- D --> D["**SALA DE EMERGÊNCIA!**"]
```

## Prescrição Padrão

**SEMPRE** usar a prescrição-padrão de dengue, na suspeita ou em casos já confirmados!

![Prescrição padrão para Dengue no MV]({{ "/assets/dengue-prescricao-padrao.jpg" | relative_url }})

## Interconsultas MI

Considerar interconsultas da *Moléstias Infecciosas* nos seguintes casos:

- Suspeita de coinfecção outra além de Dengue;
  - Em especial suspeita de Hepatite Aguda e/ou Febre Amarela!
- Seguimento prévio com MI.

A **internação** de casos de Dengue **não precisa de autorização prévia da *MI*!**

## Retornos

Para retorno, orientar paciente procurar **Guichê 1** da Recepção com documentos de retorno preenchidos, assinados e carimbados!

![Exames para retorno]({{ "/assets/dengue-retorno.jpg" | relative_url }})
