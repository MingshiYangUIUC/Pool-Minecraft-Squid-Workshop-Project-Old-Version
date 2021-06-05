#tags are c1 and c2


#find relative velocity in components swPool_vrx and swPool_vrz
execute at @s[scores={swPool_v=1..}] run function pool:classes/physics/vseparate
execute as @e[tag=swPool_c2,limit=1,scores={swPool_v=1..}] at @s run function pool:classes/physics/vseparate
scoreboard players operation @s swPool_vrx = @s swPool_vx
scoreboard players operation @s swPool_vrz = @s swPool_vz
scoreboard players operation @s swPool_vrx -= @e[tag=swPool_c2,limit=1] swPool_vx
scoreboard players operation @s swPool_vrz -= @e[tag=swPool_c2,limit=1] swPool_vz

#find swPool_vr magnitude
tag @e[tag=swPool_rhp1] add swPool_vr
scoreboard players operation @e[tag=swPool_vr,limit=1] swPool_vx = @s swPool_vrx
scoreboard players operation @e[tag=swPool_vr,limit=1] swPool_vz = @s swPool_vrz
execute as @e[tag=swPool_vr,limit=1] at @s run function pool:classes/physics/vcombine
scoreboard players operation @s swPool_vr = @e[tag=swPool_vr,limit=1] swPool_v
scoreboard players reset @e[tag=swPool_rhp1] swPool_v
scoreboard players reset @e[tag=swPool_rhp1] swPool_vx
scoreboard players reset @e[tag=swPool_rhp1] swPool_vz
scoreboard players reset @e[tag=swPool_rhp1] swPool_var00
scoreboard players reset @e[tag=swPool_rhp1] swPool_var01
scoreboard players reset @e[tag=swPool_rhp1] swPool_var02
scoreboard players reset @e[tag=swPool_rhp1] swPool_var03
scoreboard players reset @e[tag=swPool_rhp1] swPool_var04
scoreboard players reset @e[tag=swPool_rhp1] swPool_var05
tag @e[tag=swPool_rhp1] remove swPool_vr

#get swPool_time
scoreboard players operation @s swPool_var00 = @s swPool_vr
scoreboard players operation @s swPool_var00 /= @s swPool_drel
scoreboard players set @s swPool_var04 100000000
scoreboard players operation @s swPool_var04 /= @s swPool_var00
scoreboard players operation @s swPool_time = @s swPool_var04
scoreboard players operation @e[tag=swPool_c2,limit=1] swPool_time = @s swPool_time

#join if swPool_time < 10000 (1tick), OMIT this step if breaking red balls (adjacent 2)
#count red balls
execute if entity @s[tag=swPool_red] at @s run tag @e[tag=swPool_red,distance=0.25..0.261] add swPool_counting
execute if entity @s[tag=swPool_red] at @s if entity @e[tag=swPool_counting,distance=0.25..0.261] run scoreboard players set @s swPool_count 1
execute if entity @s[tag=swPool_red] at @s if entity @e[tag=swPool_counting,distance=0.25..0.261] run tag @e[tag=swPool_counting,limit=1,distance=0.25..0.261] remove swPool_counting
execute if entity @s[tag=swPool_red] at @s if entity @e[tag=swPool_counting,distance=0.25..0.261] run scoreboard players add @s swPool_count 1
execute if entity @s[tag=swPool_red] at @s if entity @e[tag=swPool_counting,distance=0.25..0.261] run tag @e[tag=swPool_counting,limit=1,distance=0.25..0.261] remove swPool_counting
tag @s[tag=swPool_red,scores={swPool_count=2..}] add swPool_packed
execute if entity @s[tag=!swPool_packed,scores={swPool_time=0..10000}] at @s[scores={swPool_v=1..}] run function pool:classes/collision/join
execute if entity @s[tag=!swPool_packed,scores={swPool_time=0..10000}] as @e[tag=swPool_c2,limit=1,scores={swPool_v=1..}] at @s run function pool:classes/collision/join
tag @s[tag=swPool_red] remove swPool_packed


execute if entity @s[scores={swPool_time=0..10000}] run scoreboard players set @s swPool_v 0
execute if entity @s[scores={swPool_time=0..10000}] run scoreboard players set @e[tag=swPool_c2,limit=1] swPool_v 0
#and stops them, but componets are kept for calculation

#calculation
execute if entity @s[scores={swPool_time=0..10000}] at @s run function pool:classes/collision/collide

#remove tags
tag @s remove swPool_c1
tag @e[tag=swPool_c2,limit=1] remove swPool_c2