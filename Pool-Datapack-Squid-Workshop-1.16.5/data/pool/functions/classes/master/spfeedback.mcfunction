scoreboard players operation @s swPool_Score -= Opponent swPool_Score
#scoreboard players operation @s swPool_Score -= 27
#scoreboard players operation Stroke swPool_Score -= 8

#execute if score TABLE swPool_dl matches 23750..43749 run scoreboard players set Nred swPool_var00 3
#execute if score TABLE swPool_dl matches 43750..53749 run scoreboard players set Nred swPool_var00 10
#execute if score TABLE swPool_dl matches 53750.. run tag scoreboard players set Nred swPool_var00 15

scoreboard players set C1000 swPool_var00 1000
scoreboard players operation @s swPool_Score *= C1000 swPool_var00
#scoreboard players operation @s swPool_Score /= Nred swPool_var00
scoreboard players operation @s swPool_Score /= Stroke swPool_Score

#S+4000
#S 3200
#S-2600
#A+2000
#A 1600
#A-1300
#B+1000
#B 800
#B-650
#C+500
#C 350
#C-200
#D+100
#D 50
#D-0
#F <0

tellraw @s[scores={swPool_Score=4000..}] [{"text":"Your Ranking: [","color":"white"},{"text":"S+","color":"gold"},{"text":"].","color":"white"}]
tellraw @s[scores={swPool_Score=3200..3999}] [{"text":"Your Ranking: [","color":"white"},{"text":"S","color":"gold"},{"text":"].","color":"white"}]
tellraw @s[scores={swPool_Score=2600..3199}] [{"text":"Your Ranking: [","color":"white"},{"text":"S-","color":"gold"},{"text":"].","color":"white"}]
tellraw @s[scores={swPool_Score=2000..2599}] [{"text":"Your Ranking: [","color":"white"},{"text":"A+","color":"yellow"},{"text":"].","color":"white"}]
tellraw @s[scores={swPool_Score=1600..1999}] [{"text":"Your Ranking: [","color":"white"},{"text":"A","color":"yellow"},{"text":"].","color":"white"}]
tellraw @s[scores={swPool_Score=1300..1599}] [{"text":"Your Ranking: [","color":"white"},{"text":"A-","color":"yellow"},{"text":"].","color":"white"}]
tellraw @s[scores={swPool_Score=1000..1299}] [{"text":"Your Ranking: [","color":"white"},{"text":"B+","color":"green"},{"text":"].","color":"white"}]
tellraw @s[scores={swPool_Score=800..999}] [{"text":"Your Ranking: [","color":"white"},{"text":"B","color":"green"},{"text":"].","color":"white"}]
tellraw @s[scores={swPool_Score=650..799}] [{"text":"Your Ranking: [","color":"white"},{"text":"B-","color":"green"},{"text":"].","color":"white"}]
tellraw @s[scores={swPool_Score=500..649}] [{"text":"Your Ranking: [","color":"white"},{"text":"C+","color":"blue"},{"text":"].","color":"white"}]
tellraw @s[scores={swPool_Score=350..499}] [{"text":"Your Ranking: [","color":"white"},{"text":"C","color":"blue"},{"text":"].","color":"white"}]
tellraw @s[scores={swPool_Score=200..349}] [{"text":"Your Ranking: [","color":"white"},{"text":"C-","color":"blue"},{"text":"].","color":"white"}]
tellraw @s[scores={swPool_Score=100..199}] [{"text":"Your Ranking: [","color":"white"},{"text":"D+","color":"light_purple"},{"text":"].","color":"white"}]
tellraw @s[scores={swPool_Score=50..99}] [{"text":"Your Ranking: [","color":"white"},{"text":"D","color":"light_purple"},{"text":"].","color":"white"}]
tellraw @s[scores={swPool_Score=0..49}] [{"text":"Your Ranking: [","color":"white"},{"text":"D-","color":"light_purple"},{"text":"].","color":"white"}]
tellraw @s[scores={swPool_Score=..-1}] [{"text":"Your Ranking: [","color":"white"},{"text":"F","color":"dark_red"},{"text":"].","color":"white"}]