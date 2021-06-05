scoreboard players set @e[tag=swPool_pooltable] swPool_count 0
execute at @a[nbt={SelectedItem:{id:"minecraft:bow",tag:{CustomModelData:1}}}] as @e[type=arrow,distance=..5] store result score @s swPool_player run data get entity @s Owner[1]
execute as @e[tag=swPool_pooltable,tag=swPool_snookermode,scores={swPool_time=1}] at @s run function pool:classes/snooker/place
execute as @e[tag=swPool_pooltable,tag=swPool_snookermode,scores={swPool_time=1}] at @s run tp @s ~ ~ ~ ~ ~
execute as @a[tag=swPool_freeball] at @s[nbt={SelectedItem:{tag:{CustomModelData:99},id:"minecraft:carrot_on_a_stick"}}] run function pool:classes/freeball/main
execute as @a[nbt={OnGround:1b,SelectedItem:{id:"minecraft:bow",tag:{CustomModelData:1}}}] at @s run function pool:classes/cue/main
#execute as @a[nbt={OnGround:1b,Inventory:[{Slot:-106b,id:"minecraft:bow",tag:{CustomModelData:1}}]}] at @s run function pool:classes/cue/aim
execute as @e[tag=swPool_pool,scores={swPool_DXX=1..}] at @s[scores={swPool_v=1..}] run function pool:classes/master/main
execute as @e[tag=swPool_pool] at @s if entity @e[tag=swPool_pool,distance=0.0001..0.25] run function pool:classes/motion/retreat
tag @e[tag=swPool_a1] remove swPool_a1
tag @e[tag=swPool_colliding] remove swPool_colliding
execute unless entity @e[tag=swPool_pool,scores={swPool_v=1..}] as @e[tag=swPool_pooltable,tag=!swPool_start] run function pool:classes/master/idle
scoreboard players add @e[tag=swPool_pooltable] swPool_time 1
execute as @a at @s if score @e[type=arrow,distance=..4,limit=1] swPool_player = @s swPool_player run kill @e[type=arrow,distance=..4,limit=1]
