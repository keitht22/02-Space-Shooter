extends VideoPlayer

func _ready():
	set_process(true)
	
func _process(_delta):
	if self.is_playing() == false:
		play()
