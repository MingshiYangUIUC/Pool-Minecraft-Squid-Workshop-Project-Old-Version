execute unless data storage minecraft:swpool keepsession run function pool:classes/main/clean

scoreboard objectives add swPool_D100 dummy
scoreboard objectives add swPool_DXX dummy
scoreboard objectives add swPool_rot dummy
scoreboard objectives add swPool_drot dummy
scoreboard objectives add swPool_dist dummy
scoreboard objectives add swPool_drel dummy
scoreboard objectives add swPool_posx dummy
scoreboard objectives add swPool_posy dummy
scoreboard objectives add swPool_posz dummy
scoreboard objectives add swPool_var00 dummy
scoreboard objectives add swPool_var01 dummy
scoreboard objectives add swPool_var02 dummy
scoreboard objectives add swPool_var03 dummy
scoreboard objectives add swPool_var04 dummy
scoreboard objectives add swPool_var05 dummy
scoreboard objectives add swPool_v dummy
scoreboard objectives add swPool_vx dummy
scoreboard objectives add swPool_vz dummy
scoreboard objectives add swPool_vr dummy
scoreboard objectives add swPool_vrx dummy
scoreboard objectives add swPool_vrz dummy
scoreboard objectives add swPool_time dummy
scoreboard objectives add swPool_sizex dummy
scoreboard objectives add swPool_sizez dummy
scoreboard objectives add swPool_dl dummy
scoreboard objectives add swPool_ds dummy
scoreboard objectives add swPool_count dummy
scoreboard objectives add swPool_ncolor dummy
scoreboard objectives add swPool_nred dummy
scoreboard objectives add swPool_rank dummy
scoreboard objectives add swPool_player dummy
scoreboard objectives add swPool_firsthit dummy
scoreboard objectives add swPool_Score dummy
scoreboard objectives add swPool_foul dummy
scoreboard objectives add swPool_ontgt dummy
scoreboard objectives add swPool_shoot dummy
scoreboard objectives add swPool_crtclk minecraft.used:minecraft.carrot_on_a_stick
scoreboard objectives add swPool_sneaktime minecraft.custom:minecraft.sneak_time
scoreboard objectives add swPool_hidScore dummy
scoreboard objectives modify swPool_Score displayname "Score"

tellraw @a [{"text":"[Server]: Pool-Datapack from Squid-Workshop Loaded. ","italic":true,"color":"gray"},{"underlined":true,"italic":false,"text":"<Command Window>","color":"","clickEvent":{"action":"run_command","value":"/function app:help/pool/commandwindow"}}]
#execute as @a run function app:help/pool/commandwindow