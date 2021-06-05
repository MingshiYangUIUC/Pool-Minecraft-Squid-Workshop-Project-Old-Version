function pool:classes/table/clear

tellraw @s [{"text":"Do nothing if you don't want to place a new table."}]

tellraw @s [{"text":"Or: Choose x table size: "},{"text":"04 ","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s swPool_sizex 13750"}},{"text":"06 ","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s swPool_sizex 23750"}},{"text":"08 ","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s swPool_sizex 33750"}},{"text":"10 ","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s swPool_sizex 43750"}},{"text":"12 ","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s swPool_sizex 53750"}},{"text":"14 ","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s swPool_sizex 63750"}},{"text":"Reset ","color":"white","clickEvent":{"action":"run_command","value":"/scoreboard players reset @s swPool_sizex"}}]


tellraw @s [{"text":"    Choose z table size: "},{"text":"04 ","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s swPool_sizez 13750"}},{"text":"06 ","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s swPool_sizez 23750"}},{"text":"08 ","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s swPool_sizez 33750"}},{"text":"10 ","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s swPool_sizez 43750"}},{"text":"12 ","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s swPool_sizez 53750"}},{"text":"14 ","color":"green","clickEvent":{"action":"run_command","value":"/scoreboard players set @s swPool_sizez 63750"}},{"text":"Reset ","color":"white","clickEvent":{"action":"run_command","value":"/scoreboard players reset @s swPool_sizez"}}]


tellraw @s [{"text":"    Suggested sizes: ","color":"white"},{"text":"4*6(Easy) ","color":"green"},{"text":"6*10(Moderate) ","color":"yellow"},{"text":"8*14(Hard)","color":"dark_red"}]

tellraw @s [{"text":"Click ","color":"aqua","clickEvent":{"action":"run_command","value":"/function pool:classes/table/check"}},{"text":"to check your choice and begin.","color":"aqua"}]