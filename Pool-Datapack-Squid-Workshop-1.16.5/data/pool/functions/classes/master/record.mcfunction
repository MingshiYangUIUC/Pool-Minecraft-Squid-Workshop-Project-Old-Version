kill @e[tag=swPool_temppin]

execute as @e[tag=swPool_pool] at @s run summon armor_stand ~ ~ ~ {Tags:["swPool_temppin"],NoGravity:1b,Small:1b,Invisible:1b}
execute as @e[tag=swPool_temppin] at @s run data modify entity @s Tags set from entity @e[distance=0,limit=1,tag=swPool_pool] Tags




execute as @e[tag=swPool_pool] unless entity @s[nbt={ArmorItems:[{},{},{},{id:"minecraft:acacia_button"}]}] run tag @s add swPool_temppin

tag @e[tag=swPool_temppin] remove swPool_pool

execute as @a[tag=poolplay] run scoreboard players operation @s swPool_hidScore = @s swPool_Score

scoreboard players operation Opponent swPool_hidScore = Opponent swPool_Score

scoreboard players operation StrokeRec swPool_hidScore = Stroke swPool_hidScore