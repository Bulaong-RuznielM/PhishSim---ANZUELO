extends Control

func _on_upgrade_1_mouse_entered() -> void:
  $UpgradeInfo/Upgrade_Info_Title.text = Global.power_ups[0]["Name"]
  $UpgradeInfo/Upgrade_Info_Description.text = Global.power_ups[0]["Description"]

func _on_upgrade_2_mouse_entered() -> void:
  $UpgradeInfo/Upgrade_Info_Title.text = Global.power_ups[1]["Name"]
  $UpgradeInfo/Upgrade_Info_Description.text = Global.power_ups[1]["Description"]

func _on_upgrade_3_mouse_entered() -> void:
  $UpgradeInfo/Upgrade_Info_Title.text = Global.power_ups[2]["Name"]
  $UpgradeInfo/Upgrade_Info_Description.text = Global.power_ups[2]["Description"]

func _on_upgrade_4_mouse_entered() -> void:
  $UpgradeInfo/Upgrade_Info_Title.text = Global.power_ups[3]["Name"]
  $UpgradeInfo/Upgrade_Info_Description.text = Global.power_ups[3]["Description"]  # Assuming Upgrade_Upscription displays description

func _on_upgrade_5_mouse_entered() -> void:
  $UpgradeInfo/Upgrade_Info_Title.text = Global.power_ups[4]["Name"]
  $UpgradeInfo/Upgrade_Info_Description.text = Global.power_ups[4]["Description"]

func _on_upgrade_6_mouse_entered() -> void:
  $UpgradeInfo/Upgrade_Info_Title.text = Global.power_ups[5]["Name"]
  $UpgradeInfo/Upgrade_Info_Description.text = Global.power_ups[5]["Description"]

func _on_upgrade_7_mouse_entered() -> void:
  $UpgradeInfo/Upgrade_Info_Title.text = Global.power_ups[6]["Name"]
  $UpgradeInfo/Upgrade_Info_Description.text = Global.power_ups[6]["Description"]

func _on_upgrade_8_mouse_entered() -> void:
  $UpgradeInfo/Upgrade_Info_Title.text = Global.power_ups[7]["Name"]
  $UpgradeInfo/Upgrade_Info_Description.text = Global.power_ups[7]["Description"]

func _on_upgrade_9_mouse_entered() -> void:
  $UpgradeInfo/Upgrade_Info_Title.text = Global.power_ups[8]["Name"]
  $UpgradeInfo/Upgrade_Info_Description.text = Global.power_ups[8]["Description"]

func _on_upgrade_10_mouse_entered() -> void:
  $UpgradeInfo/Upgrade_Info_Title.text = Global.power_ups[9]["Name"]
  $UpgradeInfo/Upgrade_Info_Description.text = Global.power_ups[9]["Description"]
