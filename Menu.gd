extends Node

@onready var menu = $Menu
@onready var options = $Options
@onready var video = $Video
@onready var audio = $Audio


# Calls toggle whenever esc key is pressed
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle()

# toggle allows user to show and pause game
func toggle():
	
	get_tree().paused = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Function that starts a new game
func _on_new_game_button_pressed():
	get_tree().change_scene("world.tscn")

# Function that calls the options menu
func _on_options_button_pressed():
	show_and_hide(options, menu)

# Function that allows user to show and hide an item
func show_and_hide(first, second):
	first.show()
	second.hide()
	
func _on_quit_button_pressed():
	get_tree().quit() # Replace with function body.




func _on_video_button_pressed():
	show_and_hide(video, options)



func _on_audio_button_pressed():
	show_and_hide(audio, options)


func _on_back_options_button_pressed():
	show_and_hide(menu, options)


func _on_back_from_video_pressed():
	show_and_hide(options, video)


func _on_back_from_audio_pressed():
	show_and_hide(options, audio)


func _on_full_screen_check_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_borderless_check_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_master_slider_value_changed(value):
	volume(0, value)
	
	
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)


func _on_music_slider_value_changed(value):
	volume(1, value)



func _on_sound_fx_slider_value_changed(value):
	volume(2, value)
