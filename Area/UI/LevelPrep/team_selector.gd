extends Control

# to do - signal items
signal PlayerReady(team)

@export var teams: Array = []
@export var units: Array[Unit] = [
	null, null, null, null, null, null
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_team_info(new_teams: Array):
	teams = new_teams
	for team in teams:
		print(team)
		# Add icon for each team
		var icn = ResourceLoader.load("res://Common/UI/Toggles/content_toggle_button.tscn").instantiate()
		$ScrollContainer/HBoxContainer.add_child(icn)
		
		# If a unit slot is unfilled, set its id to -1. This will cause the search to fail without a crash
		if team.unit1 == null:
			team.unit1 = -1
		if team.unit2 == null:
			team.unit2 = -1
		if team.unit3 == null:
			team.unit3 = -1
		if team.unit4 == null:
			team.unit4 = -1
		if team.unit5 == null:
			team.unit5 = -1
	# Set first team to be active
	set_active_team(0)

func set_active_team(id: int):
	$SquadNameBG/SquadName.text = teams[id].name
	# Get each unit in the team
	var unit_1 = Lookups.get_unit_by_ID(teams[id].unit1)
	var unit_2 = Lookups.get_unit_by_ID(teams[id].unit2)
	var unit_3 = Lookups.get_unit_by_ID(teams[id].unit3)
	var unit_4 = Lookups.get_unit_by_ID(teams[id].unit4)
	var unit_5 = Lookups.get_unit_by_ID(teams[id].unit5)
	
	# Check that each unit is valid. If so, display it and save it
	if unit_1.valid:
		display_unit(unit_1.unit, 1)
		units[0] = unit_1.unit
	if unit_2.valid:
		display_unit(unit_2.unit, 2)
		units[1] = unit_2.unit
	if unit_3.valid:
		display_unit(unit_3.unit, 3)
		units[2] = unit_3.unit
	if unit_4.valid:
		display_unit(unit_4.unit, 4)
		units[3] = unit_4.unit
	if unit_5.valid:
		display_unit(unit_5.unit, 5)
		units[4] = unit_5.unit
	
	# to do - work on switch controls, list leader/friend skills
	# let there be light!
	$ScrollContainer/HBoxContainer.get_child(id).turn_on()

func display_unit(unit: Unit, place: int):
	print(unit)
	match place:
		1:
			$UnitThumbnail.icon = unit.thumbnail
			# to do -- leader stuff
		2:
			$UnitThumbnail2.icon = unit.thumbnail
		3:
			$UnitThumbnail3.icon = unit.thumbnail
		4:
			$UnitThumbnail4.icon = unit.thumbnail
		5:
			$UnitThumbnail5.icon = unit.thumbnail
		# to do - friend stuff


func _on_begin_clicked(id):
	#send the signal with the active units
	emit_signal("PlayerReady", units)
