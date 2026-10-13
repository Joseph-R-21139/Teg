extends Node

#These are the global veriables that the rest of the player code runs off

#reads if the players are "in"
var player_1_in = true

#This locks the players either before or during the game
var player_1_paused = false
var player_2_paused = false
var can_tag = true

#This is responsable for the play stage
var game_stage = "forrest"
