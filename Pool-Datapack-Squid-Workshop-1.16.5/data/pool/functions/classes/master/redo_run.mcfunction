kill @e[tag=swPool_pool]

tag @e[tag=swPool_temppin] add swPool_pool


replaceitem entity @e[tag=swPool_cue,tag=swPool_temppin] armor.head minecraft:acacia_button{CustomModelData:1}
replaceitem entity @e[tag=swPool_red,tag=swPool_temppin] armor.head minecraft:acacia_button{CustomModelData:2}
replaceitem entity @e[tag=swPool_yellow,tag=swPool_temppin] armor.head minecraft:acacia_button{CustomModelData:3}
replaceitem entity @e[tag=swPool_green,tag=swPool_temppin] armor.head minecraft:acacia_button{CustomModelData:4}
replaceitem entity @e[tag=swPool_brown,tag=swPool_temppin] armor.head minecraft:acacia_button{CustomModelData:5}
replaceitem entity @e[tag=swPool_blue,tag=swPool_temppin] armor.head minecraft:acacia_button{CustomModelData:6}
replaceitem entity @e[tag=swPool_pink,tag=swPool_temppin] armor.head minecraft:acacia_button{CustomModelData:7}
replaceitem entity @e[tag=swPool_black,tag=swPool_temppin] armor.head minecraft:acacia_button{CustomModelData:8}


scoreboard players set @e[tag=swPool_yellow,tag=swPool_temppin] swPool_rank 2
scoreboard players set @e[tag=swPool_green,tag=swPool_temppin] swPool_rank 3
scoreboard players set @e[tag=swPool_brown,tag=swPool_temppin] swPool_rank 4
scoreboard players set @e[tag=swPool_blue,tag=swPool_temppin] swPool_rank 5
scoreboard players set @e[tag=swPool_pink,tag=swPool_temppin] swPool_rank 6
scoreboard players set @e[tag=swPool_black,tag=swPool_temppin] swPool_rank 7

execute as @e[scores={swPool_rank=2}] run data merge entity @s {CustomName:"\"2 Pts\""}
execute as @e[scores={swPool_rank=3}] run data merge entity @s {CustomName:"\"3 Pts\""}
execute as @e[scores={swPool_rank=4}] run data merge entity @s {CustomName:"\"4 Pts\""}
execute as @e[scores={swPool_rank=5}] run data merge entity @s {CustomName:"\"5 Pts\""}
execute as @e[scores={swPool_rank=6}] run data merge entity @s {CustomName:"\"6 Pts\""}
execute as @e[scores={swPool_rank=7}] run data merge entity @s {CustomName:"\"7 Pts\""}

scoreboard players set @e[tag=swPool_pool] swPool_D100 100000
scoreboard players set @e[tag=swPool_pool] swPool_DXX 99000

tag @e[tag=swPool_temppin] remove swPool_temppin


execute as @a[tag=poolplay] run scoreboard players operation @s swPool_Score = @s swPool_hidScore

scoreboard players operation Opponent swPool_Score = Opponent swPool_hidScore

scoreboard players operation Stroke swPool_hidScore = StrokeRec swPool_hidScore

tellraw @a[tag=swPool_poolplay] [{"text":"Done. The balls and scores have returned to their previous states."}]

function pool:classes/master/record