execute if entity @s[scores={swPool_sizex=13750..63750}] if entity @s[scores={swPool_sizez=13750..63750}] run tag @s add swPool_success
execute if entity @s[scores={swPool_sizex=13750}] if entity @s[scores={swPool_sizez=13750}] run tag @s remove swPool_success
execute unless entity @s[scores={swPool_sizex=13750}] unless entity @s[scores={swPool_sizex=23750}] unless entity @s[scores={swPool_sizex=33750}] unless entity @s[scores={swPool_sizex=43750}] unless entity @s[scores={swPool_sizex=53750}] unless entity @s[scores={swPool_sizex=63750}] run tag @s remove swPool_success
execute unless entity @s[scores={swPool_sizez=13750}] unless entity @s[scores={swPool_sizez=23750}] unless entity @s[scores={swPool_sizez=33750}] unless entity @s[scores={swPool_sizez=43750}] unless entity @s[scores={swPool_sizez=53750}] unless entity @s[scores={swPool_sizez=63750}] run tag @s remove swPool_success

tellraw @s[tag=!swPool_success] [{"text":"Click ","color":"red","clickEvent":{"action":"run_command","value":"/function pool:classes/table/start"}},{"text":"to try a different setting... Table can't be too small.","color":"red"}]

execute unless entity @s[nbt={OnGround:1b}] run tellraw @s [{"text":"Please stand on the ground, click and try again.","color":"red","clickEvent":{"action":"run_command","value":"/function pool:classes/table/start"}}]
execute unless entity @s[nbt={OnGround:1b}] run tag @s remove swPool_success

execute if entity @s[tag=swPool_success] positioned ~ ~ ~ run function pool:classes/table/set