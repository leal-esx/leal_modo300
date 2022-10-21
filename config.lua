Config = {}

Config.LegacyFuel = true  -- Se usas Script LegacyFuel coloca true , caso contrário coloca false e terás que adaptar ao teu script de fuel.

Config.trabalhos = { -- Trbalhos com permisão para ativar o modo 300
    {"police"},
    {"sheriff"},
    {"gnr"} 
}

Config.aguardar = 10 -- Tempo de cooldown que se pode voltar a ativar o modo 300 (em minutos)/ Minimo 1 Minuto. 5 - 5 minutos / 10- 10 minutos...

Config.alertas = "okok" -- Tipo de notificações . Usa: "mythic" caso usas os alertas "mythic-notify". 
                       -- Usa "okoknotify" ou "okok" caso usas os alertas "OkOk-Notify". 
                       -- Usa "esx" ou "default" caso não uses nenhum alerta "personalizado".

--Edited by: Leal#9186                          