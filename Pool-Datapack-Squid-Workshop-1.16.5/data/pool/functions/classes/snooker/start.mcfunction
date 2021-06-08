execute unless entity @e[tag=swPool_pooltable] run tellraw @s [{"text":"Please place a table first.","color":"red"}]

kill @e[tag=swPool_pool]
kill @e[tag=swPool_pin]
kill @e[tag=swPool_temppin]
tag @a remove swPool_poolplay
kill @e[tag=swPool_poolplay,type=area_effect_cloud]
clear @a carrot_on_a_stick{CustomModelData:99}
execute as @e[tag=swPool_pooltable] at @s positioned ~ ~ ~ run function pool:classes/snooker/balls
scoreboard players set @a swPool_Score 0

execute as @e[tag=swPool_pooltable] at @s run tag @a[sort=nearest,limit=2] add swPool_near
tag @a[tag=swPool_near,limit=1,sort=random] add swPool_freeball
give @a[tag=swPool_freeball] carrot_on_a_stick{CustomModelData:99,display:{Name:"\"Cueball\""}}
tag @a[tag=swPool_near] remove swPool_near
tag @e[tag=swPool_pooltable] add swPool_start
tag @e[tag=swPool_pooltable] remove swPool_fouled
tag @a remove swPool_hitcue

tag @a[limit=1,sort=random] add swPool_poolplay
execute if entity @e[tag=swPool_pooltable] unless entity @a[tag=!swPool_poolplay] run tellraw @s [{"text":"Not enough players, switched to singleplayer.","color":"red"}]
execute unless entity @a[tag=!swPool_poolplay] run scoreboard players set Opponent swPool_Score 0
execute if entity @a[tag=!swPool_poolplay] run tag @a[limit=1,sort=random,tag=!swPool_poolplay] add swPool_poolplay
scoreboard objectives setdisplay sidebar swPool_Score

scoreboard players set Stroke swPool_hidScore 0