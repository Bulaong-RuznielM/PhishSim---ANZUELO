extends Node

func showinformation(index):
	$UpgradeInfo/Upgrade_Info_Title.text = Global.power_ups[index]["Name"]
	$UpgradeInfo/Upgrade_Info_Description.text = Global.power_ups[index]["Description"]
func _ready():
	showinformation(0)

func _on_upgrade_1_mouse_entered() -> void:
	showinformation(0)

func _on_upgrade_2_mouse_entered() -> void:
	showinformation(1)

func _on_upgrade_3_mouse_entered() -> void:
	showinformation(2)

func _on_upgrade_4_mouse_entered() -> void:
	showinformation(3)

func _on_upgrade_5_mouse_entered() -> void:
	showinformation(4)

func _on_upgrade_6_mouse_entered() -> void:
	showinformation(5)

func _on_upgrade_7_mouse_entered() -> void:
	showinformation(6)

func _on_upgrade_8_mouse_entered() -> void:
	showinformation(7)

func _on_upgrade_9_mouse_entered() -> void:
	showinformation(8)

func _on_upgrade_10_mouse_entered() -> void:
	showinformation(9)
