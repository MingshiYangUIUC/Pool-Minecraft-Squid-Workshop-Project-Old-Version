scoreboard players set @s[scores={swPool_foul=..3}] swPool_foul 4

execute as @s[tag=swPool_pocketing] run function pool:classes/pocketing/replace
execute if entity @a[tag=swPool_hitcue] as @s[tag=!swPool_pocketing] run function pool:classes/master/progression
tag @e[tag=swPool_a1] remove swPool_a1

tag @e[tag=swPool_colliding] remove swPool_colliding