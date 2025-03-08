extends Node

# Global dictionary to store tasks for the PhishSim game.
# Each key represents a unique task ID and maps to a dictionary with the following properties:
#   - title: The name of the task.
#   - description: A brief description of what the task entails.
#   - reward: The money earned upon successful completion (zero for phishing events).
#   - is_phishing: A flag to indicate if the task is a phishing/distracting event.
#   - difficulty: A label to describe how challenging the task or event is.
#   - completed: A flag to track if the task has been finished.

var tasks: Dictionary = {
	"task_001": {
		"title": "Deliver Package",
		"description": "Deliver a package to a client in the downtown area.",
		"reward": 150,
		"is_phishing": false,
		"difficulty": "medium",
		"completed": false,
	},
	"task_002": {
		"title": "Install Software Update",
		"description": "Install the latest software update on the office computers.",
		"reward": 100,
		"is_phishing": false,
		"difficulty": "easy",
		"completed": false,
	},
	"task_003": {
		"title": "Data Backup",
		"description": "Backup all important data from the server to an external drive.",
		"reward": 200,
		"is_phishing": false,
		"difficulty": "hard",
		"completed": false,
	},
	"phish_001": {
		"title": "Suspicious Email Alert",
		"description": "A phishing email has arrived with a suspicious link. Verify its legitimacy!",
		"reward": 0,
		"is_phishing": true,
		"difficulty": "easy",
		"completed": false,
	},
	"phish_002": {
		"title": "Fake Pop-up Warning",
		"description": "A pop-up warning is distracting you. Check if it's a genuine system alert or a phishing trick!",
		"reward": 0,
		"is_phishing": true,
		"difficulty": "medium",
		"completed": false,
	}
}

# Function to retrieve a task by its ID.
func get_task(task_id: String) -> Dictionary:
	if task_id in tasks:
		return tasks[task_id]
	return {}

# Function to mark a task as completed.
func complete_task(task_id: String) -> void:
	if task_id in tasks:
		tasks[task_id]["completed"] = true
