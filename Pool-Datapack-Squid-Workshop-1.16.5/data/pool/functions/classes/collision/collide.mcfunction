# use the two velocities, calculate the velocity after the collision
#swPool_vx and swPool_vz is conserved for the calculation while the magnitude is set to zero previously
#tags for the two objects are c1 and c2
#tags for the two intermediate objects are t1 and t2
#summon two new object for stationary frame calculation using swPool_vr only, and calculate resulting velocities
#add back the initial velocity of c2, which is stored as component in swPool_vx, swPool_vz of c2



#set uuuuuuuuuuuuup
tag @s add swPool_colliding

#set information of first hit ball to swPool_player
tag @s add swPool_c
tag @e[tag=swPool_c2] add swPool_c
execute unless entity @a[tag=swPool_hitcue,scores={swPool_firsthit=1..7}] if entity @e[tag=swPool_c,tag=swPool_cue,limit=1] if entity @e[tag=swPool_c,tag=swPool_red,limit=1] run scoreboard players set @a[tag=swPool_hitcue] swPool_firsthit 1
execute unless entity @a[tag=swPool_hitcue,scores={swPool_firsthit=1..7}] if entity @e[tag=swPool_c,tag=swPool_cue,limit=1] if entity @e[tag=swPool_c,tag=swPool_yellow,limit=1] run scoreboard players set @a[tag=swPool_hitcue] swPool_firsthit 2
execute unless entity @a[tag=swPool_hitcue,scores={swPool_firsthit=1..7}] if entity @e[tag=swPool_c,tag=swPool_cue,limit=1] if entity @e[tag=swPool_c,tag=swPool_green,limit=1] run scoreboard players set @a[tag=swPool_hitcue] swPool_firsthit 3
execute unless entity @a[tag=swPool_hitcue,scores={swPool_firsthit=1..7}] if entity @e[tag=swPool_c,tag=swPool_cue,limit=1] if entity @e[tag=swPool_c,tag=swPool_brown,limit=1] run scoreboard players set @a[tag=swPool_hitcue] swPool_firsthit 4
execute unless entity @a[tag=swPool_hitcue,scores={swPool_firsthit=1..7}] if entity @e[tag=swPool_c,tag=swPool_cue,limit=1] if entity @e[tag=swPool_c,tag=swPool_blue,limit=1] run scoreboard players set @a[tag=swPool_hitcue] swPool_firsthit 5
execute unless entity @a[tag=swPool_hitcue,scores={swPool_firsthit=1..7}] if entity @e[tag=swPool_c,tag=swPool_cue,limit=1] if entity @e[tag=swPool_c,tag=swPool_pink,limit=1] run scoreboard players set @a[tag=swPool_hitcue] swPool_firsthit 6
execute unless entity @a[tag=swPool_hitcue,scores={swPool_firsthit=1..7}] if entity @e[tag=swPool_c,tag=swPool_cue,limit=1] if entity @e[tag=swPool_c,tag=swPool_black,limit=1] run scoreboard players set @a[tag=swPool_hitcue] swPool_firsthit 7
tag @e[tag=swPool_c] remove swPool_c


#record parameters
tag @e[tag=swPool_rhp1] add swPool_t1
execute at @s run tp @e[tag=swPool_t1,limit=1] ~ ~ ~
tag @e[tag=swPool_rhp2] add swPool_t2
execute at @e[tag=swPool_c2,limit=1] run tp @e[tag=swPool_t2,limit=1] ~ ~ ~
tag @e[tag=swPool_rhp3] add swPool_facerc
execute at @s run tp @e[tag=swPool_facerc,limit=1] ~ ~ ~

#execute at @s run summon area_effect_cloud ^ ^ ^ {Tags:["swPool_t1"],Duration:1}
#execute at @e[tag=swPool_c2,limit=1] run summon area_effect_cloud ^ ^ ^ {Tags:["swPool_t2"],Duration:1}
#execute at @s run summon area_effect_cloud ^ ^ ^ {Tags:["swPool_facerc"],Duration:1}



scoreboard players operation @e[tag=swPool_t1,limit=1] swPool_vx = @s swPool_vrx
scoreboard players operation @e[tag=swPool_t1,limit=1] swPool_vz = @s swPool_vrz
execute as @e[tag=swPool_t1,limit=1] at @s run function pool:classes/physics/vcombine

#get angle (can be positive or negative) which is swPool_drot score of t1

execute as @e[tag=swPool_facerc,limit=1] at @s run tp @s ~ ~ ~ facing entity @e[tag=swPool_t2,limit=1]
execute as @e[tag=swPool_t1,limit=1] store result score @s swPool_drot run data get entity @s Rotation[0] 10000
execute as @e[tag=swPool_facerc,limit=1] store result score @s swPool_rot run data get entity @s Rotation[0] 10000
scoreboard players operation @e[tag=swPool_t1,limit=1] swPool_drot -= @e[tag=swPool_facerc,limit=1] swPool_rot

#swPool_v of t2 is vi*cos(dr) and direction is along the line between the two
scoreboard players set @s swPool_var04 10000
scoreboard players operation @s swPool_var00 = @e[tag=swPool_t1] swPool_drot
execute at @s run function pool:classes/physics/cosdeg
scoreboard players operation @e[tag=swPool_t2,limit=1] swPool_v = @e[tag=swPool_t1,limit=1] swPool_v
scoreboard players operation @e[tag=swPool_t2,limit=1] swPool_v /= @s swPool_var04
scoreboard players operation @e[tag=swPool_t2,limit=1] swPool_v *= @s swPool_var00
data modify entity @e[tag=swPool_t2,limit=1] Rotation set from entity @e[tag=swPool_facerc,limit=1] Rotation


#rotate facerc back by 90 so that it faces towards final direction of t1, and swPool_v of t1 is vi*sin(dr)
execute if entity @e[tag=swPool_t1,limit=1,scores={swPool_drot=..0}] as @e[tag=swPool_facerc,limit=1] at @s run tp @s ~ ~ ~ ~90 ~
execute if entity @e[tag=swPool_t1,limit=1,scores={swPool_drot=1..}] as @e[tag=swPool_facerc,limit=1] at @s run tp @s ~ ~ ~ ~90 ~
scoreboard players operation @s swPool_var00 = @e[tag=swPool_t1] swPool_drot
execute at @s run function pool:classes/physics/sindeg
scoreboard players operation @e[tag=swPool_t1,limit=1] swPool_v = @e[tag=swPool_t1,limit=1] swPool_v
scoreboard players operation @e[tag=swPool_t1,limit=1] swPool_v /= @s swPool_var04
scoreboard players operation @e[tag=swPool_t1,limit=1] swPool_v *= @s swPool_var00
data modify entity @e[tag=swPool_t1,limit=1] Rotation set from entity @e[tag=swPool_facerc,limit=1] Rotation

#separate the x,z component, add back the x,z component of c2, then combine back
execute as @e[tag=swPool_t1,limit=1] at @s run function pool:classes/physics/vseparate
execute as @e[tag=swPool_t2,limit=1] at @s run function pool:classes/physics/vseparate
scoreboard players operation @e[tag=swPool_t1,limit=1] swPool_vx += @e[tag=swPool_c2,limit=1] swPool_vx
scoreboard players operation @e[tag=swPool_t1,limit=1] swPool_vz += @e[tag=swPool_c2,limit=1] swPool_vz
scoreboard players operation @e[tag=swPool_t2,limit=1] swPool_vx += @e[tag=swPool_c2,limit=1] swPool_vx
scoreboard players operation @e[tag=swPool_t2,limit=1] swPool_vz += @e[tag=swPool_c2,limit=1] swPool_vz
execute as @e[tag=swPool_t1,limit=1] at @s run function pool:classes/physics/vcombine
execute as @e[tag=swPool_t2,limit=1] at @s run function pool:classes/physics/vcombine


#merge stuff back to c1, c2
scoreboard players operation @e[tag=swPool_c1,limit=1] swPool_v = @e[tag=swPool_t1,limit=1] swPool_v
scoreboard players operation @e[tag=swPool_c2,limit=1] swPool_v = @e[tag=swPool_t2,limit=1] swPool_v
data modify entity @e[tag=swPool_c1,limit=1] Rotation set from entity @e[tag=swPool_t1,limit=1] Rotation
data modify entity @e[tag=swPool_c2,limit=1] Rotation set from entity @e[tag=swPool_t2,limit=1] Rotation

#reset t1,t2,facerc
tag @e[tag=swPool_rhp1] remove swPool_t1
tag @e[tag=swPool_rhp2] remove swPool_t2
tag @e[tag=swPool_rhp3] remove swPool_facerc
#


#reset swPool_time, swPool_vr
scoreboard players reset @s swPool_time
scoreboard players reset @e[tag=swPool_c1] swPool_vx
scoreboard players reset @e[tag=swPool_c1] swPool_vz
scoreboard players reset @e[tag=swPool_c1] swPool_vrx
scoreboard players reset @e[tag=swPool_c1] swPool_vrz
scoreboard players reset @e[tag=swPool_c2] swPool_vx
scoreboard players reset @e[tag=swPool_c2] swPool_vz

#add a drag as energy loss
execute as @e[tag=swPool_c2,limit=1] run function pool:classes/motion/drag

playsound minecraft:block.stone.break ambient @a ~ ~ ~ 1 1