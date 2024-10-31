extends Control  # Assuming the script is attached to MainScene (Control)

@onready var pop_up_ad = $TextureRect  # Update this path to your TextureRect node

func _ready():
	# Ensure the pop-up ad is hidden initially
	pop_up_ad.visible = false
	
	# Set the size of the TextureRect (scale to desired size)
	pop_up_ad.scale = Vector2(1, 1)  # Adjust this for your desired size

	# Position the TextureRect at the center of the visible camera/view
	center_popup()

	# Create a timer to show the pop-up every 2 seconds
	var show_timer = Timer.new()
	add_child(show_timer)
	show_timer.wait_time = 2  # Show every 2 seconds
	show_timer.autostart = true
	show_timer.connect("timeout", Callable(self, "show_pop_up"))

func center_popup():
	# Get the size of the viewport (visible camera area)
	var viewport_size = get_viewport_rect().size
	
	# Set the position of the pop-up to the center of the screen
	pop_up_ad.position = (viewport_size / 2) - (pop_up_ad.get_size() * pop_up_ad.scale / 2)

# Function to handle showing the pop-up ad
func show_pop_up():
	# Re-center the popup before making it visible
	center_popup()
	
	pop_up_ad.visible = true  # Show the pop-up ad
	print("Successfully Popped Up")  # Print message to console
	
	# Create a timer to close the pop-up after 6 seconds
	var close_timer = Timer.new()
	add_child(close_timer)
	close_timer.wait_time = 6  # Close after 6 seconds
	close_timer.one_shot = true
	close_timer.connect("timeout", Callable(self, "close_pop_up"))
	close_timer.start()

func close_pop_up():
	pop_up_ad.visible = false  # Hide the pop-up ad
