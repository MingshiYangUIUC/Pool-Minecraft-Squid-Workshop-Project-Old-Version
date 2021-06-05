tag @s remove swPool_success
tellraw @s [{"text":"Wait..."}]

#rotation: +x: 0, +z: 2, -x: 4, -z: 6.

summon armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Small:1b,Tags:["swPool_pooltable","swPool_snookermode"]}
scoreboard players operation @e[type=armor_stand,limit=1,sort=nearest] swPool_sizex = @s swPool_sizex
scoreboard players operation @e[type=armor_stand,limit=1,sort=nearest] swPool_sizez = @s swPool_sizez

scoreboard players set @s swPool_var05 10000
scoreboard players operation @s swPool_sizex /= @s swPool_var05
scoreboard players operation @s swPool_sizez /= @s swPool_var05
scoreboard players add @s swPool_sizex 1
scoreboard players add @s swPool_sizez 1
scoreboard players set @s swPool_var01 0
scoreboard players set @s swPool_var02 0
scoreboard players operation @s swPool_var01 -= @s swPool_sizex
scoreboard players operation @s swPool_var02 -= @s swPool_sizez


scoreboard players set @e[type=armor_stand,limit=1,sort=nearest] swPool_var05 10000
execute as @e[type=armor_stand,limit=1,sort=nearest] at @s store result score @s swPool_posx run data get entity @s Pos[0] 10000
execute as @e[type=armor_stand,limit=1,sort=nearest] at @s store result score @s swPool_posz run data get entity @s Pos[2] 10000
execute as @e[type=armor_stand,limit=1,sort=nearest] run scoreboard players operation @s swPool_posx /= @s swPool_var05
execute as @e[type=armor_stand,limit=1,sort=nearest] run scoreboard players operation @s swPool_posz /= @s swPool_var05
execute as @e[type=armor_stand,limit=1,sort=nearest] at @s store result entity @s Pos[0] double 1 run scoreboard players get @s swPool_posx
execute as @e[type=armor_stand,limit=1,sort=nearest] at @s store result entity @s Pos[2] double 1 run scoreboard players get @s swPool_posz

scoreboard players operation @e[tag=swPool_pooltable,type=armor_stand,limit=1,sort=nearest] swPool_var01 = @s swPool_var01
scoreboard players operation @e[tag=swPool_pooltable,type=armor_stand,limit=1,sort=nearest] swPool_var03 -= @s swPool_var01
scoreboard players operation @e[tag=swPool_pooltable,type=armor_stand,limit=1,sort=nearest] swPool_var02 = @s swPool_var02
scoreboard players operation @e[tag=swPool_pooltable,type=armor_stand,limit=1,sort=nearest] swPool_var04 -= @s swPool_var02

scoreboard players reset @s swPool_posx
scoreboard players reset @s swPool_posz
scoreboard players reset @s swPool_var05

execute if score @e[tag=swPool_pooltable,type=armor_stand,limit=1,sort=nearest] swPool_var03 >= @e[tag=swPool_pooltable,type=armor_stand,limit=1,sort=nearest] swPool_var04 run tag @e[tag=swPool_pooltable,type=armor_stand,limit=1,sort=nearest] add swPool_x
execute if score @e[tag=swPool_pooltable,type=armor_stand,limit=1,sort=nearest] swPool_var03 < @e[tag=swPool_pooltable,type=armor_stand,limit=1,sort=nearest] swPool_var04 run tag @e[tag=swPool_pooltable,type=armor_stand,limit=1,sort=nearest] add swPool_z

summon area_effect_cloud ~ ~ ~ {Tags:["swPool_placer"]}

execute as @e[type=armor_stand,tag=swPool_pooltable,limit=1,sort=nearest] at @s run function pool:classes/table/loop



scoreboard players set @e[tag=swPool_pxside] swPool_rot 0
scoreboard players set @e[tag=swPool_nxside] swPool_rot 4
scoreboard players set @e[tag=swPool_pzside] swPool_rot 2
scoreboard players set @e[tag=swPool_nzside] swPool_rot 6
scoreboard players set @e[tag=swPool_pxside,tag=swPool_nzside] swPool_rot 0
scoreboard players set @e[tag=swPool_pxside,tag=swPool_pzside] swPool_rot 2
scoreboard players set @e[tag=swPool_nxside,tag=swPool_pzside] swPool_rot 4
scoreboard players set @e[tag=swPool_nxside,tag=swPool_nzside] swPool_rot 6
execute as @e[tag=swPool_cloth] store result entity @s ItemRotation int 1 run scoreboard players get @s swPool_rot
tag @e[tag=swPool_pxside] add swPool_side
tag @e[tag=swPool_nxside] add swPool_side
tag @e[tag=swPool_pzside] add swPool_side
tag @e[tag=swPool_nzside] add swPool_side
tag @e[tag=swPool_pxside,tag=swPool_nzside] add swPool_corner
tag @e[tag=swPool_pxside,tag=swPool_pzside] add swPool_corner
tag @e[tag=swPool_nxside,tag=swPool_pzside] add swPool_corner
tag @e[tag=swPool_nxside,tag=swPool_nzside] add swPool_corner


execute as @e[tag=swPool_side] run data merge entity @s {Item:{id:"minecraft:acacia_button",Count:1b,tag:{CustomModelData:10}}}
execute as @e[tag=swPool_potl] run data merge entity @s {Item:{id:"minecraft:acacia_button",Count:1b,tag:{CustomModelData:11}}}
execute as @e[tag=swPool_potr] run data merge entity @s {Item:{id:"minecraft:acacia_button",Count:1b,tag:{CustomModelData:12}}}
execute as @e[tag=swPool_corner] run data merge entity @s {Item:{id:"minecraft:acacia_button",Count:1b,tag:{CustomModelData:13}}}

#execute as @e[tag=swPool_cloth] at @s run setblock ~ ~-1 ~ glass
execute as @e[tag=swPool_cloth] at @s run setblock ~ ~ ~ iron_trapdoor[half=top]

execute as @e[tag=swPool_pxside] at @s run setblock ~1 ~ ~ minecraft:iron_trapdoor[open=true,facing=east]
execute as @e[tag=swPool_pzside] at @s run setblock ~ ~ ~1 minecraft:iron_trapdoor[open=true,facing=south]
execute as @e[tag=swPool_nxside] at @s run setblock ~-1 ~ ~ minecraft:iron_trapdoor[open=true,facing=west]
execute as @e[tag=swPool_nzside] at @s run setblock ~ ~ ~-1 minecraft:iron_trapdoor[open=true,facing=north]

execute unless entity @e[tag=swPool_sqh] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["swPool_sqh"],Duration:99999999}
execute unless entity @e[tag=swPool_thp1] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["swPool_thp1","swPool_thp"],Duration:99999999}
execute unless entity @e[tag=swPool_thp2] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["swPool_thp2","swPool_thp"],Duration:99999999}
execute unless entity @e[tag=swPool_rhp1] run summon minecraft:area_effect_cloud ~ ~ ~ {Duration:99999999,Tags:["swPool_rhp","swPool_rhp1"]}
execute unless entity @e[tag=swPool_rhp2] run summon minecraft:area_effect_cloud ~ ~ ~ {Duration:99999999,Tags:["swPool_rhp","swPool_rhp2"]}
execute unless entity @e[tag=swPool_rhp3] run summon minecraft:area_effect_cloud ~ ~ ~ {Duration:99999999,Tags:["swPool_rhp","swPool_rhp3"]}

tp @s ~ ~1 ~

scoreboard players operation TABLE swPool_sizex = @e[tag=swPool_pooltable,limit=1] swPool_sizex
scoreboard players operation TABLE swPool_sizez = @e[tag=swPool_pooltable,limit=1] swPool_sizez
execute as @e[tag=swPool_pooltable] store result score TABLE swPool_posx run data get entity @s Pos[0] 10000
execute as @e[tag=swPool_pooltable] store result score TABLE swPool_posz run data get entity @s Pos[2] 10000

tellraw @s [{"text":"Ready. Click to begin.","color":"gold","clickEvent":{"action":"run_command","value":"/function pool:classes/snooker/start"}},{"text":" Force singleplayer.","color":"yellow","clickEvent":{"action":"run_command","value":"/function pool:classes/snooker/startsp"}}]