# res://Scripts/global.gd
extends Node

var ads = 0
var task_4_remove_task = Dictionary()
var task_4_interact = Dictionary()
var task_4_interact_email_button = ""
var task_2_remove_task = Dictionary()
var task_2_interact = Dictionary()
var task_2_interact_email_button = ""

func turn_task_2_interact():
	task_2_interact = true
func turn_task_4_interact():
	task_4_interact = true
func reset_var():
	ads = 0
	task_4_remove_task = []
	task_4_remove_task = Dictionary()
	task_4_interact = Dictionary()
	task_4_interact_email_button = ""
	task_2_remove_task = Dictionary()
	task_2_interact = Dictionary()
	task_2_interact_email_button = ""

var settings_file_path = "res://Scripts/Data/setting.json"

var user_tasks = {
	0: {
		"Name": "Manage my Social Page for a day",
		"Description": "Im gonna "
	}
}

var users = {
	"0": {
		"%user%status": "Real",
		"%user%profile": "1",
		"%user%banner": "1",
		"%user%": "Alice",
		"%@username%": "@alice",
		"%user%intro": "Exploring the world of code.",
		"%user%info": "Loves open-source projects.",
		"%user%check": "True",
		"%user%commentnumber": "2",
		"%user%blocks": {
			"0": {
				"comment": "Just started a new project!",
				"reply": "50",
				"repost": "20",
				"like": "150"
			},
			"1": {
				"comment": "Looking for collaborators.",
				"reply": "30",
				"repost": "10",
				"like": "100"
			}
		}
	},
	"1": {
		"%user%status": "Real",
		"%user%profile": "2",
		"%user%banner": "2",
		"%user%": "Bob",
		"%@username%": "@bob",
		"%user%intro": "Tech enthusiast.",
		"%user%info": "Enjoys building gadgets.",
		"%user%check": "False",
		"%user%commentnumber": "1",
		"%user%blocks": {
			"0": {
				"comment": "Check out my latest invention!",
				"reply": "40",
				"repost": "15",
				"like": "120"
			}
		}
	},
	"2": {
		"%user%status": "Real",
		"%user%profile": "3",
		"%user%banner": "3",
		"%user%": "Charlie",
		"%@username%": "@charlie",
		"%user%intro": "Music is life.",
		"%user%info": "Plays multiple instruments.",
		"%user%check": "True",
		"%user%commentnumber": "3",
		"%user%blocks": {
			"0": {
				"comment": "Just released a new track!",
				"reply": "60",
				"repost": "25",
				"like": "200"
			},
			"1": {
				"comment": "Live performance tonight.",
				"reply": "80",
				"repost": "30",
				"like": "250"
			},
			"2": {
				"comment": "Looking for a drummer.",
				"reply": "20",
				"repost": "10",
				"like": "90"
			}
		}
	},
	"3": {
		"%user%status": "Real",
		"%user%profile": "4",
		"%user%banner": "4",
		"%user%": "Diana",
		"%@username%": "@diana",
		"%user%intro": "Avid reader and writer.",
		"%user%info": "Published author.",
		"%user%check": "True",
		"%user%commentnumber": "2",
		"%user%blocks": {
			"0": {
				"comment": "My new book is out now!",
				"reply": "70",
				"repost": "35",
				"like": "300"
			},
			"1": {
				"comment": "Hosting a writing workshop.",
				"reply": "50",
				"repost": "20",
				"like": "180"
			}
		}
	},
	"4": {
		"%user%status": "Real",
		"%user%profile": "5",
		"%user%banner": "5",
		"%user%": "Ethan",
		"%@username%": "@ethan",
		"%user%intro": "Fitness fanatic.",
		"%user%info": "Personal trainer.",
		"%user%check": "False",
		"%user%commentnumber": "1",
		"%user%blocks": {
			"0": {
				"comment": "Join my fitness challenge!",
				"reply": "90",
				"repost": "40",
				"like": "350"
			}
		}
	},
	"5": {
		"%user%status": "Real",
		"%user%profile": "6",
		"%user%banner": "6",
		"%user%": "Fiona",
		"%@username%": "@fiona",
		"%user%intro": "Travel blogger.",
		"%user%info": "Sharing my adventures.",
		"%user%check": "True",
		"%user%commentnumber": "3",
		"%user%blocks": {
			"0": {
				"comment": "Exploring the mountains.",
				"reply": "100",
				"repost": "50",
				"like": "400"
			},
			"1": {
				"comment": "City lights at night.",
				"reply": "80",
				"repost": "30",
				"like": "320"
			},
			"2": {
				"comment": "Beach vibes.",
				"reply": "60",
				"repost": "25",
				"like": "280"
			}
		}
	},
	"6": {
		"%user%status": "Real",
		"%user%profile": "7",
		"%user%banner": "7",
		"%user%": "George",
		"%@username%": "@george",
		"%user%intro": "Food lover.",
		"%user%info": "Chef and recipe creator.",
		"%user%check": "False",
		"%user%commentnumber": "2",
		"%user%blocks": {
			"0": {
				"comment": "New recipe: Spaghetti Carbonara.",
				"reply": "110",
				"repost": "45",
				"like": "420"
			},
			"1": {
				"comment": "Tips for perfecting your steak.",
				"reply": "90",
				"repost": "35",
				"like": "380"
			}
		}
	},
	"7": {
		"%user%status": "Real",
		"%user%profile": "8",
		"%user%banner": "8",
		"%user%": "Hannah",
		"%@username%": "@hannah",
		"%user%intro": "Fashion enthusiast.",
		"%user%info": "Stylist and designer.",
		"%user%check": "True",
		"%user%commentnumber": "1",
		"%user%blocks": {
			"0": {
				"comment": "Summer collection launch!",
				"reply": "120",
				"repost": "50",
				"like": "450"
			}
		}
	},
	 "8": {
		"%user%status": "Real",
		"%user%profile": "9",
		"%user%banner": "9",
		"%user%": "Irene",
		"%@username%": "@irene",
		"%user%intro": "Nature photographer.",
		"%user%info": "Capturing the beauty of the outdoors.",
		"%user%check": "True",
		"%user%commentnumber": "2",
		"%user%blocks": {
			"0": {
				"comment": "Sunset over the hills.",
				"reply": "130",
				"repost": "60",
				"like": "500"
			},
			"1": {
				"comment": "Morning dew on leaves.",
				"reply": "110",
				"repost": "55",
				"like": "460"
			}
		}
	},
	"9": {
		"%user%status": "Real",
		"%user%profile": "10",
		"%user%banner": "10",
		"%user%": "Jack",
		"%@username%": "@jack",
		"%user%intro": "Gaming streamer.",
		"%user%info": "Live every evening.",
		"%user%check": "False",
		"%user%commentnumber": "1",
		"%user%blocks": {
			"0": {
				"comment": "Join me for a new adventure tonight!",
				"reply": "140",
				"repost": "65",
				"like": "520"
			}
		}
# Dictionary containing power-up data
var power_ups = {
	0: {
		"Name": "Firewall Shield",
		"Description": "Blocks one phishing attack automatically."
	},
	1: {
		"Name": "Phish Finder",
		"Description": "Highlights phishing links for 10 seconds."
	},
	2: {
		"Name": "Email Analyzer",
		"Description": "Shows detailed sender information to detect suspicious emails."
	},
	3: {
		"Name": "Time Freeze",
		"Description": "Pauses all incoming emails for 5 seconds to analyze threats."
	},
	4: {
		"Name": "Trusted Contacts",
		"Description": "Marks emails from verified senders as safe automatically."
	},
	5: {
		"Name": "Decryption Key",
		"Description": "Decodes hidden text in suspicious links or attachments."
	},
	6: {
		"Name": "Anti-Malware Drone",
		"Description": "Scans and neutralizes malicious attachments instantly."
	},
	7: {
		"Name": "Security Quiz Boost",
		"Description": "Provides hints for identifying phishing characteristics in emails."
	},
	8: {
		"Name": "Link Validator",
		"Description": "Displays the true URL behind shortened links or disguised text."
	},
	9: {
		"Name": "Double Verification",
		"Description": "Prompts a second opinion for risky actions, reducing errors."
	}
}
